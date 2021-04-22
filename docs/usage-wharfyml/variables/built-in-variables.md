# Built-in variables

There are a set of built-in variables always available.

Other variable sources includes: variables from current
[environment](/usage-wharfyml/environments.md) and
[inputs](/usage-wharfyml/variables/input-variables.md)

## `BUILD_REF`

<!-- panels:start -->
<!-- div:left-panel -->

Build ID number of Wharf build. This value is unique for any build, no matter
which Wharf project it belongs to.

<!-- div:right-panel -->

```properties
# Example value:
BUILD_REF=123
```

<!-- panels:end -->

## `CHART_REPO`

<!-- panels:start -->
<!-- div:left-panel -->

URL to Helm chart registry where to push Helm charts.

<!-- div:right-panel -->

```properties
# Example value:
CHART_REPO=https://harbor.local/chartrepo
```

<!-- panels:end -->

## `DEFAULT_DOMAIN`

<!-- panels:start -->
<!-- div:left-panel -->

Domain of where the executor is hosted.

<!-- div:right-panel -->

```properties
# Example value:
DEFAULT_DOMAIN=yourdomain.local
```

<!-- panels:end -->

## `GIT_BRANCH`

<!-- panels:start -->
<!-- div:left-panel -->

The branch to build. (Alias of `REPO_BRANCH`)

<!-- div:right-panel -->

```properties
# Example value:
GIT_BRANCH=feature/fix-error-on-submit
REPO_BRANCH=feature/fix-error-on-submit
```

<!-- panels:end -->

## `GIT_COMMIT`

<!-- panels:start -->
<!-- div:left-panel -->

Base 64 encoded SHA1 hash of the Git commit the build is based on. This is
what's commonly referred to as the "commit ID".

<!-- div:right-panel -->

```properties
# Example value:
GIT_COMMIT=af1b9c1ace369dc854d1fa2402fa019d4178397f
```

<!-- panels:end -->

## `GIT_COMMIT_AUTHOR_DATE`

<!-- panels:start -->
<!-- div:left-panel -->

Author date of commit in ISO 8601 format (Git pretty format: `%aI`).

For example on a rebase the author date is when the **original commit** was
created. On regular commits, this value will be the same as
`GIT_COMMIT_COMMITTER_DATE`.

<!-- div:right-panel -->

```properties
# Example value:
GIT_COMMIT_AUTHOR_DATE=2020-05-07T14:25:21+02:00
```

<!-- panels:end -->

## `GIT_COMMIT_COMMITTER_DATE`

<!-- panels:start -->
<!-- div:left-panel -->

Committer date of commit in ISO 8601 format (Git pretty format: `%cI`).

For example on a rebase the committer date is when the **rebase commit** was
created. On regular commits, this value will be the same as
`GIT_COMMIT_AUTHOR_DATE`.

<!-- div:right-panel -->

```properties
# Example value:
GIT_COMMIT_COMMITTER_DATE=2020-05-07T14:25:21+02:00
```

<!-- panels:end -->

## `GIT_COMMIT_SUBJECT`

<!-- panels:start -->
<!-- div:left-panel -->

The oneline subject line of the Git commit message

<!-- div:right-panel -->

```properties
# Example value:
GIT_COMMIT_SUBJECT=Updated build targets
```

<!-- panels:end -->

## `GIT_SAFEBRANCH`

<!-- panels:start -->
<!-- div:left-panel -->

The branch to build, but with directory separators (`/`) replaced with hyphens
(`-`). Safe to use as file names.

<!-- div:right-panel -->

```properties
# Example value:
GIT_SAFEBRANCH=feature-fix-error-on-submit
```

<!-- panels:end -->

## `GIT_TAG`

<!-- panels:start -->
<!-- div:left-panel -->

Tag that targets the Git commit, or empty if none.

If there are multiple tags on the target Git commit, then Wharf will sort them
based on either tagged timestamp (for annotated tags) or the commit date
(for lightweight tags) and then use the latest tag.

<!-- div:right-panel -->

```properties
# Example value:
GIT_TAG=v1.0.0
```

<!-- panels:end -->

## `REG_URL`

<!-- panels:start -->
<!-- div:left-panel -->

Docker registry URL.

<!-- div:right-panel -->

```properties
# Example value:
REG_URL=harbor.local
```

<!-- panels:end -->

## `REPO_BRANCH`

<!-- panels:start -->
<!-- div:left-panel -->

The branch to build.

<!-- div:right-panel -->

```properties
# Example value:
REPO_BRANCH=feature/fix-error-on-submit
```

<!-- panels:end -->

## `REPO_GROUP`

<!-- panels:start -->
<!-- div:left-panel -->

- **For GitLab**: [Namespace](https://docs.gitlab.com/ee/user/group/#namespaces)
  (user, group, or group/subgroups)
  
- **For AzureDevOps**: Collection name.

- **For GitHub**: Organization name or username.

<!-- div:right-panel -->

```properties
# Example value:
REPO_GROUP=iver-wharf
```

<!-- panels:end -->

## `REPO_NAME`

<!-- panels:start -->
<!-- div:left-panel -->

The name of the Git repository, as named by the hosting provider.

- **For GitLab**: Repository display name and path name can be different. This
  value will refer to the path name.

<!-- div:right-panel -->

```properties
# Example value:
REPO_NAME=web-ng
```

<!-- panels:end -->
