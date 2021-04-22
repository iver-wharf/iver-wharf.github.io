# Variables evaluation order

In the beginning of execution variables are evaluated in a particular order,
which defines in what order variables can depend on each other. Variables are
evaluated in the following order:

1. Built-in variables
2. Input variables
3. Environment variables (for the selected environment)
4. Step arguments

<!-- panels:start -->

<!-- div:left-panel -->

Therefore the following would be valid:

```yaml
input:
  - name: my-input-var
    type: string
    default: foo ${BUILD_REF}

environments:
  my-env:
    my-env-var: moo '${my-input-var}' faz ${GIT_TAG}

my-stage:
  my-step:
    container:
      image: alpine:latest
      cmds:
        - echo ${my-input-var}
        - echo ${my-env-var}
        - echo ${GIT_BRANCH}
```

<!-- div:right-panel -->

Would output something like:

```log
foo 213
moo 'foo 213' faz v1.0.0
master
```

<!-- panels:end -->

However, due to the evaluation order, the following would be invalid and would
result in *"❌ error: undefined variable: `my-env-var`"*:

```yaml
input:
  - name: my-input-var
    type: string
    default: foo ${my-env-var}

environments:
  my-env:
    my-env-var: moo ${GIT_TAG}
```
