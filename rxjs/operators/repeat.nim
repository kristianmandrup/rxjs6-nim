import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim repeat operators are only available for the JS target".}

proc repeat*(): auto {.importjs "rxjs.operators.repeat".}
proc repeat*(count: cint): auto {.importjs "rxjs.operators.repeat".}
proc repeatWhen*(notifier: proc(notifications: Observable): Observable): auto {.
    importjs "rxjs.operators.repeat".}
