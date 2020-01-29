import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim exhaust operators are only available for the JS target".}

proc exhaust*(): auto {.importjs "rxjs.operators.exhaust".}
proc exhaustMap*(project: proc(value: auto, index: cint): auto): auto {.
    importjs "rxjs.operators.exhaustMap".}
proc exhaustMap*(project: proc(value: auto, index: cint): auto,
    resultSelector: proc(outerValue: auto, innerValue: auto, outerIndex: cint,
    innerIndex: cint): auto): auto {.importjs "rxjs.operators.exhaustMap".}
