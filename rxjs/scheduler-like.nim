import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim SchedulerLike is only available for the JS target".}

type
  SchedulerLike = JsObject

{.push importcpp.}
proc now(scheduler: SchedulerLike): number
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto])): Subscription
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto]), delay: cint): Subscription
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto]), delay: cint, state: auto): Subscription
{.pop.}
