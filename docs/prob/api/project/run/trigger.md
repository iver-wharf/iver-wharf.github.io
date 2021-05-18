# Problem: Triggering build failed

<!-- panels:start -->

<!-- div:right-panel -->

- Title: `Triggering build failed.`
- Type: `/prob/api/project/run/trigger`

<!-- div:left-panel -->

Wharf's API failed to communicate with the execution engine and tell it to start
executing the build.

<!-- panels:end -->

## Possible causes

<!-- panels:start -->

<!-- div:left-panel -->

There are plentyful of reasons why the Wharf API has been unable to talk with
the execution engine. Most of these issues are operations-related, meaning that
it's something with how your Wharf installation has been set up.

Potential causes ranges from network issues, to TLS/certificate issues, or even
as mundane issues such as someone accidentally shut it off.

<!-- div:right-panel -->

Examples:

- Execution engine was offline when the Wharf API tried to communicate with it
  (ex: restarting, failed to start, or being relocated to a different server by
  [Kubernetes' evicion policies](https://kubernetes.io/docs/concepts/scheduling-eviction/eviction-policy/))
  
- Execution engine was never deployed. Wether you're using [Jenkins](https://www.jenkins.io/)
  or Wharf's own execution engine, if you never deployed it then no builds can
  be started.

- Execution engine is misconfigured and responded with a
  [non-2xx status code.](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#2xx_success)
  
- Network issues between the execution engine and the Wharf API processes.
  Perhaps a misconfigured firewall or network policy.

<!-- panels:end -->

## Resolving it

This is out of scope for any user that solely reaches either Wharf's web
interface or REST API. Suggest you try to contact your
administrator / operations team that manages your Wharf instance.

If that fails, try promoting the issue over to the Wharf developers over at
GitHub as an issue: <https://github.com/iver-wharf/wharf-api/issues/new>
