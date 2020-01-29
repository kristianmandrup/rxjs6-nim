import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim distinct operators are only available for the JS target".}

proc distinct*(keySelector: auto): auto {.
importjs "rxjs.operators.distinct".}
proc distinct*(keySelector: auto, flushes: Observable): auto {.
importjs "rxjs.operators.distinct".}

proc distinctUntilChanged*(compare: proc(x: auto, y: auto): auto): auto {.
importjs "rxjs.operators.distinctUntilChanged".}
proc distinctUntilChanged*(compare: proc(x: auto, y: auto): auto, keySelector: auto): auto {.
importjs "rxjs.operators.distinctUntilChanged".}

proc distinctUntilKeyChanged*(key: auto): auto {.
importjs "rxjs.operators.distinctUntilKeyChanged".}
proc distinctUntilKeyChanged*(key: auto, compare: proc(x: auto, y: auto): auto): auto {.
importjs "rxjs.operators.distinctUntilKeyChanged".}