import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim merge operators are only available for the JS target".}

proc mergeMap*(project: auto): auto {.importjs "rxjs.operators.mergeMap" .}
proc mergeMap*(project: auto, resultSelector: auto): auto {.importjs "rxjs.operators.mergeMap" .}
proc mergeMap*(project: auto, resultSelector: auto, concurrent: auto): auto {.importjs "rxjs.operators.mergeMap" .}

proc mergeMapTo*(innerObservable: auto, resultSelector: auto)): auto {.importjs "rxjs.operators.mergeMapTo" .}
proc mergeMapTo*(innerObservable: auto, resultSelector: auto), concurrent: cint): auto {.importjs "rxjs.operators.mergeMapTo" .}

proc mergeAll*(number: cint): auto {.importjs "rxjs.operators.mergeAll" .}
proc mergeScan*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto): auto {.importjs "rxjs.operators.mergeScan" .}
proc mergeScan*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto, concurrent: cint): auto {.importjs "rxjs.operators.mergeScan" .}
