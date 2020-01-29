import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim share operators are only available for the JS target".}

proc share*(): auto {.
importjs "rxjs.operators.share".}
proc shareReplay*(): auto {.
importjs "rxjs.operators.shareReplay".}
proc shareReplay*(configOrBufferSize: cint): auto {.
importjs "rxjs.operators.shareReplay".}
proc shareReplay*(configOrBufferSize: cint, windowTime: cint): auto {.
importjs "rxjs.operators.shareReplay".}
proc shareReplay*(configOrBufferSize: cint, windowTime: cint,
    scheduler: SchedulerLike): auto {.
    importjs "rxjs.operators.shareReplay".}
