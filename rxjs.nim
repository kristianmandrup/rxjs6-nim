import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim is only available for the JS target".}

type
  SchedulerLike = ref object of RootObj
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
proc now(scheduler: SchedulerLike): number
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction, varargs[auto])): Subscription  
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction, varargs[auto]), delay?: number): Subscription  
proc schedule(scheduler: SchedulerLike, work: proc (action: SchedulerAction, varargs[auto]), delay: cint, state: auto): Subscription  

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

proc createObservable*(subscribe: proc(varargs): auto): Observable =
  Observable.create(subscribe)

proc createConnectableObservable*(subscribe: proc(varargs): auto): ConnectableObservable =
  ConnectableObservable.create(subscribe)
    
proc createGroupedObservable*(key: auto, groupSubject: Subject): GroupedObservable =
  GroupedObservable.create(key, groupSubject)
    
proc createAsyncSubject*(subscriber: Subscriber): AsyncSubject =
  AsyncSubject.create(subscriber)

proc createBehaviorSubject*(value: auto): BehaviorSubject =
  BehaviorSubject.create(value)
    
proc createSubscriber*(next: proc(value: auto)): Subscriber =
  Subscriber.create(next)  

proc createSubscriber*(next: proc(value: auto), error: proc(err: auto)): Observable =
  Subscriber.create(next, error)  
  
proc createSubscriber*(next: proc(value: auto), error: proc(err: auto), complete: proc()): Observable =
  Subscriber.create(next, error, complete)  
  
proc createReplaySubject*(bufferSize: cint, windowTime: cint): ReplaySubject =
  ReplaySubject.create(bufferSize, windowTime)

# Functions

proc from*(input: auto): Observable
proc from*(input: auto, scheduler: SchedulerLike): Observable

proc fromEvent*(target: auto, eventName: cstring): Observable
proc fromEvent*(target: auto, eventName: cstring, options: auto): Observable
proc fromEvent*(target: auto, eventName: cstring, options: auto, resultSelector: proc(varargs): Observable

proc forkJoin*(sources: varargs[auto]): Observable
proc merge*(observables: varargs[auto]): Observable

proc of*(args: varargs[auto]): Observable

proc generate*(initialStateOrOptions: auto): Observable
proc generate*(initialStateOrOptions: auto, condition: auto): Observable
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto): Observable
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto, resultSelectorOrObservable: auto): Observable
proc generate*(initialStateOrOptions: auto, condition: auto, iterate: auto, resultSelectorOrObservable: auto, scheduler: SchedulerLike): Observable

proc defer*(observableFactory: proc(): auto): Observable
proc concat*(observables: varargs[auto]): Observable

proc interval*(period: cint, scheduler: SchedulerLike): Observable

proc partition*(source: any, predicate: proc(value: auto, index: cint): auto): auto
proc partition*(source: any, predicate: proc(value: auto, index: cint): auto, thisArg: auto): auto

proc range*(start: cint): Observable
proc range*(start: cint, count: cint): Observable
proc range*(start: cint, count: cint, scheduler: SchedulerLike): Observable

proc timer*(dueTime: auto, periodOrScheduler: auto): Observable
proc timer*(dueTime: auto, periodOrScheduler: auto, scheduler: SchedulerLike): Observable

proc pipe*(fns: varargs[auto]): auto

proc scheduled*(input: auto, scheduler: auto): Observable

proc using*(resourceFactory: auto, observableFactory: auto): Observable

proc combineLatest*(observables: varargs[auto]): Observable

proc isObservable*(obj: auto): Observable

proc pairs*(obj: ref object): Observable
proc pairs*(obj: ref object, scheduler: SchedulerLike): Observable

proc race*(observables: varargs[auto]): Observable

proc throwError(error: auto): Observable
proc throwError(error: auto, scheduler: SchedulerLike): Observable

proc zip*(observables: varargs[auto]): Observable

proc fromFetch*(input: auto): Observable
proc fromFetch*(input: auto, init: auto): Observable

proc webSocket*(urlConfigOrSource: auto): WebSocketSubject

# Operators

proc combineAll*(project: varargs[auto]): auto
proc concatAll*(observable: Observable): auto
proc combineLatest*(observables: varargs[auto]): auto
proc switchAll*(observable: Observable): auto
proc mergeAll*(observable: Observable, number: cint): auto
proc exhaust*(observable: Observable): auto

proc concatMap*(project: auto): auto
proc concatMap*(project: auto, resultSelector: auto): auto

proc concatMapTo*(innerObservable: auto): auto
proc concatMapTo*(innerObservable: auto, resultSelector: auto): auto

proc mergeMap*(project: auto): auto
proc mergeMap*(project: auto, resultSelector: auto): auto
proc mergeMap*(project: auto, resultSelector: auto, concurrent: auto): auto

proc concat*(observable: Observable, observable: varargs[auto]): auto