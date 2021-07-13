# Writing changelogs

In all of our repositories (except for the solely documentation ones) we have a
`CHANGELOG.md` file that contains notes written by the developers who
implemented the respective change.

This document is a guide on how to update those files when you yourself create
a pull request.

To get an overview of how they look, as well as our reasoning to why we're
using changelogs the way we do, we suggest that you check out our guide on 
[reading changelogs](development/changelogs/).

## Prerequisites

- Get proficient with the Markdown syntax. The "GitHub Flavored Markdown" (GFM)
  variant, to be exact, as there exists many flavors of Markdown.

  Recommended reading: [Mastering Markdown - GitHub Guides](https://guides.github.com/features/mastering-markdown/)

- Use a Markdown linter in your text editor of choice. We have strict rules for
  what is recognized as valid Markdown, but improperly formatted. We use
  [remark-lint](https://github.com/remarkjs/remark-lint) in our continuous
  integration pipeline to validate our Markdown files, including our
  `CHANGELOG.md` files.

  Recommended to check out their integrations guides: [Integrations - remark-lint](https://github.com/remarkjs/remark-lint#integrations)

- We're using [SemVer 2.0.0](https://semver.org/) in all of our versioned
  repositories. You are expected to follow the SemVer 2.0.0 rules when
  potentially bumping the version in the `CHANGELOG.md` file, and to
  understand what the difference is between a major, minor, and patch version
  bump is.

## When to edit it

Non-exhaustive list of scenarios:

- You've opened a new pull request towards one of our GitHub repositories.
- You've found a typo or grammatical error in one of the changelog notes.
- You've identified a missing changelog note on an older version.
- You wish to release the list of unreleased (WIP) changes.

If there is no `CHANGELOG.md` file inside the repository, then you do not need
to create one, as this probably means that we don't keep a changelog history in
said repository.

## Add a version section

Any new change shall be added to a "WIP" ("Work In Progress") version section,
which is a version section where instead of a date
(such as `## v1.0.0 (2021-07-12)`) you have the phrase "WIP" instead
(such as `## v1.0.0 (WIP)`).

A version section gets its date whenever it is released. Something that is
managed in a different PR than the one you're adding release notes in.

### If no WIP section exists

<!-- panels:start -->

<!-- div:left-panel -->

You may be the first to add a changelog note after a release. If so, then you
add a new version section with a new WIP version, bumped **relative to the
latest released version**.

| Scope of your changes | Latest release | Add this          |
| --------------------- | -------------- | ----------------- |
| Patch                 | v1.0.0         | `## v1.0.1 (WIP)` |
| Minor                 | v1.0.0         | `## v1.1.0 (WIP)` |
| Major                 | v1.0.0         | `## v2.0.0 (WIP)` |

<!-- div:right-panel -->

For example, given that your changes include a minor version bump, then you
would add the following:

```diff
 # Changelog for fake-project

+## v1.2.0 (WIP)
+
+- Added new tab "settings" on the project page. (#20)
+
 ## v1.1.0 (2021-05-13)

 - Added new tab to the top bar menu. (#15)

 - Changed version of database library from v3.0.0 to v3.1.0. (#16)

 - Fixed bug where page would refresh after 3 minutes. (#17, #18)
```

<!-- panels:end -->

### If a WIP section exists

<!-- panels:start -->

<!-- div:left-panel -->

You have two main tasks here:

1. Add your changelog note under the existing `(WIP)` section.
2. If needed, update the version in the `(WIP)` section.

The version section with a WIP version shall be bumped **relative to the
latest released version**, but regarding all changes in the WIP version
section.

You can calculate what the WIP version should be by taking the highest
version of the existing WIP version and the latest released version plus the
version bump from your changes.

Practically speaking, the following rules apply regarding updating the existing
WIP version:

| Scope of your changes | Replace WIP version if it has already bumped |
| --------------------- | -------------------------------------------- |
| Patch                 | *no change is needed*                        |
| Minor                 | Patch                                        |
| Major                 | Patch or minor                               |

<!-- div:right-panel -->

For example, given that your changes include a minor version bump, then you
would change the following:

```diff
 # Changelog for fake-project

-## v1.1.1 (WIP)
+## v1.2.0 (WIP)
+
+- Added new tab "settings" on the project page. (#20)

 - Fixed a range of typos in the GUI. (#19)

 ## v1.1.0 (2021-05-13)

 - Added new tab to the top bar menu. (#15)

 - Changed version of database library from v3.0.0 to v3.1.0. (#16)

 - Fixed bug where page would refresh after 3 minutes. (#17, #18)
```

<!-- panels:end -->

## Format of release note

<!-- panels:start -->

<!-- div:left-panel -->

### Formatting rules

- Start with a dash and a space `- ` to indicate a Markdown unordered list
  item.

- First word needs to be one of the following verbs, in the exact conjugation
  as seen below:

  - **Added**: For any new features that have been added since the last version
    was released

  - **Changed**: To note any changes to the software’s existing functionality

  - **Deprecated**: To note any features that were once stable but are no longer
    and have thus been removed

  - **Fixed**: Any bugs or errors that have been fixed should be so noted

  - **Removed**: This notes any features that have been deleted and removed from
    the software

  - **Security**: This acts as an invitation to users who want to upgrade and
    avoid any software vulnerabilities

  > The above list has been taken verbatim from <https://changelog.md/>, as we
  > agree with most of the practices from said page.

- Must end with proper punctuation.

- The note must be word-wrapped and must not span farther to the right than
  the 80th character, with the exception of URLs. Any wrapped lines are
  indented with 2 spaces.

- End with the pull request number/ID, prefixed with a hash symbol `#`, wrapped
  in parentheses. For example `(#12)` for the pull request ID 12. You may also
  group multiple pull request changes into the same changelog note, where you
  then separate them by a comma and a space `, `, such as `(#12, #13)`

<!-- div:right-panel -->

### Formatting examples

:heavy_check_mark: Good changelog notes:

- \- Added new tab to the top bar menu. (#15)

- \- Changed version of database library from v3.0.0 to v3.1.0. (#16)

- \- Fixed bug where page would refresh after 3 minutes. (#17, #18)

:x: Bad changelog notes:

- \- Add new tab to the top bar menu. (#15)

  *&uarr; Should be "Added", and not "Add".*

- \- Added new tab to the top bar menu

  *&uarr; Missing final punctuation and pull request reference.*

- \- ADDED new tab to the top bar menu. #15

  *&uarr; Verb should be capitalized and not full uppercase, and missing
  parentheses around pull request reference.*

- \- did tHing, anf now #8 work

  *&uarr; C'mon, are you even trying? That's barely readable!*

<!-- panels:end -->

### Formatting freedoms

- Use any Markdown syntax that you seem fit, including emphasis, bold text,
  code blocks, tables, inner lists, et.al. Refrain from using images
  though as they are less portable.

## Releasing a new version

Create a pull request where you change the `(WIP)` section to instead have
today's date. After which, any new changes that aim to be merged needs to add
a new `(WIP)` version section instead, as described in one of the steps above.

The steps are described in more detail in the guide for
[releasing a new version](development/releasing-a-new-version.md).
