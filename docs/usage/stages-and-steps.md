# Stages and steps

The `.wharf-ci.yml` file is divided into Stages and Steps.

### Stages

- Each stage can have any name as long as it's unique within the file
- Each stage can contain several steps
- Each stage is executed in sequence

### Steps

- Each step can have any name as long as it's unique whithin its stage
- Each step is executed in parallel within its stage

### Example

```yaml
build:
  web:
    container:
      image: alpine:latest
      cmds:
        - echo Hello World
  api:
    # step type goes here, ex: docker

deploy:
  web:
    # step type goes here, ex: kubectl
  api:
    # step type goes here, ex: helm
```

In this file the build-stage contains steps for 'web' and 'api'.
The 'web' step contains exemplary container step type.
