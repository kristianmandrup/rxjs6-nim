import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim is only available for the JS target".}

type
  Operator = JsObject
  Observer = JsObject
    closed*  
  Subscribable = JsObject
  Observable{.importc.} = ref object of Subscribable
    source*: Observable,
    operator*: Operator,
    
  Subject{.importc.} = ref object of Observable
    observers*: seq[Observer],
    isStopped*,
    hasError*,
    thrownError*
    
  AsyncSubject{.importc.} = ref object of Subject  
  BehaviorSubject{.importc.} = ref object of Subject
    value*
  ConnectableObservable{.importc.} = ref object of Observable
  GroupedObservable{.importc.} = ref object of Observable
    key*  
  ReplaySubject{.importc.} = ref object of Subject
  Subscriber{.importc.} = ref object of Subscription
  Subscription{.importc.} = JsObject
    closed*    
  VirtualTimeScheduler{.importc.} = JsObject
    frame*: cint,
    index*: cint,
    maxFrames*: cint

  AjaxResponse{.importc.} = JsObject
    status*,
    response*,
    responseText*,
    responseType*,
    originalEvent*,
    xhr*,
    request*
  WebSocketSubject{.importc.} = ref object of Subject  
  TestScheduler{.importc.} = JsObject
    hotObservables*,
    coldObservables*,

proc multiplex*(subject: WebSocketSubject, subMsg: proc(), unsubMsg: proc(), messageFilter: proc(value: auto): auto) {.
importjs "rxjs.multiplex".}

proc flush*(scheduler: VirtualTimeScheduler) {.
importjs "rxjs.flush".}

proc call*(subscriber: Subscriber, source: auto) {.
importjs "rxjs.call".}
proc subscribe*(subscribable: Subscribable, observer: Observer): auto {.
importjs "rxjs.subscribe".}

proc connect*(observable: ConnectableObservable): Subscription {.
importjs "rxjs.connect".}
proc refCount*(observable: ConnectableObservable): Observable {.
importjs "rxjs.refCount".}

proc unsubscribe*(subject: Subject | Subscription): auto {.
importjs "rxjs.unsubscribe".}
proc asObservable*(subject: Subject): Observable {.
importjs "rxjs.asObservable".}
proc add*(supscription: Supscription, teardown: auto): Supscription {.
importjs "rxjs.add".}
proc remove*(supscription: Supscription) {.
importjs "rxjs.remove".}

proc next*(observer: Observer | Subscriber | Subject, value: auto): auto {.
importjs "rxjs.next".}
proc error*(observer: Observer | Subscriber | Subject, error: auto): auto {.
importjs "rxjs.error".}
proc complete*(observer: Observer | Subscriber | Subject): auto {.
importjs "rxjs.complete".}

proc lift*(observable: Observable, operator: Operator): Observable {.
importjs "rxjs.lift".}

proc forEach*(observable: Observable, observer: Observer, next: proc(value: auto)): auto {.
importjs "rxjs.forEach".}
proc pipe*(observable: Observable, operations: varargs[auto]): Observable {.
importjs "rxjs.pipe".}
proc toPromise*(observable: Observable): PromiseJs {.
importjs "rxjs.toPromise".}

proc getValue*(subject: Subject)
proc nextValue*(subject: Subject, value: auto)



