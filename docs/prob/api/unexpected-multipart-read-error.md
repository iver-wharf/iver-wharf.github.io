# Problem: Error reading multipart data

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Error reading multipart data.`
- Type: `/prob/api/unexpected-multipart-read-error`

<!-- div:left-panel -->

Wharf's API failed to read the multipart body of the HTTP request.

<!-- panels:end -->

## Possible causes

A manually composed HTTP request might trigger this error. Nothing that should
be able to occur from regular use of Wharf's web interface or even a code
library used to talk with Wharf's API directly.

In contrast to the quite similar [`/prob/api/unexpected-body-read-error`](/prob/api/unexpected-body-read-error)
problem, this problem can be produced from a malformed HTTP request.

Wharf's API expected a request with the header `Content-Type: multipart/*`
(such as `Content-Type: multipart/form-data`) and an appropriately structured
HTTP request body. If any of those does not match what the API endpoint
expected then Wharf's API will fail to read said data.

Example endpoint that could produce this is the endpoint for uploading
artifacts for a build.

## Resolving it

This issue most probably resides in the library or interface you are using. If
you are getting this problem in Wharf's web interface, then please report it
to the Wharf developers over at GitHub as an issue: <https://github.com/iver-wharf/wharf-web/issues/new>

If you are using a library or perhaps receving the problem when trying to
upload artifacts through a Wharf build then please report it to the appropriate
developers. If you are uncertain, you can create a GitHub issue at:
<https://github.com/iver-wharf/wharf-api/issues/new>
