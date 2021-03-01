# Built-in variables

There are a set of built-in variables always available.

Those variables are:

| Built-in variable name | Description | Example |
| --------------------- | ----------- | ------- |
| BUILD_REF | Build number of Wharf build. | `123`
| CHART_REPO | URL to Helm chart registry where to push Helm charts. | `https://harbor.local/chartrepo`
| DEFAULT_DOMAIN | Domain of where the executor is hosted.| `yourdomain.local`
| GIT_BRANCH | The branch to build. (Alias to REPO_BRANCH) | `feature/fix-error-on-submit`
| GIT_COMMIT | SHA1 of the Git commit the build is based on | `af1b9c1ace369dc854d1fa2402fa019d4178397f`
| GIT_COMMIT_AUTHOR_DATE | Author date of commit in ISO 8601 format (Git pretty format: `%aI`)<br/>(For example on a rebase the author date is when the original commit was created) | `2020-05-07T14:25:21+02:00`
| GIT_COMMIT_COMMITTER_DATE | Committer date of commit in ISO 8601 format (Git pretty format: `%cI`)<br/>(For example on a rebase the committer date is when the rebase commit was created) | `2020-05-07T14:25:21+02:00`
| GIT_COMMIT_SUBJECT | The oneline subject line of the Git commit message | [`I immediately regret this commit.`](http://whatthecommit.com/0450514f73ef84a903cc19e34a7ef6d5)
| GIT_SAFEBRANCH | The branch to build, but with directory separators (`/`) replaced with hyphens (`-`). Safe to use as file names. | `feature-fix-error-on-submit`
| GIT_TAG | Tag that targets the Git commit, or empty if none. | `v1.0.0`
| REG_URL | Docker registry URL. | `harbor.local`
| REPO_BRANCH | The branch to build. | `feature/fix-error-on-submit`
| REPO_GROUP | **For GitLab**: [Namespace](https://docs.gitlab.com/ee/user/group/#namespaces) (user, group, or group/subgroups)<br/>**For AzureDevOps**: Collection<br/>**For GitHub**: Organization or user | `iver-wharf`
| REPO_NAME | The name of the git repository. | `web-ng`

Other variable sources includes: variables from current
[environment](/usage/environments.md) and
[inputs](/usage/variables/input-variables.md)

