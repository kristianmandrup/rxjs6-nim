import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim operators is only available for the JS target".}

# Operators: See https://rxjs.dev/api/operators

proc combineAll*(project: varargs[auto]): auto {.importjs "rxjs/operators" .}
proc combineLatest*(observables: varargs[auto]): auto {.importjs "rxjs/operators" .}

{.push importcpp.}
proc mergeAll*(number: cint): auto
proc exhaust*(): auto
proc exhaustMap*(project: proc(value: auto, index: cint): auto): auto
proc exhaustMap*(project: proc(value: auto, index: cint): auto, resultSelector: proc(outerValue: auto, innerValue: auto, outerIndex: cint, innerIndex: cint): auto): auto
proc pairwise*(): auto

proc concat*(observable: Observable, observable: varargs[auto]): auto
proc concatMap*(project: auto): auto
proc concatMap*(project: auto, resultSelector: auto): auto

proc concatMapTo*(innerObservable: auto): auto
proc concatMapTo*(innerObservable: auto, resultSelector: auto): auto
proc concatAll*(): auto

proc mergeMap*(project: auto): auto
proc mergeMap*(project: auto, resultSelector: auto): auto
proc mergeMap*(project: auto, resultSelector: auto, concurrent: auto): auto

proc mergeMapTo*(innerObservable: auto, resultSelector: auto)): auto
proc mergeMapTo*(innerObservable: auto, resultSelector: auto), concurrent: cint): auto

proc withLatestFrom*(args: varargs[auto]): auto

proc sequenceEqual*(compareTo: Observable, comparator: proc(a: auto, b: auto): auto): auto

proc count*(predicate: proc(value: auto, number: cint, source: Observable): auto): auto

proc scan*(accumulator: proc(acc: auto, value: auto, index: cint):auto): auto
proc scan*(accumulator: proc(acc: auto, value: auto, index: cint):auto, seed: auto): auto
proc mergeScan*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto): auto
proc mergeScan*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto, concurrent: cint): auto

proc empty*(): auto
proc empty*(scheduler: SchedulerLike): auto

proc isEmpty*(): bool
proc range*(start: cint): Observable
proc range*(start: cint, count: cint): Observable
proc range*(start: cint, count: cint, scheduler: SchedulerLike): Observable

proc reduce*(accumulator: proc(acc: auto, args: varargs[auto]): auto): auto
proc reduce*(accumulator: proc(acc: auto, args: varargs[auto]): auto, seed: auto): auto

proc repeat*(): auto
proc repeat*(count: cint): auto

proc repeatWhen*(notifier: proc(notifications: Observable): Observable): auto

proc retry*(count: cint): auto
proc retryWhen*(notifier: proc(errors: Observable): Observable>):auto

proc skip*(count: cint): auto
proc skipLast*(count: cint): auto
proc skipUntil*(notifier: Observable): auto
proc skipWhile*(predicate: proc(value: auto, number: cint): auto): auto
proc startWith*(schedulers: varargs[auto]): auto

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
proc throttle*(durationSelector: proc(value: auto): auto, config: JsObject): auto

proc throttleTime*(duration: cint): auto
proc throttleTime*(duration: cint, scheduler: auto): auto

proc throttleTime*(duration: cint, scheduler: auto, config: JsObject): auto
proc timeInterval*(scheduler: SchedulerLike): auto
proc timeout*(due: auto, scheduler: SchedulerLike): auto
proc timeout*(due: auto, withObservable: auto, scheduler: SchedulerLike): auto
proc timestamp*(scheduler: SchedulerLike): auto

proc sample*(notifier: Observable): auto
proc sampleTime*(period: number): auto
proc sampleTime*(period: number, scheduler: SchedulerLike): auto

proc debounce*(durationSelector: proc(value: auto): auto): auto

proc debounceTime*(dueTime: cint, scheduler: auto): auto

proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto): auto
proc delayWhen*(delayDurationSelector: proc(value: auto, index: cint): auto, subscriptionDelay: Observable): auto

proc pluck*(properties: varargs[cstring]): auto

proc map*(project: proc(value: auto, index: cint): auto): auto
proc map*(project: proc(value: auto, index: cint): auto, thisArg: auto): auto
proc mapTo*(value: auto):auto

proc switchAll*(): auto
proc switchMap*(project: proc(value: auto, index: cint): auto): auto
proc switchMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto): auto
proc switchMapTo*(innerObservable: auto, resultSelector: proc(outerValue: auto, innerValue: auto, outerIndex: cint, innerIndex: cint): auto): auto

