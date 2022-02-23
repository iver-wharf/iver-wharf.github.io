# Docker step

Build an image from a Dockerfile and push to a registry.

```yaml
docker:
  file: src/api/Dockerfile # path to Dockerfile from root of repo
  tag: latest,${GIT_COMMIT},${GIT_TAG}
  # Optional arguments
  destination: # defaults to "${registry}/${group}/${REPO_NAME}/${name}", or "${registry}/${group}/${REPO_NAME}" if ${REPO_NAME}==${name}
  name: # defaults to the step name
  group: # defaults to ${REPO_GROUP} (the Wharf group name)
  context: src/api # context to use when building (defaults to root of repo)
  secret: gitlab-registry # kubernetes secret to use when pushing image
  registry: harbor.local # base url of registry, defaults to ${REG_URL}
  append-cert: true # add root CAs to image at /etc/ssl/certs/ca-certificates.crt (defaults to true if REPO_GROUP starts with "default", case insensitive)
  push: true # push resulting image to registry, defaults to true
  args: # dockerfile building ARGs
    - FIRST_ARG=Value from '.wharf-ci.yml' file!
    - SECOND_ARG=2147483647+1
  secretName: mysecret # if specified, the target Kubernetes secret name will be mounted to be used by the secretArgs setting. The secret must have the name 'wharf-${WHARF_INSTANCE}-project-${WHARF_PROJECT_ID}-secretname-${secretName}'.
  secretArgs: # dockerfile build ARGs, with values mapped from Kubernetes secret, referenced by secretName
    - FIRST_SEC_ARG=mysecretkey1
    - SECOND_SEC_ARG=mysecretkey2
```
