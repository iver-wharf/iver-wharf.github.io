# Helm deploy step

Install or upgrade a [Helm](https://helm.sh) release.

```yaml
helm:
  chart: web-app # Chart name
  name: test-deploy # Deployed application name
  namespace: stage
  # Optional arguments
  repo: https://harbor.local/chartrepo # if set to "stage" then will use https://kubernetes-charts.storage.googleapis.com
  set:
    image.tag: latest
  files:
    - values.yaml
  chartVersion: 0.1.22 # version of chart to use. Defaults to empty string, which results in using latest
  helmVersion: v2.14.1  # version of helm-client to use. See https://hub.docker.com/r/wharfse/helm/tags
  cluster: kubectl-config # Name of config-map containing cluster kubeconfig, use 'hybrid-config' for new cluster
  secret: helm-registry # kubernetes secret to use when downloading charts. Defaults to ${HELM_REG_SECRET} variable
```
