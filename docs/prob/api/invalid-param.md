# Problem: Invalid API parameter

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Invalid API parameter.`
- Type: `/prob/api/invalid-param`

<!-- div:left-panel -->

Parsing or validating a value sent to the API failed.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Most fields are validated in the frontend, but if you're calling the backend API
directly or if there is some validation rule missing in the frontend, then this
problem may arise.

The problem is related to the backend trying to parse or validate an input value
but fails because of an invalid value.

This problem is the fallback error for any special parameter types. Meaning,
that this problem does not describe in detail which field was invalid or in what
way it was considered invalid.

<!-- div:right-panel -->

Non-exhaustive list of potential issues:

- invalid date format,
- text string that is too long or too short (too many or too few characters),
- URL that's missing the protocol (`https://`),
- submitting "F" when only "A", "B", or "C" is allowed,
- *or potentially something divergent from the above.*

<!-- panels:end -->

## Resolving it

The problem detail message that is provided by the error message should be able
to lead you to understanding the issue at hands.

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
