import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim operators are only available for the JS target".}

# Operators: See https://rxjs.dev/api/operators

proc pairwise*(): auto {.importjs "rxjs.operators.pairwise" .}
proc withLatestFrom*(args: varargs[auto]): auto {.importjs "rxjs.operators.withLatestFrom" .}
proc sequenceEqual*(compareTo: Observable, comparator: proc(a: auto, b: auto): auto): auto {.importjs "rxjs.operators.count" .}
proc count*(predicate: proc(value: auto, number: cint, source: Observable): auto): auto 
proc scan*(accumulator: proc(acc: auto, value: auto, index: cint):auto): auto {.importjs "rxjs.operators.scan" .}
proc scan*(accumulator: proc(acc: auto, value: auto, index: cint):auto, seed: auto): auto {.importjs "rxjs.operators.scan" .}
proc empty*(): auto {.importjs "rxjs.operators.empty" .}
proc empty*(scheduler: SchedulerLike): auto {.importjs "rxjs.operators.empty" .}

proc isEmpty*(): bool proc empty*(): auto {.importjs "rxjs.operators.isEmpty" .}
proc range*(start: cint): Observable proc isEmpty*(): bool proc empty*(): auto {.importjs "rxjs.operators.range" .}
proc range*(start: cint, count: cint): Observable {.importjs "rxjs.operators.range" .}
proc range*(start: cint, count: cint, scheduler: SchedulerLike): Observable {.importjs "rxjs.operators.range" .}

proc reduce*(accumulator: proc(acc: auto, args: varargs[auto]): auto): auto {.importjs "rxjs.operators.reduce" .}
proc reduce*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto): auto {.importjs "rxjs.operators.reduce" .}

proc retry*(count: cint): auto {.
importjs "rxjs.operators.retry".}
proc retryWhen*(notifier: proc(errors: Observable): Observable>):auto {.
importjs "rxjs.operators.retryWhen".}

proc skip*(count: cint): auto {.
importjs "rxjs.operators.skip".}
proc startWith*(schedulers: varargs[auto]): auto {.
importjs "rxjs.operators.startWith".}

proc filter*(predicate: proc(value: auto, number: cint): auto): auto {.
importjs "rxjs.operators.filter".}
proc filter*(predicate: proc(value: auto, number: cint): auto, thisArg: auto): auto {.
importjs "rxjs.operators.filter".}

proc webSocket*(urlConfigOrSource: auto): auto {.
importjs "rxjs.operators.webSocket".}

proc debounce*(durationSelector: proc(value: auto): auto): auto {.
importjs "rxjs.operators.debounce".}

proc debounceTime*(dueTime: cint, scheduler: auto): auto {.
importjs "rxjs.operators.debounceTime".}

proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.operators.delayWhen".}
proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto, subscriptionDelay: Observable): auto {.
importjs "rxjs.operators.delayWhen".}

proc pluck*(properties: varargs[cstring]): auto {.
importjs "rxjs.operators.pluck".}

proc groupBy*(keySelector: proc(value: auto): auto, elementSelector: auto, durationSelector: auto, subjectSelector: auto): auto {.
importjs "rxjs.operators.groupBy".}

proc tap*(): auto {.
importjs "rxjs.operators.tap".}
proc tap*(nextOrObserver: auto): auto {.
importjs "rxjs.operators.tap".}
proc tap*(nextOrObserver: auto, error: auto): auto {.
importjs "rxjs.operators.tap".}
proc tap*(nextOrObserver: auto, error: auto, complete: auto): auto {.
importjs "rxjs.operators.tap".}

proc materialize*(): auto {.
importjs "rxjs.operators.materialize".}
proc catchError*(selector: proc(err: auto, caught: Observable): auto): auto {.
importjs "rxjs.operators.catchError".}
proc onErrorResumeNext*(nextSources: varargs[auto]): auto {.
importjs "rxjs.operators.onErrorResumeNext".}

proc elementAt*(index: cint): auto {.
importjs "rxjs.operators.elementAt".}
proc elementAt*(index: cint, defaultValue: auto): auto {.
importjs "rxjs.operators.elementAt".}

proc endWith*(schedulers: varargs[auto]): auto {.
importjs "rxjs.operators.endWith".}

proc every*(predicate: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.operators.every".}
proc every*(predicate: proc(value: auto, index: cint): auto, thisArg: auto): auto {.
importjs "rxjs.operators.every".}

proc min*(comparer: proc(x: auto, y: auto): auto): auto {.
importjs "rxjs.operators.min".}
proc max*(comparer: proc(x: auto, y: auto): auto): auto {.
importjs "rxjs.operators.max".}

proc last*(predicate: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.operators.last".}
proc last*(predicate: proc(value: auto, index: cint): auto, defaultValue: auto): auto {.
importjs "rxjs.operators.last".}

proc defaultIfEmpty*(defaultValue: auto): auto {.
importjs "rxjs.operators.defaultIfEmpty".}

proc first*(predicate: proc(value: auto, index: cint, source: auto): auto) {.
importjs "rxjs.operators.first".}
proc first*(predicate: proc(value: auto, index: cint, source: auto, defaultValue: auto): auto) {.
importjs "rxjs.operators.first".}

proc finalize*(callback: proc()): auto {.
importjs "rxjs.operators.finalize".}

proc single*(predicate: proc(value: auto, index: cint, source: auto): auto) {.
importjs "rxjs.operators.single".}

proc multicast*(subjectOrSubjectFactory: auto, selector: proc(source: Observable): Observable): auto {.
importjs "rxjs.operators.multicast".}

proc delay*(delay: cint): auto {.
importjs "rxjs.operators.delay".}
proc delay*(delay: cint, scheduler: SchedulerLike): auto {.
importjs "rxjs.operators.delay".}

proc expand*(project: proc(value: auto, index: cint): any, concurrent: cint): auto {.
importjs "rxjs.operators.expand".}
proc expand*(project: proc(value: auto, index: cint): any, concurrent: cint, scheduler: SchedulerLike): auto {.
importjs "rxjs.operators.expand".}

proc observeOn*(scheduler: SchedulerLike): auto {.
importjs "rxjs.operators.observeOn".}
proc observeOn*(scheduler: SchedulerLike, delay: cint): auto {.
importjs "rxjs.operators.observeOn".}

proc ignoreElements*():auto
{.pop.}
