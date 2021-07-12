# Changelogs

In all of our repositories (except for the solely documentation ones) we have a
`CHANGELOG.md` file that contains notes written by the developers who
implemented the respective change.

This document is a guide on how to interpret those files, as well as understand
why we, the Wharf developers, has decided to use them in the way we do.

When composing your own changelogs, such as when you're submitting a pull
request to one of our GitHub repositories, we expect that you've read our guide
on [writing changelogs](development/changelogs/writing-changelogs.md) first.

## What it looks like

Each `CHANGELOG.md` includes a list of versions and the date they were
released, or the text `(WIP)` if the notes declares changes that has not yet
been released.

Each version holds a list of notes declaring if something has been added,
changed, fixed, removed, or deprecated, as well as a reference to the GitHub
pull request(s) where the change was implemented.

<!-- panels:start -->

<!-- div:left-panel -->

Here's a sample source code view of what a `CHANGELOG.md` file might include:

```markdown
# Changelog for fake-project

## v1.1.0 (2021-05-13)

- Added new tab to the top bar menu. (#15)

- Changed version of database library from v3.0.0 to v3.1.0. (#16)

- Fixed bug where page would refresh after 3 minutes. (#17, #18)

## v1.0.0 (2021-03-03)

- Added reworked GUI. Enjoy the new design! (#10)
```

<!-- div:right-panel -->

The sample markdown would be rendered as:

> ### Changelog for fake-project <!-- {docsify-ignore} -->
> 
> #### v1.1.0 (2021-05-13) <!-- {docsify-ignore} -->
> 
> - Added new tab to the top bar menu. (#15)
> 
> - Changed version of database library from v3.0.0 to v3.1.0. (#16)
> 
> - Fixed bug where page would refresh after 3 minutes. (#17, #18)
> 
> #### v1.0.0 (2021-03-03) <!-- {docsify-ignore} -->
> 
> - Added reworked GUI. Enjoy the new design! (#10)

<!-- panels:end -->

## What is it used for

- Users of Wharf who want to see what's new with the product when they consider
  or already have upgraded their Wharf instance.

- Developers who want to backtrack where something was changed or added without
  needing to perform a [`git blame`](https://git-scm.com/docs/git-blame).

- Bundling changes, where instead of having lots of small releases with a
  single changeset in each we bundle up a group of changes into larger releases
  with 5-10 changes in each.

## Where to find it

In the root directory of the repository, named exactly `CHANGELOG.md`

<!-- panels:start -->

<!-- div:left-panel -->

Examples of repositories **with** a `CHANGELOG.md` file:

- <https://github.com/iver-wharf/wharf-api/blob/master/CHANGELOG.md>
- <https://github.com/iver-wharf/wharf-api-client-go/blob/master/CHANGELOG.md>
- <https://github.com/iver-wharf/wharf-core/blob/master/CHANGELOG.md>
- <https://github.com/iver-wharf/wharf-provider-github/blob/master/CHANGELOG.md>
- <https://github.com/iver-wharf/wharf-web/blob/master/CHANGELOG.md>
- *etc.*

<!-- div:right-panel -->

Examples of repositories **without** a `CHANGELOG.md` file:

- <https://github.com/iver-wharf/iver-wharf.github.io>
- <https://github.com/iver-wharf/rfcs>
- <https://github.com/iver-wharf/wharf-notes>
- *etc.*

<!-- panels:end -->
