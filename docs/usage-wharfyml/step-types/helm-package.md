# Helm-package step

Packages a sub-folder or repo into a helm-chart and pushes it to a
chart-repository.

```yaml
helm-package:
  # Optional arguments
  version: ${GIT_TAG} # Defaults to version from Chart.yaml
  chart-path: web-app # Sub-folder of repo. Defaults to repo root
  destination: https://harbor.local/chartrepo/default # Defaults to `${CHART_REPO}/${REPO_GROUP}`
  secret: helm-registry # kubernetes secret to use when publishing charts. Defaults to ${HELM_REG_SECRET} variable
```
