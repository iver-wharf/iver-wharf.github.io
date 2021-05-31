# Hot reloading web

> "Hot reloading" refers to automatically recompiling and reloading the
> interface whenever you make a code change. So when you add a new HTML tag
> and hit save, after a short moment the web page will reload and your added
> HTML tag is visable instantly.

In our `docker-compose.override.yml`/`docker-compose.build.yml` file to run
Wharf locally with we've disabled the `web` service by default because we
developers find ourselves usually editing the frontend and backend from
time to time.

If you're only developing in the backend, it might be nicer to only run the
web through Docker Compose, but if you need to develop the frontend then
doing so using hot reloading will speed up your iteration speed significantly.

First follow the guide [Getting started with development of Wharf](development/getting-started.md),
just up before running `docker-compose build` or `docker-compose up`.

## Running via Node.js

<!-- panels:start -->

<!-- div:left-panel -->

:heavy_check_mark: This **does** support hot reloading.

More exact instructions can be found in the
[iver-wharf/wharf-web repository](https://github.com/iver-wharf/wharf-web#readme).

The basic gist is:

1. Make sure the `web` service is set to use 0 replicas in the
   `docker-compose.override.yml`/`docker-compose.build.yml` file

2. Run the Docker Compose setup using `docker-compose up`

3. Run the `wharf-web` Angular app locally using Node.js (`npm start`)

   Angular app can be shown from <http://localhost:4200>
   *(Notice it's a different port, 4200, than when hosting via Docker Compose,
   which is at port 5000)*

<!-- div:right-panel -->

After you've started the `wharf-web` app locally via Node.js, you can start
the other applications:

```bash
# Build all services, excluding the web
# (as it's commented out by default)
docker-compose build --parallel

# Run all services, excluding the web
docker-compose run --abort-on-container-exit
```

<!-- panels:end -->

## Running in Docker Compose

<!-- panels:start -->

<!-- div:left-panel -->

:x: This **does not** support hot reloading.

Edit your local `docker-compose.override.yml`/`docker-compose.build.yml` file
and uncomment the `web` service building and comment out the replicas setting:

```diff
diff --git a/docker-compose.build.yml b/docker-compose.build.yml
index cc5ecbd..001fea3 100644
--- a/docker-compose.build.yml
+++ b/docker-compose.build.yml
@@ -2,14 +2,14 @@ version: '3'
 services:
   ## This disables wharf-web, which lets you run wharf-web locally
   ## via `npm start` instead. Comment this out to reenable it
-  web:
-    deploy:
-      replicas: 0
+  #web:
+  #  deploy:
+  #    replicas: 0
   ## Or uncomment this to also build the wharf-web service from source.
   ## Slight warning that it does take significantly more time to build than
   ## the other services though.
-  #web:
-  #  build: wharf-web
+  web:
+    build: wharf-web

   api:
     build:
```

When running via Docker Compose, the web will be available at
<http://localhost:5000>.

<!-- div:right-panel -->

After you've made your edit, you can run Wharf locally via:

```bash
# Build all services, including the web
docker-compose build --parallel

# Alternatively, only build the web,
# given the other services are already built
docker-compose build web

# Run all services, including the web
docker-compose run --abort-on-container-exit
```

<!-- panels:end -->
