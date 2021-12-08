# Getting started with development of Wharf

## Prepare your workspace

1. Install Git

2. Install Docker & Docker Compose (both usually come shipped together)

3. Create a folder to work in, for example named `wharf` in your personal
   documents folder (`C:/Users/YourName/Documents` or `~/Documents`).

## Clone the repositories

If you're rocking terminal, you can clone them using the the following commands:

<!-- tabs:start -->

### **Clone via [GitHub CLI](https://github.com/cli/cli)**

```bash
gh repo clone iver-wharf/wharf-docker-compose
gh repo clone iver-wharf/wharf-api
gh repo clone iver-wharf/wharf-web
gh repo clone iver-wharf/wharf-provider-gitlab
gh repo clone iver-wharf/wharf-provider-github
gh repo clone iver-wharf/wharf-provider-azuredevops
```

### **Clone via SSH**

```bash
git clone git@github.com:iver-wharf/wharf-docker-compose.git
git clone git@github.com:iver-wharf/wharf-api.git
git clone git@github.com:iver-wharf/wharf-web.git
git clone git@github.com:iver-wharf/wharf-provider-gitlab.git
git clone git@github.com:iver-wharf/wharf-provider-github.git
git clone git@github.com:iver-wharf/wharf-provider-azuredevops.git
```

### **Clone via HTTPS**

```bash
git clone https://github.com/iver-wharf/wharf-docker-compose.git
git clone https://github.com/iver-wharf/wharf-api.git
git clone https://github.com/iver-wharf/wharf-web.git
git clone https://github.com/iver-wharf/wharf-provider-gitlab.git
git clone https://github.com/iver-wharf/wharf-provider-github.git
git clone https://github.com/iver-wharf/wharf-provider-azuredevops.git
```

<!-- tabs:end -->

## Link `docker-compose.yml`

To run Docker Compose, it needs the `docker-compose.yml` file. This file lives
in the <https://github.com/iver-wharf/wharf-docker-compose> repository, but
that file cannot live inside the `wharf-docker-compose` directory as
Docker Compose will not be able to find it.

<!-- tabs:start -->

### **UNIX (GNU/Linux, Mac OS X)**

```bash
ln -s wharf-docker-compose/docker-compose.yml docker-compose.yml

ln -s wharf-docker-compose/docker-compose.build.yml docker-compose.override.yml
```

### **Windows `cmd.exe`**

Open `cmd.exe` as an administrator, unless you have [Developer Mode](https://msdn.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development)
enabled, then run:

```batch
mklink docker-compose.yml wharf-docker-compose\docker-compose.yml

mklink docker-compose.override.yml wharf-docker-compose\docker-compose.build.yml
```

### **Windows `PowerShell.exe`**

Open PowerShell as an administrator, then run:

```powershell
New-Item -ItemType SymbolicLink -Path docker-compose.yml -Target wharf-docker-compose\docker-compose.yml

New-Item -ItemType SymbolicLink -Path docker-compose.override.yml -Target wharf-docker-compose\docker-compose.build.yml
```

<!-- tabs:end -->

We will create two [symlinks](https://en.wikipedia.org/wiki/Symbolic_link) to
the `docker-compose.yml` file and the `docker-compose.build.yml` file, so that
when you pull new changes inside the cloned `wharf-docker-compose` repository
directory then the symlink will also update.

The latter file, `docker-compose.build.yml`, includes instructions to
Docker Compose on how to build the services from source code, whereas the
former file, `docker-compose.yml`, will only try to run the pre-built images
hosted over at [Quay.io](https://quay.io/organization/iver-wharf).

The reason we're choosing a different name for the `docker-compose.build.yml`
file is that Docker Compose will by default load files named
`docker-compose.yml`/`.yaml` and `docker-compose.override.yml`/`.yaml`.

## Build and run via Docker Compose

```bash
# Build all services in parallel
docker-compose build --parallel

# Build only 1 of the services, ex: api
# Useful if you know only the api's code has changed
docker-compose build api

# Start running
docker-compose up --abort-on-container-exit
```

The [`--abort-on-container-exit`](https://docs.docker.com/compose/reference/up/)
flag is really helpful in Wharf's case to catch when a service has died, as all
the services combined spew out a lot of logs and it's easy to miss if one of
them has died.

You can find the names of the services (used in `docker-compose build api`)
in the `docker-compose.yml` file. At the time of writing (2021-05-10), those are
`proxy`, `api`, `provider-gitlab`, `provider-github`, `provider-azuredevops`,
`db`

## Accessing locally

- Swagger documentation: (See [Swagger (self-hosted)](../reference/swagger-self-hosted.md))

  - API: <http://localhost:5000/api/swagger/index.html>
  - `gitlab` provider: <http://localhost:5000/import/gitlab/swagger/index.html>
  - `github` provider: <http://localhost:5000/import/github/swagger/index.html>
  - `azuredevops` provider: <http://localhost:5000/import/azuredevops/swagger/index.html>

- Web (if enabled in `docker-compose.build.yml`): <http://localhost:5000/>

  !> The web is disabled by default in the `docker-compose.build.yml`. See how
  to enable it here: [Hot reloading web](development/hot-reloading-web.md)
