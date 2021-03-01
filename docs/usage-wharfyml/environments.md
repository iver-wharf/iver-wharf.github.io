# Environments

Environments are named set of variables. A build can **optionally** use one of
its environments, for example as chosen in the ui when starting a new build.

Environments are defined in a root map named `environments` (case sensitive).
Inside are arbitrarily named maps, that in turn contains set of variables.

```yaml
# Defines two environments: stage & prod, each with the variable "namespace"
environments:
  stage:
    namespace: stage
  prod:
    namespace: prod
```

A stage can filter on environments by defining a list of names in a property
named `environments` (case sensitive). If defined, said build will only execute
if one of the listed environments are used in that build.

```yaml
environments:
  stage:
    namespace: stage
  prod:
    namespace: prod

# This stage will run even if no environment is defined
build:
  web:
    docker:
      file: Dockerfile

# This stage will only run if environment is "stage" or "prod"
deploy:
  environments: [stage, prod]
  all:
    kubectl:
      file: deploy/values.yml
      namespace: ${namespace}
```
