# Coding styles: REST API

This applies to our [wharf-api](https://github.com/iver-wharf/wharf-api) repo.

## Strict REST or relaxed REST

We strive for "strict REST", meaning we try to honor the REST styles as best we
can.

## Verbs

Do not use `POST` for everything. Instead, use:

- `GET` to read data. Cannot have side effects. Cannot have a request body.

- `POST` to create data. Requesting multiple times should create multiple
  objects.

- `PUT` to update data by replacing all data. Idempotent: requesting multiple
  times has the same effect as requesting once.

- `PATCH` to update data surgically by replacing only some fields. Idempotent:
  requesting multiple times has the same effect as requesting once.

- `DELETE` to remove an object.

## Naming convention

### Path

Singular. Segments correlate to object type name.

```http
// Good:
POST /api/project
GET /api/project/1/branch

// Bad:
POST /api/projects
GET /api/project/1/branches
```

### Path parameters

*(Only applies to implementations and Swagger/OpenAPI specifications)*

"JSON"-formatted, camelCased. ID parameters start with the type name.

```http
// Good:
PUT /api/project/{projectId}
GET /api/build?stage=ALL
GET /api/build/{buildId}/artifact/{artifactId}

// Bad:
PUT /api/project/{id}
GET /api/build?Search_Query=foo+bar
```
