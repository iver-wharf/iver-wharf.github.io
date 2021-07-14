# Problem: Parsing build parameters failed

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Parsing build parameters failed.`
- Type: `/prob/api/project/run/params-deserialize`

<!-- div:left-panel -->

Failed to parse build input parameters when starting a new build.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Most fields are validated in the frontend, but if you're calling the backend API
directly or if there is some validation rule missing in the frontend, then this
problem may arise.

Each build allows optional input parameters/[input variables](/usage-wharfyml/variables/input-variables.md)
if they are defined in the projects [`.wharf-ci.yml`](/usage-wharfyml/) file.
When starting a new build, you are allowed to set custom values for these
variables on a per-build basis.

If Wharf's API fails to parse these values that you've sent it, or fails to
parse the input variable definitions of the project's build definition
(`.wharf-ci.yml` file) itself, then this problem may arise.
Such as if the value types of the input variables you've sent along or if the
HTTP request payload is malformed.

<!-- div:right-panel -->

Examples:

- The value `"foo bar"` is sent as the value for a `number`-typed input
  variable.

- HTTP request body to `POST /api/project/{projectid}/{stage}/run` is invalid
  JSON or empty.

<!-- panels:end -->

## Resolving it

In the case that you've entered a type of invalid format (ex: text string where
a number of solely digits was expected) in Wharf's web interface then you can
correct your mistake and try again. It would behoove us if you also reported the
issue to the frontend GitHub repository as an issue: <https://github.com/iver-wharf/wharf-web/issues/new>

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
