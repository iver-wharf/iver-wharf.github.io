# Kubectl step

Run `kubectl apply` on a resource.

```yaml
kubectl:
  file: deploy/api.yaml # Either `file` or `files` is required
  files: # Either `file` or `files` is equired
    - deploy/web.yaml
    - deploy/api.yaml
  # Optional arguments
  namespace: stage # target Kubernetes namespace for kubectl. Uses namespace set in the 'cluster' config or the 'metadata.namespace' property from the manifest files if omitted.
  action: apply # kubectl ${action}, ex: 'create', 'apply', 'patch', 'delete', 'replace', etc. Default is 'apply'
  force: false # will apply '--force' flag if set to true. Default is false
  cluster: kubectl-config # Name of config-map containing cluster kubeconfig, use 'hybrid-config' for new cluster
```
