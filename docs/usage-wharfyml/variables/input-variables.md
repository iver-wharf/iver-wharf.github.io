# Input variables

<!-- panels:start -->

<!-- div:left-panel -->

Inputs are specified in the `.wharf-ci.yml` file and are provided by users in
the UI or passed in through the API. The `name` property becomes the variables
display name in the UI and the variable that can be used just like any other
Wharf variable.

- For all types, the `name` and `type` properties are required.
- For `string`, `password`, and `number` the `default` property is optional.
- For `choice` the `default` and `values` properties are required.

![preview of UI from above snippet](../../\_images/input-vars-ui-example.png)

<!-- div:right-panel -->

```yaml
inputs:
  - name: message
    type: string
    default: hello world

  - name: choice1
    type: choice
    values:
      - test1
      - test2
      - test3
    default: test1

  - name: secretpass
    type: password
    default: changeit

  - name: somenumber
    type: number
    default: 42

myStage:
  myStep:
    container:
      image: alpine:latest
      cmds:
        - echo ${message}
        - echo ${choice1}
        - echo ${secretpass}
        - echo ${somenumber}
```

<!-- panels:end -->
