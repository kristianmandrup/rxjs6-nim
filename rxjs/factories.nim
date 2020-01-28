import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim factories is only available for the JS target".}

{.push importcpp.}
proc createObservable*(subscribe: proc(args: varargs): auto): Observable {.
    importjs "Observable.create".}

proc createConnectableObservable*(subscribe: proc(
    args: varargs): auto): ConnectableObservable {.
    importjs "ConnectableObservable.create".}

proc createGroupedObservable*(key: auto,
    groupSubject: Subject): GroupedObservable {.
    importjs "GroupedObservable.create".}

proc createAsyncSubject*(subscriber: Subscriber): AsyncSubject {.
    importjs "AsyncSubject.create".}

proc createBehaviorSubject*(value: auto): BehaviorSubject {.
    importjs "BehaviorSubject.create".}

proc createSubscriber*(next: proc(value: auto)): Subscriber {.
    importjs "Subscriber.create".}
proc createSubscriber*(next: proc(value: auto), error: proc(
    err: auto)): Observable {.importjs "Subscriber.create".}
proc createSubscriber*(next: proc(value: auto), error: proc(err: auto),
    complete: proc()): Observable {.importjs "Subscriber.create".}

proc createReplaySubject*(bufferSize: cint, windowTime: cint): ReplaySubject {.
    importjs "ReplaySubject.create".}
{.pop.}
