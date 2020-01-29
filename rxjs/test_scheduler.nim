import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim TerstScheduler is only available for the JS target".}

proc assertDeepEqual*(scheduler: TestScheduler, proc(actual: auto, expected: auto): auto): bool {.
importjs "rxjs.assertDeepEqual".}
proc createTime*(scheduler: TestScheduler, marbles: cstring): cint {.
importjs "rxjs.createTime".}
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring): ColdObservable {.
importjs "rxjs.createColdObservable".}
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): ColdObservable {.
importjs "rxjs.createColdObservable".}
proc createHotObservable*(scheduler: TestScheduler, marbles: cstring): HotObservable {.
importjs "rxjs.createHotObservable".}
proc createHotObservable*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): HotObservable {.
importjs "rxjs.createHotObservable".}

proc expectObservable*(scheduler: TestScheduler, observable: Observable): auto {.
importjs "rxjs.expectObservable".}
proc expectObservable*(scheduler: TestScheduler, observable: Observable, subscriptionMarbles: cstring): auto {.
importjs "rxjs.expectObservable".}

proc expectSubscriptions*(scheduler: TestScheduler, actualSubscriptionLogs: array[auto]): auto
proc flush(scheduler: TestScheduler)
proc run*(scheduler: TestScheduler, callback: proc(helpers: seq[auto]): auto): auto
