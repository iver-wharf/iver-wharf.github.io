# Problem: Unexpected API client write error

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Unexpected API client write error.`
- Type: `/prob/api-client/unexpected-write-error`

<!-- div:left-panel -->

An unexpected error occurred when writing data using the Wharf API.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

This might occur when failing to add or update data from the Wharf API, such as
when importing or refreshing a project.

For the most part only Wharf's provider plugins, such as the
[wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github)
project, will report this problem when trying to import or refresh projects,
or for any other reason are trying to contact the Wharf API to write data.

If the Wharf API fails to write the data from its sources
(such as the database) and fails because of connection issues or disk shortage,
then a different problem should be returned, such as the
[`/prob/api/unexpected-db-write-error`](/prob/api/unexpected-db-write-error).

There's a separate problem for when a client is trying to read data over at
[`/prob/api-client/unexpected-write-error`](/prob/api-client/unexpected-write-error).

<!-- div:right-panel -->

Non-extensive list of possible causes:

- Network issues between the client (the provider plugin) and Wharf's main API.
- Wharf's main API has just recently crashed.
- An operator is upgrading your instance of Wharf.
- The client (the provider plugin) is misconfigured.
- The client reached the API, but the response was not a proper problem format.

<!-- panels:end -->

## Resolving it

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
