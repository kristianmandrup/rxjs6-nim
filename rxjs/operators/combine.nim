import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim combine operators are only available for the JS target".}

proc combineAll*(project: varargs[auto]): auto {.
    importjs "rxjs.operators.combineAll".}
proc combineLatest*(observables: varargs[auto]): auto {.
    importjs "rxjs.operators.combineLatest".}
