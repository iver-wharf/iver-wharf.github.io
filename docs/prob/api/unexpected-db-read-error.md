# Problem: Error reading from database

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Error reading from database.`
- Type: `/prob/api/unexpected-db-read-error`

<!-- div:left-panel -->

Wharf's API failed to perform read operations on the database to obtain data.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Communication from Wharf's API to the database is crucial to keep alive, but
when it fails then this problem may arise.

This problem suggests that a read operation failed, such as when you visit the
details page of a project.

In contrast to the [`/prob/api/unexpected-db-write-error`](/prob/api/unexpected-db-write-error)
problem, reading can usually be performed even if the database has ran out of
disk space.

<!-- div:right-panel -->

Examples:

- Network issues.
- Database is offline due to restarting.

:x: Should not be affected by:

- Database has reached maximum disk capacity.

<!-- panels:end -->

## Resolving it

Try again later. Most probably the issue is a fluke and retrying instantly or
after a few minutes usually resolves the issue.

If the issue remains, try to contact your administrator / operations team that
manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
