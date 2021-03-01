# Variable syntax

<!-- panels:start -->

<!-- div:left-panel -->

To declare a place to substitute with a variable, use the syntax:

```
${variable-name}
```

To escape a variable, such as if you want the raw value `${foo}` to remain and
not have Wharf try to replace the declaration with some value of a variable
named `foo`, use the syntax:

```
${%variable-name%}
```

<!-- div:right-panel -->

For example, if there was a variable named `lorem` with the value of `ipsum`,
the following substitutions would be true

| Input | Output |
| ----- | ------ |
| `${lorem}` | `ipsum`
| `Foo ${lorem} bar` | `Foo ipsum bar`
| `Foo ${  lorem  } bar` | `Foo ipsum bar`
| `Foo ${%lorem%} bar` | `Foo ${lorem} bar`
| `Foo ${%%} bar` | `Foo ${} bar`
| `Foo ${%} bar`<br/>_(`${%}` is a shorthand for `${%%}`)_ | `Foo ${} bar`
| `Foo ${%   %} bar` | `Foo ${   } bar`
| `Foo ${%lorem} bar` | ❌ error: undefined variable: `%lorem`
| `Foo ${} bar` | ❌ error: variable name cannot be empty

<!-- panels:end -->

Variables may be used in:

- ✔ step type values
- ✔ within content of referenced files (ex: `helm.files`, `kubectl.file`)
- ✔ environment variable values
- ✔ input variable values (incl. defaults)

Variables may not be used in:

- ❌ input variable names
- ❌ keys in the .wharf-ci.yml (ex: stage names, step names, environment names, etc.)

## Example

### Referencing files dynamically

<!-- panels:start -->

<!-- div:left-panel -->

Here, `deploy.all.kubectl.file` will evaluate to `deploy/foo.yml`, then that
file will be loaded.

```yaml
# .wharf-ci.yml
environments:
  my-environment:
    my-variable: foo
    my-other-variable: bar

# This stage will only run if environment is "my-environment"
deploy:
  environments: [my-environment]
  all:
    kubectl:
      file: deploy/${my-variable}.yml
```

<!-- div:right-panel -->

Running a build with environment set to `my-environment` would be equivalent
to just having this `.wharf-ci.yml` config file:

```yaml
# .wharf-ci.yml
deploy:
  all:
    kubectl:
      file: deploy/foo.yml
```

<!-- panels:end -->

### Kubernetes object name based on environment

<!-- panels:start -->

<!-- div:left-panel -->

Here, `${my-other-variable}` will be replaced by Wharf before result is given to
the `kubectl apply -f` invocation. If the file would include:

```yaml
# deploy/foo.yml
apiVersion: v1
kind: Namespace
metadata:
  name: ${my-other-variable}
```

<!-- div:right-panel -->

Then the following file would be given to `kubectl apply -f`, creating a
namespace named `bar` in the process:

```yaml
# deploy/foo.yml
apiVersion: v1
kind: Namespace
metadata:
  name: bar
```

<!-- panels:end -->
