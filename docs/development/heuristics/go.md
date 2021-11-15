# Coding styles: Go

This article is structured like an FAQ because these are taken from meeting
notes where we came together and decided upon this.

## Idiomatic or borrow practices

Always prefer idiomatic Go. This will be the theme for all the following
guidelines.

Most of us are used to C# with their Linq queries, inheritance, and such.
However we do not let this be an excuse, as we do not want to bend the language
to our will, and in doing so leading to us fighting the language.

## Naming convention

Depends on the use case.

Rule of thumb: **Variable names must be self-explanatory and the length should
correlate to it's lifetime,** with the exception of method receivers that
should be really short.

You should not need to look at the regarded implementation in the code block to
understand what a variable does. Short names fit very well in certain contexts,
such as `i` is a terrible parameter name, while it's an excellent `for`-loop
index identifier.

> "Short naming is a principle, not a rule"
>
> <https://dave.cheney.net/practical-go/presentations/qcon-china.html#_identifier_length>

### Package names

Short, singular, lowercase, and no delimiters. Keep it to only one word if
possible. We do not have any "prefix" convention to our packages.

```go
// Good:
package stringutil
package set

// Bad:
package string_utils
package wharfApi
package sets
```

## "Scout rule"

> "Leave a place better than you found it"

Yes and no. Do not clutter/bloat your pull requests (PR) with too many unrelated
changes.

Numerous minor or few big changes (that are not strictly required for the PR)
-> do it in different PR.

## Code formatting

All devs must use [`goimports`](https://pkg.go.dev/golang.org/x/tools/cmd/goimports).

Add it to your editor so it formats your file every time you save it.

This enforces the style of indentation, spacing, wrapping, imports sorting, and
so on.

## Linting

All our repositories have linting options, which can be triggered via our NPM
scripts `npm run lint`, or more specifically:

- Markdown: `npm run lint-md` (uses [remark-lint](https://github.com/remarkjs/remark-lint))
- Go: `npm run lint-go` (uses [revive](https://revive.run/))
- Angular: `npm run lint-ng` (uses [ng](https://angular.io/cli/lint))

This is enforced by continuous integration on all pull requests, but recommended
to run them locally to get faster iteration speed.

## Writing tests

Fully optional to write tests, but highly encouraged. Writing the tests first
followed by the implementation itself (á la TDD) is a good idea to get this
done, but it's nothing we have as a strict requirement.

### Assertions vs if-statements

We rely on <https://github.com/stretchr/testify> in our tests to write "assert"
statements instead of "if-statements" for each assertion.

```go
// Good:
import "github.com/stretchr/testify/assert"

assert.Equal(t, want, got, "some message")

// Discouraged:
if want != got {
  t.Errorf("want %q; got %q. some message", want, got)
}
```

This is our exception to our "idiomatic Go" promise. We are too used to testing
libraries such as [NUnit](https://nunit.org/) that we cannot let go of the
assertion-based testing style.

### Fake/mock/stub naming

Whatever you want to call them. While the terms do have different semantics, we
do not bother if you use "mock" everywhere.

## Release notes

Yes, we do collect release notes. No, not automatically from Git commit
messages. See the section about [Changelog](development/changelogs/)

## Interfaces vs structs

Use structs for value collections, e.g configs.

Use interfaces for behaviors.

Strongly advice to pay extra attention to the ["Interfaces" section of
"Go Code Review Comments"](https://github.com/golang/go/wiki/CodeReviewComments#interfaces).

## External sources

As in, other sources you as a developer should delve into it before
contributing to Wharf.

We take a lot of inspiration from the below sources.

### Must read

- Go Code Review Comments (<https://github.com/golang/go/wiki/CodeReviewComments>)

- Effective Go (<https://golang.org/doc/effective_go.html>)

- Practical Go: Real world advice for writing maintainable Go programs (<https://dave.cheney.net/practical-go/presentations/qcon-china.html>)

- GopherCon 2016: Francesc Campoy - Understanding nil (<https://www.youtube.com/watch?v=ynoY2xz-F8s>,
  *it's a video, so maybe a "must consume" instead of "must read"*)

### Should read

Feel rusty on Go? Go through the tour. Every Wharf developer should complete it.

- https://tour.golang.org/

### Good to read

- Standard Go Project Layout (<https://github.com/golang-standards/project-layout>)

- Clean Code: Smells and Heuristics (<https://moderatemisbehaviour.github.io/clean-code-smells-and-heuristics/>)

- Microsoft REST API Guidelines (<https://github.com/microsoft/api-guidelines#readme>)
