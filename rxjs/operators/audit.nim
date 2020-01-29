import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim audit operators are only available for the JS target".}

proc audit*(durationSelector: proc(value: auto): auto): auto {.
    importjs "rxjs.operators.audit".}

proc auditTime*(duration: cint): auto {.importjs "rxjs.operators.auditTime".}
proc auditTime*(duration: cint, scheduler: auto): auto {.
    importjs "rxjs.operators.auditTime".}
