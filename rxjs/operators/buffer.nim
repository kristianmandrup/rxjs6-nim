import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim buffer operators are only available for the JS target".}

proc bufferCount*(bufferSize: cint): auto {.
    importjs "rxjs.operators.bufferCount".}
proc bufferCount*(bufferSize: cint, startBufferEvery: cint): auto {.
    importjs "rxjs.operators.bufferCount".}
proc bufferTime*(bufferTimeSpan: cint): auto {.
    importjs "rxjs.operators.bufferTime".}
proc bufferToggle*(openings: auto, closingSelector: proc(value: auto) =>
    auto): auto {.importjs "rxjs.operators.bufferToggle".}
proc bufferWhen*(closingSelector: proc() => Observable): auto {.
    importjs "rxjs.operators.bufferWhen".}
