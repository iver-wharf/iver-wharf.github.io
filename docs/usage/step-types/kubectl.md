# Kubectl step

Run `kubectl apply` on a resource.

```yaml
kubectl:
  files: ['deploy/api.yaml']
  namespace: stage
  # Optional arguments
  action: apply # kubectl ${action}, ex: 'create', 'apply', 'patch', 'delete', etc. Default is 'apply'
  force: false # will apply '--force' flag if set to true. Default is false
  cluster: 'kubectl-config' # Name of config-map containing cluster kubeconfig, use 'hybrid-config' for new cluster
```
