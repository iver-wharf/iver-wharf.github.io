# Problem: Invalid integer value

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Invalid integer value.`
- Type: `/prob/api/invalid-param-int`

<!-- div:left-panel -->

Parsing or validating a value as an integer failed.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

Most fields are validated in the frontend, but if you're calling the backend API
directly or if there is some validation rule missing in the frontend, then this
problem may arise.

The problem is related to the backend trying to parse or validate an input value
but fails because of invalid an value.

This problem specifically relates to invalid integers. Numbers with fractions
are considered invalid, as well as things like empty values or text containing
letters instead of digits.

Usually something like the ID number of the project for which you're trying to
view details for could trigger this problem.

<!-- div:right-panel -->

:heavy_check_mark: Example valid values:

- `0`
- `1`
- `12345`
- `-50`

:x: Example invalid values:

- ` ` *(empty value)*
- `foo` *(no digits)*
- `15.25` *(fractions not allowed)*
- `$40` *(prefixes or suffixes not allowed)*
- `10 000` *(infix thousand separators not allowed)*
- `9223372036854775808` *(number is too big)*

<!-- panels:end -->

## Resolving it

If you're entering values manually through some input fields, then make sure
the field that expects an integer is actually an integer and does not have any
other invalid symbols in there such as excess spaces or the letter O instead of
a zero 0.

If you cannot resolve it yourself using the error message, try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
