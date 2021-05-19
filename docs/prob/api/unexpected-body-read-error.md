# Problem: Error reading request body

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Error reading request body.`
- Type: `/prob/api/unexpected-body-read-error`

<!-- div:left-panel -->

Wharf's API failed to read the body of the HTTP request.

<!-- panels:end -->

## Possible causes

A manually composed HTTP request might trigger this error. Nothing that should
be able to occur from regular use of Wharf's web interface or even a code
library used to talk with Wharf's API directly.

There is a chance the network drops during the request and Wharf's API never
receives the HTTP body it wants to read from, but by then a problem message
response should not be able to get transmitted back to the client.

Therefore this problem will most probably only be observed through the Wharf
API's logs.

## Resolving it

Try to contact your administrator / operations team that manages your Wharf
instance, as this might have some network issues implications.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
