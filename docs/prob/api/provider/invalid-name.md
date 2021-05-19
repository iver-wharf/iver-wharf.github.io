# Problem: Invalid provider name

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Invalid provider name.`
- Type: `/prob/api/provider/invalid-name`

<!-- div:left-panel -->

Name of provider was not one of the supported/enabled providers.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

When a provider tries to register some projects but the name that the provider
says it has is not in the valid set of provider names.

At the time of writing (2021-05-19, with Wharf API v4.0.0 in development) it is
still locked to only supporting a narrow set of provider names.

<!-- div:right-panel -->

:heavy_check_mark: Example valid inputs (as of Wharf API v4.0.0):

- `github`
- `gitlab`
- `azuredevops`

:x: Example invalid inputs:

- ` ` *(empty value)*
- `GitHub` *(must be lower-cased)*
- `gitea` *(is not one of the above 3 valid provider names)*

<!-- panels:end -->

## Resolving it

As a developer of the provider, you can make sure you are passing along one of
the valid provider names listed above.

If you are not a developer of the provider you are trying to use, then please
report this issue to the developers. For the provider components developed by
Iver you would create a new issue over at:

- GitHub provider: <https://github.com/iver-wharf/wharf-provider-github/issues/new>
- GitLab provider: <https://github.com/iver-wharf/wharf-provider-gitlab/issues/new>
- Azure DevOps provider: <https://github.com/iver-wharf/wharf-provider-azuredevops/issues/new>
