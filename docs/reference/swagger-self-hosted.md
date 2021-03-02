# Swagger (self-hosted)

Wharf's main API and provider APIs all produce OpenAPI specifications.

Together with those APIs we also host Swagger to easily be able to see the exact
API specification you have installed right now.

## Main API Swagger

Visit `/api/swagger/index.html` on your own self-hosted instance of Wharf.

- If you host Wharf at `https://wharf.local`, then visit
  <https://wharf.local/api/swagger/index.html>

- If you're running Wharf locally on port 5000, then visit
  <http://localhost:5000/api/swagger/index.html>

## Provider APIs Swagger

Visit `/import/{provider}/swagger/index.html` on your own self-hosted instance
of Wharf, where you replace `{provider}` with the name of said provider API.

Let's say you have the three providers `gitlab`, `github`, and `azuredevops`,
then:

- If you host Wharf at `https://wharf.local`, then visit

  - For `gitlab` provider: <https://wharf.local/import/gitlab/swagger/index.html>
  - For `github` provider: <https://wharf.local/import/github/swagger/index.html>
  - For `azuredevops` provider: <https://wharf.local/import/azuredevops/swagger/index.html>

- If you're running Wharf locally on port 5000, then visit

  - For `gitlab` provider: <http://localhost:5000/import/gitlab/swagger/index.html>
  - For `github` provider: <http://localhost:5000/import/github/swagger/index.html>
  - For `azuredevops` provider: <http://localhost:5000/import/azuredevops/swagger/index.html>
