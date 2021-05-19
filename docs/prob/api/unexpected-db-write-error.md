# Problem: Error reading from database

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Error writing to database.`
- Type: `/prob/api/unexpected-db-write-error`

<!-- div:left-panel -->

Wharf's API failed to perform write operations on the database to add or update
data.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Communication from Wharf's API to the database is crucial to keep alive, but
when it fails then this problem may arise.

This problem suggests that a write operation failed, such as when you start a
new build and the Wharf API needs to store the state of this new build in the
database.

If the database has ran out of disk space, it's common for them to enter
"read-only" mode where read operations are allowed but write operations are
not. Even updates and deletions, which could even shrink the database size, are
usually disallowed in "read-only" mode.

<!-- div:right-panel -->

Examples:

- Network issues.
- Database is offline due to restarting.
- Database has reached maximum disk capacity.

<!-- panels:end -->

## Resolving it

If you can deduce from the error message that the issue regards network issues
and not disk space, then you could try again after a short while and it should
probably work that time, given that the network issue might have been a fluke.

Otherwise, try to contact your administrator / operations team that manages
your Wharf instance. They may have to increase the database disk size as
removing old data is usually prohibited when the database has entered
"read-only" mode due to disk space shortage.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
