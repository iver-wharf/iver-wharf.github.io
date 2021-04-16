# Container step

Run commands in a container.

```yaml
container:
  image: alpine:latest
  cmds:
    - echo 'hello world'
  # Optional arguments
  os: linux/windows # (defaults to linux)
  shell: /bin/sh
  secretName: # if specified, the target Kubernetes secret name will be mounted inside the container as environment variables. The secret must have the name 'wharf-${WHARF_INSTANCE}-project-${WHARF_PROJECT_ID}-secretname-${secretName}'.
  serviceAccount: default # Set the pod service account by name. Default is 'default'
  certificatesMountPath: /usr/local/share/ca-certificates # if defined add a k8s configmap containing the different certificates to be added and then mount the configmap as a volume into the folder specified by this property. 
```

