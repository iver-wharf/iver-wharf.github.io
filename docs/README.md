# Wharf

Wharf adds the capabilities of self hosting and even running locally to the
category of Continuous Integration and Continuous Deployment (CI/CD) tooling,
while focusing on staying light weight. The only thing in your CI/CD pipeline
that takes up significant CPU/RAM resources is your builds themselves.

You deploy Wharf and grant it access to a [Kubernetes][kubernetes] cluster,
where it will start any builds you tell it to run. You connect your favorite
project provider, being [GitHub][github], [GitLab][gitlab], or
[Azure DevOps][azuredevops], or any other provider by creating your own provider
driver for anything as long as it can allow Wharf to obtain its files.

The backend of Wharf is written in the [Go][go] language together with the
[GORM][gorm] and [Gin][gin-gonic] frameworks. The frontend is written in
[TypeScript][typescript] and uses [Angular][angular] and [PrimeNG][primeng].

Wharf aims to become 100% open sourced by the end of 2021 in both its code and
its transparent project planning.

[angular]: https://angular.io/
[azuredevops]: https://dev.azure.com/
[gin-gonic]: https://gin-gonic.com/
[github]: https://github.com/
[gitlab]: https://gitlab.com/
[go]: https://golang.org/
[gorm]: https://gorm.io/
[kubernetes]: https://kubernetes.io/
[primeng]: https://primefaces.org/primeng/
[typescript]: https://www.typescriptlang.org/
