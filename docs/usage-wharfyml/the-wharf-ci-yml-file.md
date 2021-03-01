# The `.wharf-ci.yml` file

<!-- panels:start -->

<!-- div:left-panel -->

The `.wharf-ci.yml` file is located at the **root** path of each projects
repositories. The file is sometimes referred to as the projects
"build definition".

When Wharf inspects a project, either when importing or building, it will start
looking for this `.wharf-ci.yml` file.

> **Note**: Only `.wharf-ci.yml` is valid. It's both case sensitive and does not
> support `.yaml` extension (at the moment).
>
> Wharf would **not** find the following files:
>
> - :x: `.Wharf-CI.yml` (must be lowercase)
> - :x: `.wharf-ci.yaml` (must be *.yml*, not *.yaml*)
> - :x: `.wharfci.yml` (must have dash between *wharf* and *ci*)
>
> Wharf will only find the following:
>
> - :heavy_check_mark: `.wharf-ci.yml`

<!-- div:right-panel -->

Example file structure of a C# .NET repository:

```
/.git/
/.wharf-ci.yml    <-- Here it is
/LICENSE.md
/MyProject.sln
/README.md
/directory.build.props
/nuget.config
/src/MyProject/MyProject.csproj
/src/MyProject/Program.cs
/tests/MyProject.Tests/MyProject.Tests.csproj
/tests/MyProject.Tests/MyTests.cs
```

<!-- panels:end -->

## Purpose

Tell Wharf how to build, test, package, publish, deploy, *or run any arbitrary
piece of code*.

What you can build, where you can deploy to, and so forth, is constantly
expanding with our different [step types](/usage-wharfyml/step-types.md), but
with the most basic configuration of a
[container step](/usage-wharfyml/step-types/container.md) you can actually
complete any task by scripting in Bash or PowerShell.

## Schema

The most essential components of your build definition (the `.wharf-ci.yml` file)
is the stages and the steps.

In short:

- A step builds a Docker image, or runs some commands in a container, based on
  the step's type.
  
- A stage runs all of its steps in parallel.

- Wharf runs all of its stages in sequence.

Read more about these components in the [Stages and steps](/usage-wharfyml/stages-and-steps.md) page.

Except for stages and steps, your build definition may also include usage of
[Variables](/usage-wharfyml/variables.md)

- [Built-in variables](/usage-wharfyml/variables/built-in-variables.md), to
  take advantage of what Wharf already knows.

- [Environments](/usage-wharfyml/environments.md), and their variables.

- [Input variables](/usage-wharfyml/variables/input-variables.md), for
  fine-grained per-build control.


## Example

Most of the content in the `.wharf-ci.yml` file is optional. The following file
is the minimal file to have Wharf spin up an `alpine:latest` container and run
`echo Hello World` inside it:

```yaml
myStage:
  myStep:
    container:
      image: alpine:latest
      cmds:
        - echo Hello World
```

## Naming conventions

- name your environments after your target environment (ex: "stage", "prod"),
- name your stages after their action (ex: "build", "deploy"),
- and name your steps after the component they take action upon

```yaml
environments:
  stage:
    cluster-config: stage-cluster-config
  prod:
    cluster-config: prod-cluster-config

build:
  web:
    docker:
      file: src/web/Dockerfile
      context: src/web
      tag: latest
  api:
    docker:
      file: src/api/Dockerfile
      context: src/api
      tag: latest

deploy:
  environments:
    - stage
    - prod

  web:
    kubectl:
      file: deploy/web.yml
      cluster: ${cluster-config}

  api:
    kubectl:
      file: deploy/api.yml
      cluster: ${cluster-config}
```
