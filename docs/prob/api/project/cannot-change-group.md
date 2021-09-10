# Problem: Project group cannot be changed

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Project group cannot be changed.`
- Type: `/prob/api/project/cannot-change-group`

<!-- div:left-panel -->

Once a project has been imported into Wharf, it is not allowed to have its group
changed.

!> Deprecated: This problem is no longer relevant with the [wharf-api](https://github.com/iver-wharf/wharf-api),
starting with version v4.2.0. Since v4.2.0, you are allowed to freely update
both the Wharf group and project names.

<!-- panels:end -->

## Possible causes

This occurs when you update the group field on a project.

There are some things that are locked in projects and cannot be changed. The
project ID and project group name, to name a few.

The project group field cannot be updated manually through Wharf's web interface
on its own, but if you were to move a project from one user to another, or from
one GitHub organization to another, followed by refreshing the project, then
this problem could appear.

## Resolving it

Try importing the project from scratch, instead of trying to refresh the already
imported project.

If you receive the same error when importing from scratch, then you would need
to delete the project from Wharf's database. As of the time of writing
(2021-05-18), that would be done by sending an HTTP
`DELETE /api/project/{projectid}` request to Wharf's API.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
