import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim throttle operators are only available for the JS target".}

proc throttle*(durationSelector: proc(value: auto): auto): auto {.importjs "rxjs.operators.throttle".}
proc throttle*(durationSelector: proc(value: auto): auto): auto {.importjs "rxjs.operators.throttle".}
  config: JsObject): auto

proc throttleTime*(duration: cint): auto {.importjs "rxjs.operators.throttleTime".}
proc throttleTime*(duration: cint, scheduler: auto): auto {.importjs "rxjs.operators.throttleTime".}
proc throttleTime*(duration: cint, scheduler: auto, config: JsObject): auto {.importjs "rxjs.operators.throttleTime".}
