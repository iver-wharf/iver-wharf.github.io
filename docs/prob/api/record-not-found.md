# Problem: Record not found

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Record not found.`
- Type: `/prob/api/record-not-found`

<!-- div:left-panel -->

A record (peice of data) that does not exist was attempted to be fetched from
the database.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

There are plenty of ways a "Record not found" problem may arise. The outline
is that you are trying to find a peice of data based on some unique identifier
(ID) that does not exist.

Most probably no true damage has been done here. Just that the resource you're
looking for cannot be found. Such as if you've made a typo in the URL or some
bug in the UI.

This is what is commonly known as the "404 error", as [the status code 404
stands for "Not Found" on the web.](https://en.wikipedia.org/wiki/HTTP\_404)

<!-- div:right-panel -->

Examples:

- Show details for project with ID `123`, when no such project exists.

- Download artifact with ID `456` from build with ID `123`, when no such
  artifact or build exists.

- Download artifact that has since been removed due to disk space shortage.

- You followed an old link but the database has since been cleared.

<!-- panels:end -->

## Resolving it

If you followed a hyperlink from outside of the Wharf web interface then it
would be wise to correct that foreign URL, if able.

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
