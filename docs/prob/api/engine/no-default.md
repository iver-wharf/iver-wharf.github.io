# Problem: No default execution engine configured

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `No default execution engine configured.`
- Type: `/prob/api/engine/no-default`

<!-- div:left-panel -->

The Wharf API have no configured execution engine (Jenkins or wharf-cmd) at
which it can use to run its builds.

<!-- panels:end -->

## Possible causes

When configuring the wharf-api no execution engines were specified. The
configuration could be missing from when deploying via Helm or when running
locally.

It is possible your installation of Wharf does not have the execution engine
URL set, which is the minimum required field for the execution engine to be
registered.

The following YAML fields are used (with sample values):

```yaml
ci:
  engine:
    id: jenkins
    name: Jenkins
    url: http://jenkins.local/trigger
    token: changeit

  engine2:
    id: wharf-cmd
    name: wharf-cmd
    url: http://wharf-cmd-provisioner/api/worker
    token: changeit
```

The following environment variables are used (with sample values):

```bash
WHARF_CI_ENGINE_ID=jenkins
WHARF_CI_ENGINE_NAME=Jenkins
WHARF_CI_ENGINE_URL=http://jenkins.local/trigger
WHARF_CI_ENGINE_TOKEN=changeit
WHARF_CI_ENGINE2_ID=wharf-cmd
WHARF_CI_ENGINE2_NAME=wharf-cmd
WHARF_CI_ENGINE2_URL=http://wharf-cmd-provisioner/api/worker
WHARF_CI_ENGINE2_TOKEN=changeit
```

## Resolving it

The wharf-api looks at both YAML configuration files as well as environment
variables. It considers the engines to be enabled if their respective YAML or
environment variable for the engine URL is set and not empty.

The following is the minimal YAML configuration you have to provide to supply
at least one execution engine:

```yaml
ci:
  engine:
    url: http://jenkins.local/trigger
```

Wharf-api looks at the following locations for its YAML configuration file:

- `/etc/iver-wharf/wharf-api/config.yml`
- `wharf-api-config.yml` (in the current working directory)
- at location that environment variable `WHARF_CONFIG` specifies

The following is the minimal environment variables you have to provide to supply
at least one execution engine:

```bash
WHARF_CI_ENGINE_URL=http://jenkins.local/trigger
```

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
