# Problem: Unexpected API client read error

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Unexpected API client read error.`
- Type: `/prob/api-client/unexpected-read-error`

<!-- div:left-panel -->

An unexpected error occurred when reading data using the Wharf API.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

This might occur when failing to fetch data from the Wharf API, such as a
stored token or provider.

For the most part only Wharf's provider plugins, such as the
[wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github)
project, will report this problem when trying to import or refresh projects,
or for any other reason are trying to contact the Wharf API to retrieve data.

If the Wharf API fails to read data from its sources (such as the database)
and fails because of connection issues there, then a different problem should
be returned, such as the
[`/prob/api/unexpected-db-read-error`](/prob/api/unexpected-db-read-error).

There's a separate problem for when a client is trying to write data over at
[`/prob/api-client/unexpected-write-error`](/prob/api-client/unexpected-write-error).

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
