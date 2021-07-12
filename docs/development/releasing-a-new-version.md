# Releasing a new version

## Create the release PR

1. Update the `CHANGELOG.md` file in the repository to change the `(WIP)` tag
   to today's date in the format of `(YYYY-MM-DD)`. For example, say today's
   date was 12th of July, 2021:

   ```diff
    # Changelog for fake-project

   -## v1.2.0 (WIP)
   +## v1.2.0 (2021-07-12)

    - Added new tab "settings" on the project page. (#20)

    ## v1.1.0 (2021-05-13)

    - Added new tab to the top bar menu. (#15)

    - Changed version of database library from v3.0.0 to v3.1.0. (#16)
   ```

2. Commit and push your changes on a new branch using the format
   `release/{version}`. To continue with the above example, you would create
   the branch `release/v1.2.0`.

3. Create a pull request (PR) from your new release branch targetting the
   `master` branch.

   - Name the PR `Release {version}`, for example: `Release v1.2.0`
   - Set yourself as assignee
   - Add the label `release`
   - Add at least 2 reviewers
   - Set the project to the [`Backlog` project](https://github.com/orgs/iver-wharf/projects/1)

   In the PR description, you add all the notes from the `CHANGELOG.md` for the
   respective version, something like so:

   ```markdown
   ## Changes

   - Added new tab "settings" on the project page. (#20)
   ```

4. Wait until the PR has been reviewed

## Merging a release PR

1. If the date has drifted compared to what's written in the `CHANGELOG.md` by
   the time you're ready to merge, then you should amend the date in the
   `release/{version}` branch (ex: `release/v1.2.0`) to today's date in the
   format of `(YYYY-MM-DD)`, before proceeding.

   For example, say today's date is now 15th of July, 2021:

   ```diff
    # Changelog for fake-project

   -## v1.2.0 (2021-07-12)
   +## v1.2.0 (2021-07-15)

    - Added new tab "settings" on the project page. (#20)

    ## v1.1.0 (2021-05-13)

    - Added new tab to the top bar menu. (#15)

    - Changed version of database library from v3.0.0 to v3.1.0. (#16)
   ```

   There's no need to request the reviewers to review again.

2. Build the Docker image, if the repository has a Dockerfile in it. Such is
   the case only for the frontend, API, and provider APIs. Then push that image
   over to <https://quay.io/>.

3. Create a new release based on the newly merged commit that now lives on the
   `master` branch over at the releases page for the GitHub repository, found
   at `https://github.com/iver-wharf/{project-name}/releases/new`.

   For example: <https://github.com/iver-wharf/wharf-provider-gitlab/releases/new>

   - Enter the new release's version as the "Tag version", for example `v1.2.0`

   - Enter the version again in the "Release title" field, followed by the
     name of the project. For example `v1.2.0 wharf-provider-gitlab`

   - In the release body text area, labelled "Describe this release", write a
     section where you paste in the changelog notes from the `CHANGELOG.md`
     file, for example:

     ```markdown
     ## Changes (since v1.1.0)

     - Added new tab "settings" on the project page. (#20)
     ```

   - For projects with Docker image artifacts that needs to be pushed to
     <https://quay.io/>, add a section for the Docker image to the top of the
     release body text area, such as the following (whilst replacing the
     project names and version to the appropriate values):

     ````markdown
     ## Docker image

     Hosted over at <https://quay.io/repository/iver-wharf/wharf-provider-gitlab>

     ```sh
     docker pull quay.io/iver-wharf/wharf-provider-gitlab:v1.2.0
     ```

     ## Changes (since v1.1.0)

     - Added new tab "settings" on the project page. (#20)
     ````

4. Hit "Publish release"

## Uploading Swagger files to release

If the project produces Swagger documentation files, then those needs to be
generated and pushed as well. Do the following:

1. Make sure you've checked out the release locally. For example by doing:

   ```bash
   git pull
   git checkout v1.2.0
   ```

2. Because of a technical limitation, you need to temporarily update the
   `main.go` file and add the version tag there, like so:

   ```diff
   diff --git a/main.go b/main.go
   index 3e59a4d..834a57c 100644
   --- a/main.go
   +++ b/main.go
   @@ -23,6 +23,7 @@ const ProviderName = "gitlab"
    // @title Wharf provider API for GitLab
    // @description Wharf backend API for integrating GitLab repositories with
    // @description the Wharf main API.
   +// @version v1.2.0
    // @license.name MIT
    // @license.url https://github.com/iver-wharf/wharf-provider-gitlab/blob/master/LICENSE
    // @contact.name Iver Wharf GitLab provider API support
    func main() {
   ```

3. Run the following command inside the project:

   ```bash
   swag init --parseDependency --parseDepth 1
   ```

   After the above command, you may revert your change to `main.go`

4. Upload the files `docs/swagger.json` and `docs/swagger.yaml` to the GitHub
   release as assets.
