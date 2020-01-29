import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim throttle operators are only available for the JS target".}

proc map*(project: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.operators.map".}
proc map*(project: proc(value: auto, index: cint): auto, thisArg: auto): auto {.
importjs "rxjs.operators.map".}
proc mapTo*(value: auto):auto {.
importjs "rxjs.operators.mapTo".}

proc flatMap*(project: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.operators.flatMap".}
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto): auto {.
importjs "rxjs.operators.flatMap".}
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto, concurrent: cint): auto {.
importjs "rxjs.operators.flatMap".}
