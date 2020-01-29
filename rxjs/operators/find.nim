import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim find operators are only available for the JS target".}

proc find*(predicate: proc(value: auto, index: cint, source: auto): auto) {.
    importjs "rxjs.operators.pairwise".}
proc find*(predicate: proc(value: auto, index: cint, source: auto,
    thisArg: auto): auto) {.importjs "rxjs.operators.pairwise".}

proc findIndex*(predicate: proc(value: auto, index: cint,
    source: auto): auto) {.importjs "rxjs.operators.pairwise".}
proc findIndex*(predicate: proc(value: auto, index: cint, source: auto,
    thisArg: auto): auto) {.importjs "rxjs.operators.pairwise".}
