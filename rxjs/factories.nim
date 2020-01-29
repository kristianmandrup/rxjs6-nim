import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim factories is only available for the JS target".}

{.push importcpp.}
proc createObservable*(subscribe: proc(args: varargs): auto): Observable {.
    importjs "rxjs.Observable.create".}

proc createConnectableObservable*(subscribe: proc(
    args: varargs): auto): ConnectableObservable {.
    importjs "rxjs.ConnectableObservable.create".}

proc createGroupedObservable*(key: auto,
    groupSubject: Subject): GroupedObservable {.
    importjs "rxjs.GroupedObservable.create".}

proc createAsyncSubject*(subscriber: Subscriber): AsyncSubject {.
    importjs "rxjs.AsyncSubject.create".}

proc createBehaviorSubject*(value: auto): BehaviorSubject {.
    importjs "rxjs.BehaviorSubject.create".}

proc createSubscriber*(next: proc(value: auto)): Subscriber {.
    importjs "rxjs.Subscriber.create".}
proc createSubscriber*(next: proc(value: auto), error: proc(
    err: auto)): Observable {.importjs "rxjs.Subscriber.create".}
proc createSubscriber*(next: proc(value: auto), error: proc(err: auto),
    complete: proc()): Observable {.importjs "rxjs.Subscriber.create".}

proc createReplaySubject*(bufferSize: cint, windowTime: cint): ReplaySubject {.
    importjs "rxjs.ReplaySubject.create".}
{.pop.}
