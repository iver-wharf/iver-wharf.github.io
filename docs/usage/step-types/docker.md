# Docker step

Build an image from a Dockerfile and push to a registry.

```yaml
docker:
  file: src/api/Dockerfile # path to Dockerfile from root of repo
  tag: latest,${GIT_COMMIT},${GIT_TAG}
  # Optional arguments
  name: # defaults to step name
  group: default
  context: src/api # context to use when building (defaults to root of repo)
  secret: gitlab-registry # kubernetes secret to use when pushing image
  registry: https://harbor.local # base url of registry
  append-cert: true # add root CAs to image at /etc/ssl/certs/ca-certificates.crt (defaults to true if REPO_GROUP starts with "default", case insensitive)
  push: true # push resulting image to registry
  args: # dockerfile building ARGs
    - FIRST_ARG=Value from '.wharf-ci.yml' file!
    - SECOND_ARG=2147483647+1
```
