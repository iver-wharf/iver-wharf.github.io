# Problem: Unexpected trigger error

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Unexpected trigger error.`
- Type: `/prob/api-client/unexpected-trigger-error`

<!-- div:left-panel -->

Unexpected error when triggering a new build indirectly from a
Wharf API client, such as via one of the provider plugins.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

This might occur when failing to trigger a new build via the Wharf API, such as
when a provider plugin wants to start a build from a webhook request it
received from an Azure DevOps instance.

For the most part only Wharf's provider plugins, such as the
[wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github)
project, will report this problem when trying to trigger a run.

If the Wharf API fails to contact the execution engine because of connection
issues, then a different problem should be returned, such as the
[`/prob/api/project/run/trigger`](/prob/api/project/run/trigger).

<!-- div:right-panel -->

Non-exhaustive list of possible causes:

- Network issues between the client (the provider plugin) and Wharf's main API.
- Wharf's main API has just recently crashed.
- An operator is upgrading your instance of Wharf.
- The client (the provider plugin) is misconfigured.
  - Might be targeting the wrong port.
- The client reached the API, but the response was malformed.

<!-- panels:end -->

## Resolving it

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
