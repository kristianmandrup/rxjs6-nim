import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

type
  Operator = ref object of RootObj    
  Observer = ref object of RootObj    
    closed*  
  Subscribable = ref object of RootObj    
  Observable{.importc.} = ref object of Subscribable
    source*: Observable,
    operator*: Operator,
    
  Subject{.importc.} = ref object of Observable
    observers*: array[Observer],
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
  Subscription{.importc.} = ref object of RootObj
    closed*    
  VirtualTimeScheduler{.importc.} = ref object of RootObj
    frame*: cint,
    index*: cint,
    maxFrames*: cint

  AjaxResponse{.importc.} = ref object of RootObj
    status*,
    response*,
    responseText*,
    responseType*,
    originalEvent*,
    xhr*,
    request*
  WebSocketSubject{.importc.} = ref object of Subject  
  TestScheduler{.importc.} = ref object of RootObj
    hotObservables*,
    coldObservables*,

{.push importcpp.}
proc assertDeepEqual*(scheduler: TestScheduler, proc(actual: auto, expected: auto): auto): auto
proc createTime*(scheduler: TestScheduler, marbles: cstring): cint
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring): ColdObservable
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): ColdObservable
proc createHotObservable*(scheduler: TestScheduler, marbles: cstring): HotObservable
proc createHotObservablee*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): HotObservable

proc expectObservable*(scheduler: TestScheduler, observable: Observable): auto
proc expectObservable*(scheduler: TestScheduler, observable: Observable, subscriptionMarbles: cstring): auto

proc expectSubscriptions*(scheduler: TestScheduler, actualSubscriptionLogs: array[auto]): auto
proc flush(scheduler: TestScheduler)
proc run*(scheduler: TestScheduler, callback: proc(helpers: auto): auto): auto

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

proc toObservable*(notification: Notification): Observable
proc observe*(notification: Notification, observer: Observer)
proc accept*(notification: Notification, observer: Observer)
proc do*(notification: Notification, next: proc(value: auto))
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto))
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto), complete: proc())
{.pop.}

# Factories

proc createReplaySubject*(bufferSize: cint, windowTime: cint): ReplaySubject =
  ReplaySubject.create(bufferSize, windowTime)