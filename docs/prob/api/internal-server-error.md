# Problem: Internal server error

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Internal server error.`
- Type: `/prob/api/internal-server-error`

<!-- div:left-panel -->

This error is the umbrella error for the Wharf API backend. If something have
gone terribly wrong that the API does not recognise then this error is reported.

<!-- panels:end -->

## Possible causes

If a Go panic occurrs in one of the endpoints, then then API will quickly
recover, return an `/prob/api/internal-server-error` response to the client,
and then most probably shutdown.

There's no apparent reasons why a panic might occurr. Validation errors and
internal state checks *should* be received as different problem types such as
the [`/prob/api/invalid-param`](/prob/api/invalid-param.md) or
[`/prob/api/unexpected-db-read-error`](/prob/api/unexpected-db-read-error).

## Resolving it

The error message in the error might give some clues.

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
