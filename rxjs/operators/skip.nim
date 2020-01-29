import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim skip operators are only available for the JS target".}

proc skipLast*(count: cint): auto {.importjs "rxjs.operators.skipLast".}
proc skipUntil*(notifier: Observable): auto {.
    importjs "rxjs.operators.skipUntil".}
proc skipWhile*(predicate: proc(value: auto, number: cint): auto): auto {.
    importjs "rxjs.operators.skipWhile".}
