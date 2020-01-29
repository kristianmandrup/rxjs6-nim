import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim functions is only available for the JS target".}

proc from*(input: auto): Observable {.
importjs "rxjs.from".}
proc from*(input: auto, scheduler: SchedulerLike): Observable {.
importjs "rxjs.from".}

proc fromEvent*(target: auto, eventName: cstring): Observable {.
importjs "rxjs.fromEvent".}
proc fromEvent*(target: auto, eventName: cstring, options: auto): Observable {.
importjs "rxjs.fromEvent".}
proc fromEvent*(target: auto, eventName: cstring, options: auto, resultSelector: proc(args: varargs): Observable {.
importjs "rxjs.fromEvent".}

proc forkJoin*(sources: varargs[auto]): Observable {.
importjs "rxjs.forkJoin".}
proc merge*(observables: varargs[auto]): Observable {.
importjs "rxjs.merge".}

proc of*(args: varargs[auto]): Observable {.
importjs "rxjs.of".}

proc generate*(initialStateOrOptions: auto): Observable {.
importjs "rxjs.generate".}
proc generate*(initialStateOrOptions: auto, condition: auto): Observable {.
importjs "rxjs.generate".}
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto): Observable {.
importjs "rxjs.generate".}
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto, resultSelectorOrObservable: auto): Observable {.
importjs "rxjs.generate".}
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto, resultSelectorOrObservable: auto, scheduler: SchedulerLike): Observable {.
importjs "rxjs.generate".}

proc defer*(observableFactory: proc(): auto): Observable {.
importjs "rxjs.defer".}
proc concat*(observables: varargs[auto]): Observable {.
importjs "rxjs.concat".}

proc interval*(period: cint, scheduler: SchedulerLike): Observable {.
importjs "rxjs.interval".}

proc partition*(source: any, predicate: proc(value: auto, index: cint): auto): auto {.
importjs "rxjs.partition".}
proc partition*(source: any, predicate: proc(value: auto, index: cint): auto, thisArg: auto): auto {.
importjs "rxjs.partition".}

proc range*(start: cint): Observable {.
importjs "rxjs.range".}
proc range*(start: cint, count: cint): Observable {.
importjs "rxjs.range".}
proc range*(start: cint, count: cint, scheduler: SchedulerLike): Observable {.
importjs "rxjs.range".}

proc timer*(dueTime: auto, periodOrScheduler: auto): Observable {.
importjs "rxjs.timer".}
proc timer*(dueTime: auto, periodOrScheduler: auto, scheduler: SchedulerLike): Observable {.
importjs "rxjs.timer".}

proc pipe*(fns: varargs[auto]): auto {.
importjs "rxjs.pipe".}

proc scheduled*(input: auto, scheduler: auto): Observable {.
importjs "rxjs.scheduled".}

proc using*(resourceFactory: auto, observableFactory: auto): Observable {.
importjs "rxjs.using".}

proc combineLatest*(observables: varargs[auto]): Observable {.
importjs "rxjs.combineLatest".}

proc isObservable*(obj: auto): Observable {.
importjs "rxjs.isObservable".}

proc pairs*(obj: JsObject): Observable {.
importjs "rxjs.pairs".}
proc pairs*(obj: JsObject, scheduler: SchedulerLike): Observable {.
importjs "rxjs.pairs".}

proc race*(observables: varargs[auto]): Observable {.
importjs "rxjs.race".}

proc toArray*(): auto {.
importjs "rxjs.toArray".}

proc throwError(error: auto): Observable {.
importjs "rxjs.throwError".}
proc throwError(error: auto, scheduler: SchedulerLike): Observable {.
importjs "rxjs.throwError".}
proc throwIfEmpty*(errorFactory: proc(): auto): auto {.
importjs "rxjs.throwIfEmpty".}

proc zip*(observables: varargs[auto]): Observable {.
importjs "rxjs.zip".}
proc zipAll*(): auto {.
importjs "rxjs.zipAll".}
proc zipAll*(project: proc(values: vareargs[auto]) => auto): auto {.
importjs "rxjs.zipAll".}

proc fromFetch*(input: auto): Observable {.
importjs "rxjs.fromFetch".}
proc fromFetch*(input: auto, init: auto): Observable {.
importjs "rxjs.fromFetch".}

proc webSocket*(urlConfigOrSource: auto): WebSocketSubject {.
importjs "rxjs.websocket".}
{.pop.}
