import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim concat operators are only available for the JS target".}

proc concat*(observable: Observable, observable: varargs[auto]): auto {.
    importjs "rxjs.operators.concat".}
proc concatMap*(project: auto): auto {.importjs "rxjs.operators.concatMap".}
proc concatMap*(project: auto, resultSelector: auto): auto {.
    importjs "rxjs.operators.concatMap".}

proc concatMapTo*(innerObservable: auto): auto {.
    importjs "rxjs.operators.concatMapTo".}
proc concatMapTo*(innerObservable: auto, resultSelector: auto): auto {.
    importjs "rxjs.operators.concatMapTo".}
proc concatAll*(): auto {.importjs "rxjs.operators.concatAll".}
