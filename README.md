# RxJS.nim

This library aims to provide [RxJs](https://github.com/ReactiveX/RxJS) 6.5.x bindings for
Nim (Work In Progress)

## Factory functions

```nim
# Observable
proc createObservable*(subscribe: proc(varargs): auto): Observable

# ConnectableObservable
proc createConnectableObservable*(subscribe: proc(varargs): auto): ConnectableObservable

# GroupedObservable
proc createGroupedObservable*(key: auto, groupSubject: Subject): GroupedObservable

# AsyncSubject
proc createAsyncSubject*(subscriber: Subscriber): AsyncSubject
  
# Subscriber  
proc createSubscriber*(next: proc(value: auto)): Subscriber

proc createSubscriber*(next: proc(value: auto), error: proc(err: auto)): Observable
  
proc createSubscriber*(next: proc(value: auto), error: proc(err: auto), complete: proc()): Observable

# ReplaySubject
proc createReplaySubject*(bufferSize: cint, windowTime: cint): ReplaySubject
```

## TODO: functions

```txt
from<T>(input: any, scheduler?: SchedulerLike): Observable<T>

fromEvent<T>(target: FromEventTarget<T>, eventName: string, options?: EventListenerOptions | ((...args: any[]) => T), resultSelector?: (...args: any[]) => T): Observable<T>


forkJoin(...sources: any[]): Observable<any>

merge<T, R>(...observables: any[]): Observable<R>

of<T>(...args: (SchedulerLike | T)[]): Observable<T>

generate<T, S>(initialStateOrOptions: S | GenerateOptions<T, S>, condition?: ConditionFunc<S>, iterate?: IterateFunc<S>, resultSelectorOrObservable?: SchedulerLike | ResultFunc<S, T>, scheduler?: SchedulerLike): Observable<T>

defer<R extends ObservableInput<any> | void>(observableFactory: () => R): Observable<ObservedValueOf<R>>

concat<O extends ObservableInput<any>, R>(...observables: (SchedulerLike | O)[]): Observable<ObservedValueOf<O> | R>

interval(period: number = 0, scheduler: SchedulerLike = async): Observable<number>

partition<T>(source: any, predicate: (value: T, index: number) => boolean, thisArg?: any): [Observable<T>, Observable<T>]

range(start: number = 0, count?: number, scheduler?: SchedulerLike): Observable<number>

timer(dueTime: number | Date = 0, periodOrScheduler?: number | SchedulerLike, scheduler?: SchedulerLike): Observable<number>

pipe(...fns: UnaryFunction<any, any>[]): UnaryFunction<any, any>

scheduled<T>(input: any, scheduler: any): Observable<T>

using<T>(resourceFactory: () => void | Unsubscribable, observableFactory: (resource: void | Unsubscribable) => any): Observable<T>

combineLatest<O extends ObservableInput<any>, R>(...observables: (SchedulerLike | O | ((...values: ObservedValueOf<O>[]) => R))[]): Observable<R>

isObservable<T>(obj: any): obj is Observable<T>

pairs<T>(obj: Object, scheduler?: SchedulerLike): Observable<[string, T]>

race<T>(...observables: any[]): Observable<T>

throwError(error: any, scheduler?: SchedulerLike): Observable<never>

zip<O extends ObservableInput<any>, R>(...observables: (O | ((...values: ObservedValueOf<O>[]) => R))[]): Observable<ObservedValueOf<O>[] | R>

fromFetch(input: string | Request, init?: RequestInit): Observable<Response>

webSocket<T>(urlConfigOrSource: string | WebSocketSubjectConfig<T>): WebSocketSubject<T>
```

## TODO: Operators

```txt
audit
auditTimebuffer
bufferCount
bufferTime
bufferToggle
bufferWhen
catchError
combineAll
concatAll
concatMap
concatMapTo
count
debounce
debounceTime
defaultIfEmpty
delay
delayWhen
dematerialize
distinct
distinctUntilChanged
distinctUntilKeyChanged
elementAt
endWith
every
exhaust
exhaustMap
expand
filter
finalize
find
findIndex
first
flatMap
groupBy
ignoreElements
isEmpty
last
map
mapTo
materialize
max
mergeAll
mergeMap
mergeMapTo
mergeScan
min
multicast
observeOn
onErrorResumeNext
pairwise
pluck
publish
publishBehavior
publishLast
publishReplay
reduce
refCount
repeat
repeatWhen
retry
retryWhen
sample
sampleTime
scan
sequenceEqual
share
shareReplay
single
skip
skipLast
skipUntil
skipWhile
startWith
subscribeOn
switchAll
switchMap
switchMapTo
take
takeLast
takeUntil
takeWhile
tap
throttle
throttleTime
throwIfEmpty
timeInterval
timeout
timeoutWith
timestamptoArray
window
windowCount
windowTime
windowToggle
windowWhen
withLatestFrom
zipAll
```

## Example app

See `example/app.nim` (WIP)