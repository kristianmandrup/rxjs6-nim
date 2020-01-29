import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim publish operators are only available for the JS target".}

proc publish*(selector: auto): auto {.importjs "rxjs.operators.publish".}
proc publishLast*(): auto {.importjs "rxjs.operators.publishLast".}
proc publishBehavior*(value: auto): auto {.
    importjs "rxjs.operators.publishBehavior".}

proc publishReplay*(): auto {.importjs "rxjs.operators.publishReplay".}
proc publishReplay*(bufferSize: cint): auto {.
    importjs "rxjs.operators.publishReplay".}
proc publishReplay*(bufferSize: cint, windowTime: cint): auto {.
    importjs "rxjs.operators.publishReplay".}
proc publishReplay*(bufferSize: cint, windowTime: cint,
    selectorOrScheduler: auto): auto {.importjs "rxjs.operators.publishReplay".}
proc publishReplay*(bufferSize: cint, windowTime: cint,
    selectorOrScheduler: auto, scheduler: auto): auto {.
        importjs "rxjs.operators.publishReplay".}
