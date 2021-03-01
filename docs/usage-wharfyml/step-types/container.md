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
```

