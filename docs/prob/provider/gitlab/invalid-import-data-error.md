# Problem: Invalid import data

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Invalid import data.`
- Type: `/prob/provider/gitlab/invalid-import-data-error`

<!-- div:left-panel -->

Could not recognize the import type.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Occurs when trying to import a project without specifying a group.

<!-- div:right-panel -->

The following combinations are valid
- Specify both project and group.
- Specify only group.
- Don't specify any. (Imports everything)

<!-- panels:end -->

## Resolving it

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
