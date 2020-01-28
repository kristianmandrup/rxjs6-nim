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
  Notification{.importc.} = ref object
    hasValue*,
    kind*,
    value*,
    error*  
  
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

{.push importcpp.}


proc multiplex*(subject: WebSocketSubject, subMsg: proc(), unsubMsg: proc(), messageFilter: proc(value: auto): auto)

proc flush*(scheduler: VirtualTimeScheduler)

proc call*(subscriber: Subscriber, source: auto)
proc subscribe*(subscribable: Subscribable, observer: Observer): auto

proc connect*(observable: ConnectableObservable): Subscription
proc refCount*(observable: ConnectableObservable): Observable

proc unsubscribe*(subject: Subject | Subscription): auto
proc asObservable*(subject: Subject): Observable
proc add*(supscription: Supscription, teardown: auto): Supscription
proc remove*(supscription: Supscription)

proc next*(observer: Observer | Subscriber | Subject, value: auto): auto
proc error*(observer: Observer | Subscriber | Subject, error: auto): auto
proc complete*(observer: Observer | Subscriber | Subject): auto

proc lift*(observable: Observable, operator: Operator): Observable

proc forEach*(observable: Observable, observer: Observer, next: proc(value: auto)): auto
proc pipe*(observable: Observable, operations: varargs[auto]): Observable,
proc toPromise*(observable: Observable): Observable

proc getValue*(subject: Subject)
proc nextValue*(subject: Subject, value: auto)



