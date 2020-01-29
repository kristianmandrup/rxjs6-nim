import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim throttle operators are only available for the JS target".}

proc timeout*(due: auto, scheduler: SchedulerLike): auto {.
importjs "rxjs.operators.timeout".}
proc timeout*(due: auto, withObservable: auto,
  scheduler: SchedulerLike): auto {.importjs "rxjs.operators.timeout".}
proc timeInterval*(scheduler: SchedulerLike): auto {.
    importjs "rxjs.operators.timeInterval".}
proc timestamp*(scheduler: SchedulerLike): auto {.
    importjs "rxjs.operators.timestamp".}
