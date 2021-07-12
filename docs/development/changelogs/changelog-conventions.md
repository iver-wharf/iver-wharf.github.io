# Changelog conventions

This is a non-extensive list of common changelog note formats used throughout
the repositories 'til this date.

Feel free to add more here when you see a pattern emerge or you want to unify
a type of changelog so they all use a similar format.

## Runtime

```markdown
- Changed Go runtime from v1.13 to v1.16. (#12)
```

## Dependencies

```markdown
- Added dependency on `github.com/sirupsen/logrus`. (#12)
```

```markdown
- Changed version of `github.com/sirupsen/logrus` from v1.0.0 to v2.0.0. (#12)
```

```markdown
- Changed version of numerous dependencies: (#12)

  - `github.com/sirupsen/logrus` from v1.0.0 to v2.0.0
  - `github.com/iver-wharf/wharf-core` from v1.0.0 to v2.0.0
```

```markdown
- Removed dependency on `github.com/sirupsen/logrus`. (#12)
```

## Docker images

```markdown
- Changed version of Docker base image `docker.io/alpine` from v3.13.4
  to v3.14.0. (#12)
```

```markdown
- Changed version of Docker base images: (#12)

  - `docker.io/alpine` from v3.13.4 to v3.14.0
  - `docker.io/golang` from v1.13.4 to v1.16.5
```

## API endpoints

```markdown
- Added endpoint `PUT /provider` as an idempotent way of creating a
  provider. (#28)
```
