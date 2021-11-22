# GORM "where in" clause

These code samples are using GORM (<https://gorm.io/>), as we're using
that in our main API ([wharf-api](https://github.com/iver-wharf/wharf-api)).

## WHERE column IN slice

Finding a row with the GORM `.Where` method supports adding in slice of values,
such as when checking if the primary key is in a set of values.

The issue is that the documentation, as of today (2021-11-18), states that you
can supply a slice of strings (`[]string`) when doing an SQL `WHERE IN` clause:

> ```go
> // IN
> db.Where("name IN ?", []string{"jinzhu", "jinzhu 2"}).Find(&users)
> // SELECT * FROM users WHERE name IN ('jinzhu','jinzhu 2');
> ```
>
> <https://gorm.io/docs/query.html#String-Conditions>

:warning: However, this does not work!

The following SQL is actually what's getting generated:

```sql
SELECT * FROM `users`
WHERE `user`.`id` IN (
  "name IN ?",
  ("jinzhu","jinzhu 2")
)
```

To counter this, use a slice of empty interfaces instead:

```go
db.Where("name IN ?", []interface{}{"jinzhu", "jinzhu 2"}).Find(&users)
```

Which generates:

```sql
SELECT * FROM users WHERE name IN ('jinzhu','jinzhu 2');
```

## WHERE primary key IN

It's still fully valid to use `WHERE IN` with non-`[]interface{}` slices, as
long as you are acting on the primary key.

```go
db.Where([]int{1, 2, 3}).Find(&users)
// SELECT * FROM users WHERE id IN (1, 2, 3);

db.Where([]interface{}{1, 2, 3}).Find(&users)
// SELECT * FROM users WHERE id IN (1, 2, 3);
```
