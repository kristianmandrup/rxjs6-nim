import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim throttle operators are only available for the JS target".}

proc sample*(notifier: Observable): auto {.importjs "rxjs.operators.sample".}
proc sampleTime*(period: number): auto {.importjs "rxjs.operators.sampleTime".}
proc sampleTime*(period: number, scheduler: SchedulerLike): auto {.
    importjs "rxjs.operators.sampleTime".}
