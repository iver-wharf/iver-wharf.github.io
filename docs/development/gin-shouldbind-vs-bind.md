# Gin ShouldBind vs Bind

These code samples are using Gin (<https://gin-gonic.com/>), as we're using
that in our main API ([wharf-api](https://github.com/iver-wharf/wharf-api)) and
provider APIs (such as [wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github))

## Why not Bind

<!-- panels:start -->

<!-- div:left-panel -->

The `gin.Context.Bind...` methods have two behaviors to them. One is that it
tries to bind the content of the given content to the given object, and the
other is that if it fails then it will set the HTTP status code to
`400 Bad Request` and add the header `Content-Type: text/plain; charset=utf-8`
to the response.

The `gin.Context.ShouldBind...` methods does the same binding as well, but it
does not affect the `gin.Context` in any way.

We want to set our own `Content-Type` and HTTP status via the
`problem.Response` helper functions found inside the
[`github.com/iver-wharf/wharf-core/pkg/ginutil`](https://pkg.go.dev/github.com/iver-wharf/wharf-core/pkg/ginutil)
package, such as the [`WriteInvalidBindError`](https://pkg.go.dev/github.com/iver-wharf/wharf-core/pkg/ginutil#WriteInvalidBindError)
function, as they will also write an appropriate JSON response.

Read more about the distinction over at the Gin documentation:
<https://github.com/gin-gonic/gin#model-binding-and-validation>

<!-- div:right-panel -->

| Use this                       | Instead of               |
| --------                       | ----------               |
| `gin.Context.ShouldBindHeader` | `gin.Context.BindHeader` |
| `gin.Context.ShouldBindJSON`   | `gin.Context.BindJSON`   |
| `gin.Context.ShouldBindQuery`  | `gin.Context.BindQuery`  |
| `gin.Context.ShouldBindXML`    | `gin.Context.BindXML`    |
| `gin.Context.ShouldBindYAML`   | `gin.Context.BindYAML`   |
| `gin.Context.ShouldBind`       | `gin.Context.Bind`       |

<!-- panels:end -->

## Example

:heavy_check_mark: Good:

```go
import (
   "github.com/gin-gonic/gin"
   "github.com/iver-wharf/wharf-core/pkg/ginutil"
)

func myRequestHandler(c *gin.Context) {
   if err := c.ShouldBind(&myType) { // leaves Content-Type unchanged
      ginutil.WriteInvalidBindError(c, err, ...) // will set Content-Type: application/problem+json
      return
   }
}
```

:x: Bad:

```go
import (
   "github.com/gin-gonic/gin"
   "github.com/iver-wharf/wharf-core/pkg/ginutil"
)

func myRequestHandler(c *gin.Context) {
   if err := c.Bind(&myType) { // will set Content-Type: text/plain; charset=utf-8
      ginutil.WriteInvalidBindError(c, err, ...) // will fail to set Content-Type: application/problem+json
      return
   }
}
```
