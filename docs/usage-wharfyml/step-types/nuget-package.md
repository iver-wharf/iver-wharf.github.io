# Nuget-package step

Builds and packages a NuGet package via `dotnet pack` and then uploads it
to the given destination repository.

```yaml
nuget-package:
  version: 1.0.0 # Fed to dotnet pack via -p:Version=$version
  project-path: src/MyDotNetProject
  repo: nuget.local
  # Optional arguments
  skip_duplicate: false # silently continues if package version already exists in repo (defaults to false)
  certificatesMountPath: /usr/local/share/ca-certificates # if defined add a k8s configmap containing the different certificates to be added and then mount the configmap as a volume into the folder specified by this property. 
```
