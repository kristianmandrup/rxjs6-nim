import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim SchedulerLike is only available for the JS target".}

type
  SchedulerLike = JsObject

proc now(scheduler: SchedulerLike): number {.
importjs "rxjs.now".}
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto])): Subscription {.
    importjs "rxjs.schedule".}
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto]), delay: cint): Subscription {.
    importjs "rxjs.schedule".}
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction,
    args: varargs[auto]), delay: cint, state: auto): Subscription {.
    importjs "rxjs.schedule".}
{.pop.}
