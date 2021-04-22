# Variables

Wharf has a variable substitution feature, where you can specify variable values
from either...

- [Environments](/usage-wharfyml/environments.md), a set of values per
  "deploy environment", chosen by a drop-down when starting a new build.

- [Input variables](/usage-wharfyml/variables/input-variables.md), that each
  can be changed individually from each other.

- [Built-in variables](/usage-wharfyml/variables/built-in-variables.md),
  metadata that Wharf supplies with each build.

## Example

<!-- panels:start -->

<!-- div:left-panel -->

Just a sample usage of a Wharf [built-in variable](/usage-wharfyml/variables/built-in-variables.md)
using the syntax `${name-of-variable}`.

```yaml
myStage:
  myStep:
    container:
      cmds:
        - echo "Wharf build ID: ${BUILD_REF}."
```

<!-- div:right-panel -->

Output from the sample [`container`](/usage-wharfyml/step-types/container.md)
step (given that the build ID is equal to 123):

```logs
Wharf build ID: 123.
```

<!-- panels:end -->

See the page on [variable syntax](/usage-wharfyml/variables/variable-syntax.md)
to get a firmer grasp on how to use and escape variable substitution.
