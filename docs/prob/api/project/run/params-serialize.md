# Problem: Serializing build parameters failed

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Serializing build parameters failed.`
- Type: `/prob/api/project/run/params-serialize`

<!-- div:left-panel -->

Failed to compose build parameters to be forwarded to the execution engine when
starting a new build.

<!-- panels:end -->

## Possible causes

It's uncommon for Wharf's API to fail at this stage, but it comes from when it
prepares the values it needs to send to the execution engine. This involves more
than just the optional input parameters/[input variables](/usage-wharfyml/variables/input-variables.md)
that you submit when starting a new build, but also a lot of other data such as
the build ID, project name, Git clone URL, et.al.

This usually means there has been a bug or regression in the Wharf API's
codebase which lead it to produce this error.

If Wharf's API fails to parse the values that you've sent it, then you are
instead presented with the [`/prob/api/project/run/params-deserialize`](/prob/api/project/run/params-deserialize)
problem.

## Resolving it

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
