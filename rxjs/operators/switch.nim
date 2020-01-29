import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim switch operators are only available for the JS target".}

proc switchAll*(): auto {.importjs "rxjs.operators.switchAll".}
proc switchMap*(project: proc(value: auto, index: cint): auto): auto {.
    importjs "rxjs.operators.switchMap".}
proc switchMap*(project: proc(value: auto, index: cint): auto,
    resultSelector: auto): auto {.importjs "rxjs.operators.switchMap".}
proc switchMapTo*(innerObservable: auto, resultSelector: proc(outerValue: auto,
    innerValue: auto, outerIndex: cint, innerIndex: cint): auto): auto {.
        importjs "rxjs.operators.switchMapTo".}
