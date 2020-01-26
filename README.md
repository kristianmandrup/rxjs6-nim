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

## Functions

Bindings exist for the following functions (not yet tested)

```nim
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
```

## Operators

Bindings exists for the following operators (not yet tested)

```nim
proc combineAll*(project: varargs[auto]): auto
proc concatAll*(): auto
proc combineLatest*(observables: varargs[auto]): auto
proc switchAll*(): auto
proc mergeAll*(number: cint): auto
proc exhaust*(): auto
proc pairwise*(): auto

proc concatMap*(project: auto): auto
proc concatMap*(project: auto, resultSelector: auto): auto

proc concatMapTo*(innerObservable: auto): auto
proc concatMapTo*(innerObservable: auto, resultSelector: auto): auto

proc mergeMap*(project: auto): auto
proc mergeMap*(project: auto, resultSelector: auto): auto
proc mergeMap*(project: auto, resultSelector: auto, concurrent: auto): auto

proc concat*(observable: Observable, observable: varargs[auto]): auto

proc withLatestFrom*(args: varargs[auto]): auto

proc sequenceEqual*(compareTo: Observable, comparator: proc(a: auto, b: auto): auto): auto

proc count*(predicate: proc(value: auto, number: cint, source: Observable): auto): auto
proc skip*(count: cint): auto

proc mergeScan*(accumulator: proc(acc: auto, varargs[auto]): auto, seed: auto): auto
proc mergeScan*(accumulator: proc(acc: auto, varargs[auto]): auto, seed: auto, concurrent: cint): auto

proc empty*(): auto
proc empty*(scheduler: SchedulerLike): auto

proc isEmpty*(): auto
proc range*(start: cint): Observable
proc range*(start: cint, count: cint): Observable
proc range*(start: cint, count: cint, scheduler: SchedulerLike): Observable

proc reduce*(accumulator: proc(acc: auto, varargs[auto]): auto): auto
proc reduce*(accumulator: proc(acc: auto, varargs[auto]): auto, seed: auto): auto

proc repeat*(): auto
proc repeat*(count: cint): auto

proc skipLast*(count: cint): auto
proc skipUntil*(notifier: Observable): auto

proc skipWhile*(predicate: proc(value: auto, number: cint): auto): auto
proc take*(count: cint): auto
proc takeLast*(count: cint): auto
proc takeUntil*(notifier: Observable): auto

proc takeWhile*(predicate: proc(value: auto, number: cint): auto): auto
proc takeWhile*(predicate: proc(value: auto, number: cint): auto, inclusive: auto): auto

proc filter*(predicate: proc(value: auto, number: cint): auto): auto
proc filter*(predicate: proc(value: auto, number: cint): auto, thisArg: auto): auto

proc webSocket*(urlConfigOrSource: auto): auto

proc audit*(durationSelector: proc(value: auto): auto): auto

proc auditTime*(duration: cint): auto
proc auditTime*(duration: cint, scheduler: auto): auto

proc throttle*(durationSelector: proc(value: auto): auto): auto
proc throttle*(durationSelector: proc(value: auto): auto, config: ref object of RootObj): auto

proc sample*(notifier: Observable): auto
proc debounce*(durationSelector: proc(value: auto): auto): auto

proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto): auto
proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto, subscriptionDelay: Observable): auto

proc pluck*(properties: varargs[cstring]): auto

proc map*(project: proc(value: auto, index: cint): auto): auto
proc map*(project: proc(value: auto, index: cint): auto, thisArg: auto): auto

proc switchMap*(project: proc(value: auto, index: cint): auto): auto
proc switchMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto): auto

proc flatMap*(project: proc(value: auto, index: cint): auto): auto
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto): auto
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto, concurrent: cint): auto

proc groupBy*(keySelector: proc(value: auto): auto, elementSelector: auto, durationSelector: auto, subjectSelector: auto): auto

proc tap*(): auto
proc tap*(nextOrObserver: auto): auto
proc tap*(nextOrObserver: auto, error: auto): auto
proc tap*(nextOrObserver: auto, error: auto, complete: auto): auto

proc publish*(selector: auto): auto
proc materialize*(): auto
proc catchError*(selector: proc(err: auto, caught: Observable): auto): auto
proc onErrorResumeNext*(nextSources: varargs[auto]): auto
proc window*(windowBoundaries: Observable): auto

proc elementAt*(index: cint): auto
proc elementAt*(index: cint, defaultValue: auto): auto

proc every*(predicate: predicate: proc(value: auto, index: cint): auto): auto
proc every*(predicate: predicate: proc(value: auto, index: cint): auto, thisArg: auto): auto

proc min*(comparer: proc(x: auto, y: auto): auto): auto
proc max*(comparer: proc(x: auto, y: auto): auto): auto
```

## TODO: Operators

The operators are essential to RxJS. Please help out adding them to the library and testing them out.

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