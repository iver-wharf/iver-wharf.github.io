# Helm-package step

Packages a sub-folder or repo into a helm-chart and pushes it to a
chart-repository.

```yaml
helm-package:
  version: ${GIT_TAG}
  chart-path: web-app # Sub-folder of repo
  # Optional arguments
  destination: https://harbor.local/chartrepo/default
```