proc flatMap*(project: proc(value: auto, index: cint): auto): auto
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto): auto
proc flatMap*(project: proc(value: auto, index: cint): auto, resultSelector: auto, concurrent: cint): auto

proc groupBy*(keySelector: proc(value: auto): auto, elementSelector: auto, durationSelector: auto, subjectSelector: auto): auto

proc tap*(): auto
proc tap*(nextOrObserver: auto): auto
proc tap*(nextOrObserver: auto, error: auto): auto
proc tap*(nextOrObserver: auto, error: auto, complete: auto): auto

proc publish*(selector: auto): auto
proc publishLast*(): auto
proc publishBehavior*(value: auto): auto

proc publishReplay*(): auto
proc publishReplay*(bufferSize: cint): auto
proc publishReplay*(bufferSize: cint, windowTime: cint): auto
proc publishReplay*(bufferSize: cint, windowTime: cint, selectorOrScheduler: auto): auto
proc publishReplay*(bufferSize: cint, windowTime: cint, selectorOrScheduler: auto, scheduler: auto): auto

proc bufferCount*(bufferSize: cint): auto
proc bufferCount*(bufferSize: cint, startBufferEvery: cint): auto
proc bufferTime*(bufferTimeSpan: cint): auto
proc bufferToggle*(openings: auto, closingSelector: proc(value: auto) => auto): auto
proc bufferWhen*(closingSelector: proc() => Observable): auto

proc materialize*(): auto
proc catchError*(selector: proc(err: auto, caught: Observable): auto): auto
proc onErrorResumeNext*(nextSources: varargs[auto]): auto
proc window*(windowBoundaries: Observable): auto
proc windowCount*(windowSize: cint, startWindowEvery: cint):auto
proc windowToggle*(openings: Observable, closingSelector: proc(openValue: auto): Observable): auto
proc windowWhen*(closingSelector: proc(): Observable): auto

proc elementAt*(index: cint): auto
proc elementAt*(index: cint, defaultValue: auto): auto

proc endWith*(schedulers: varargs[auto]): auto

proc every*(predicate: proc(value: auto, index: cint): auto): auto
proc every*(predicate: proc(value: auto, index: cint): auto, thisArg: auto): auto

proc min*(comparer: proc(x: auto, y: auto): auto): auto
proc max*(comparer: proc(x: auto, y: auto): auto): auto

proc last*(predicate: proc(value: auto, index: cint): auto): auto
proc last*(predicate: proc(value: auto, index: cint): auto, defaultValue: auto): auto

proc distinct*(keySelector: auto): auto
proc distinct*(keySelector: auto, flushes: Observable): auto

proc distinctUntilChanged*(compare: proc(x: auto, y: auto): auto): auto
proc distinctUntilChanged*(compare: proc(x: auto, y: auto): auto, keySelector: auto): auto

proc distinctUntilKeyChanged*(key: auto): auto
proc distinctUntilKeyChanged*(key: auto, compare: proc(x: auto, y: auto): auto): auto

proc defaultIfEmpty*(defaultValue: auto): auto

proc find*(predicate: proc(value: auto, index: cint, source: auto): auto)
proc find*(predicate: proc(value: auto, index: cint, source: auto, thisArg: auto): auto)

proc findIndex*(predicate: proc(value: auto, index: cint, source: auto): auto)
proc findIndex*(predicate: proc(value: auto, index: cint, source: auto, thisArg: auto): auto)

proc first*(predicate: proc(value: auto, index: cint, source: auto): auto)
proc first*(predicate: proc(value: auto, index: cint, source: auto, defaultValue: auto): auto)

proc finalize*(callback: proc()): auto

proc single*(predicate: proc(value: auto, index: cint, source: auto): auto)

proc multicast*(subjectOrSubjectFactory: auto, selector: proc(source: Observable): Observable): auto

proc delay*(delay: cint): auto
proc delay*(delay: cint, scheduler: SchedulerLike): auto

proc expand*(project: proc(value: auto, index: cint): any, concurrent: cint): auto
proc expand*(project: proc(value: auto, index: cint): any, concurrent: cint, scheduler: SchedulerLike): auto

proc observeOn*(scheduler: SchedulerLike): auto
proc observeOn*(scheduler: SchedulerLike, delay: cint): auto

proc share*():auto
proc shareReplay*():auto
proc shareReplay*(configOrBufferSize: cint): auto
proc shareReplay*(configOrBufferSize: cint, windowTime: cint): auto
proc shareReplay*(configOrBufferSize: cint, windowTime: cint, scheduler: SchedulerLike): auto

proc ignoreElements*():auto
{.pop.}
