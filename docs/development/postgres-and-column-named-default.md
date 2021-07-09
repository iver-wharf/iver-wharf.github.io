# Postgres and column named `default`

Having a column named `default` has some issues, as `default` is considered a
keyword in PostgreSQL.

These code samples are using GORM (<https://gorm.io/>), as we're using that in
our main API ([wharf-api](https://github.com/iver-wharf/wharf-api)).

## Querying

Make sure to quote the column name

```go
// Bad:
m.Database.Where("default = ?", true)
```

```go
// Good:
m.Database.Where(`"default" = ?`, true)
```

## Updating

:heavy_check_mark: **Do** quote the column name when inside a `.Where()`

:x: **Do NOT** quote the column name inside an `.Update()`

```go
// Bad:
m.Database.
	Model(&Branch{}).
	// missing quotes in .Where()
	Where("default = ? AND project_id = ? AND name != ?", true, defaultBranch.ProjectID, defaultBranch.Name).
	Update("default", false)

// Bad:
m.Database.
	Model(&Branch{}).
	Where("default = ? AND project_id = ? AND name != ?", true, defaultBranch.ProjectID, defaultBranch.Name).
	// excess quotes in .Update()
	Update(`"default"`, false)
```

```go
// Good:
m.Database.
	Model(&Branch{}).
	Where(`"default" = ? AND project_id = ? AND name != ?`, true, defaultBranch.ProjectID, defaultBranch.Name).
	Update("default", false)
```
