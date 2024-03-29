# Debugging in GoLand

<!-- panels:start -->

<!-- div:right-panel -->

![GoLand icon](../\_images/icon-goland.svg ":class=no-shadow")

> [JetBrains GoLand](https://www.jetbrains.com/go/) is an IDE for the Go
> programming language.

<!-- div:left-panel -->

Running Wharf locally is a hassle, as every code change requires you to rebuild
the entire Docker images, and you cannot connect a debugger.

It is possible to hook up [JetBrains GoLand](https://www.jetbrains.com/go/) to
accomplish this.

?> To those that have experience with the container tools in Visual Studio will
feel right at home.

<!-- panels:end -->

## 1. Install GoLand

Download GoLand from this link: <https://www.jetbrains.com/go/download>

## 2. Open project you want to debug

Let's say it's the main API, then you open the `api` project using GoLand.

## 3. Modify the Dockerfile

<!-- panels:start -->

<!-- div:left-panel -->

1. In first step of multistage build we need to install Delve debugger:
   <https://github.com/go-delve/delve>

2. Set additional flags in `go build` command: `-gcflags "all=-N -l"`

3. In second step of multistage build use `debian:buster` image as base
   image. `scratch` and `alpine` images are throwing errors.

4. Copy needed files from first stage by running
   `COPY --from=build /go/bin/dlv /`

5. To run Delve during container start change entrypoint of container to:

   ```dockerfile
   ENTRYPOINT ["/dlv"]
   ```

<!-- div:right-panel language-diff-markdown diff-highlight -->

Changes as a "diff":

```diff
 FROM golang:1.13.4 AS build
 WORKDIR /src
 ENV GO111MODULE=on
+RUN go get github.com/go-delve/delve/cmd/dlv
 RUN go get -u github.com/swaggo/swag/cmd/swag@v1.6.3
 COPY . /src
-RUN swag init && CGO_ENABLED=0 go build -o main \
+RUN swag init && CGO_ENABLED=0 go build -gcflags "all=-N -1" -o main \
     && go test

-FROM scratch AS final
+FROM debian:buster AS final
 WORKDIR /app
+COPY --from=build /go/bin/dlv /
 COPY --from=build /src/main /app/
-ENTRYPOINT ["/app/main"]
+ENTRYPOINT ["/dlv"]
```

<!-- panels:end -->

## 4. Modify the docker-compose.yaml

<!-- panels:start -->

<!-- div:left-panel -->

1. To route traffic to delve debugger add 40000 port routing in ports part:

   ```yaml
   ports:
     - "40000:40000"
   ```

2. Add following parts on base level of api compose part.

   ```yaml
   security_opt:
     - "seccomp:unconfined"
   cap_add:
     - SYS_PTRACE
   command: >-
     --listen=:40000
     --headless=true
     --api-version=2
     --accept-multiclient
     exec /app/main
   ```

   You can add more arguments to the `command` by appending them to the end,
   but keep in mind that you have to add `--` after `/app/main`. Example of
   adding the argument `--loglevel=trace`:

   ```yaml
    command: >-
      --listen=:40000
      --headless=true
      --api-version=2
      --accept-multiclient
      exec /app/main
      --
      --loglevel=trace
   ```

<!-- div:right-panel -->

Changes as a "diff":

```diff
@@ -31,6 +34,7 @@ services:
   api:
     build:
       context: api
     ports:
     - "5003:8083"
+    - "40000:40000"
     networks:
       - rabbitmq
       - db
@@ -63,6 +65,10 @@ services:
     - WHARF_INSTANCE=local
     volumes:
     - ./api/dev/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt
+    security_opts:
+      - "seccomp:unconfined"
+    cap_add:
+      - SYS_PTRACE
+    command: >-
+      --listen=:40000
+      --headless=true
+      --api-version=2
+      --accept-multiclient
+      exec /app/main

   import-gitlab:
     build:
       context: gitlab
```

<!-- panels:end -->

## 5. Rebuild image

Rebuild images and (re)start the services.

```bash
# docker-compose up --build --force-recreate --no-deps -d <debugged service name from dockercompose>

# For the API, that would be:
docker-compose up --build --force-recreate --no-deps -d api
```

## 6. Restart normally

Run Wharf normally with

```bash
docker-compose up
```

If everything is set up properly you should see that app container is run with
delve command and 40000 port is forwarded. See the screenshot:

![Logs from docker ps](../\_images/debugging-in-goland/running-app.png)

## 7. Connect GoLand for debugging

When app is running properly we're ready to create debugging configuration in
Goland.

1. Open Goland editor and click following dropdown. Pick `Edit configurations`
   option.

   !["Configurations" button](../\_images/debugging-in-goland/edit-conf1.png)

2. You should see window similar to that one below. Click small plus button on
   top-left corner of the screen.

   !["Add new configuration" button](../\_images/debugging-in-goland/edit-conf2.png)

3. Pick "Go Remote" configuration

   !["Go Remote" configuration option](../\_images/debugging-in-goland/edit-conf3.png)

4. Add `localhost` as host and port `40000` as port. Give the name to that
   configuration. Previously I named mine `debug`. Apply changes.

   !["Host" and "Port" configs for "Go Remote"](../\_images/debugging-in-goland/edit-conf4.png)

5. Now you should be able to pick that configuration (1) and start debugging by
   pressing green bug sign (2)

   ![Two ways to "run with debugging"](../\_images/debugging-in-goland/edit-conf5.png)

6. If debugger will attach succesfully you will be able to see `connected`
   status. And your breakpoints will be hit :)

   !["Debug" panel with breakpoint and local variables](../\_images/debugging-in-goland/breakpoint.png)

Done!
