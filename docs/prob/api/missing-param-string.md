# Problem: Missing string value

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Missing string value.`
- Type: `/prob/api/missing-param-string`

<!-- div:left-panel -->

A text string was omitted or left empty in a web request.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Most fields are validated in the frontend, but if you're calling the backend API
directly or if there is some validation rule missing in the frontend, then this
problem may arise.

The problem is related to the backend expecting a string (text) value but
received none, or that the received string was empty (zero length).

<!-- div:right-panel -->

For example, if you started a new build, but the name of the stage to run did
not get sent (due to bug in the web page), then the API server could respond
with:

> **Missing string value.** \
> A string value (text) was expected on parameter "stage", but it was either
> omitted or empty.

<!-- panels:end -->

## Resolving it

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
