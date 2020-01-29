import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim take operators are only available for the JS target".}

proc take*(count: cint): auto {.importjs "rxjs.operators.take".}
proc takeLast*(count: cint): auto {.importjs "rxjs.operators.takeLast".}
proc takeUntil*(notifier: Observable): auto {.
    importjs "rxjs.operators.takeUntil".}

proc takeWhile*(predicate: proc(value: auto, number: cint): auto): auto {.
    importjs "rxjs.operators.takeWhile".}
proc takeWhile*(predicate: proc(value: auto, number: cint): auto,
    inclusive: auto): auto {.importjs "rxjs.operators.takeWhile".}
