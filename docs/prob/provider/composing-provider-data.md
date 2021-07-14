# Problem: Error composing provider data

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Error composing provider data.`
- Type: `/prob/provider/composing-provider-data`

<!-- div:left-panel -->

Communication with the remote provider or Wharf API was successful, but the
provider plugin failed to handle the data.

<!-- panels:end -->

## Possible causes

The provider plugin might have failed to parse the
URL(s) received from the remote provider or Wharf API.

The following might be malformed

- A URL in the provider data from the Wharf API.
- A URL in the response payload from the remote provider.

## Resolving it

Verify that you have properly configured the provider in the Wharf API,
as well as the input fields when importing.

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
