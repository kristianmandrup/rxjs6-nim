import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim window operators are only available for the JS target".}

proc window*(windowBoundaries: Observable): auto {.
importjs "rxjs.operators.window".}
proc windowCount*(windowSize: cint, startWindowEvery: cint): auto {.
importjs "rxjs.operators.windowCount".}
proc windowToggle*(openings: Observable, closingSelector: proc(
    openValue: auto): Observable): auto {.
    importjs "rxjs.operators.windowToggle".}
proc windowWhen*(closingSelector: proc(): Observable): auto {.
importjs "rxjs.operators.windowWhen".}
