import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim TerstScheduler is only available for the JS target".}

proc assertDeepEqual*(scheduler: TestScheduler, proc(actual: auto, expected: auto): auto): bool
proc createTime*(scheduler: TestScheduler, marbles: cstring): cint
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring): ColdObservable
proc createColdObservable*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): ColdObservable
proc createHotObservable*(scheduler: TestScheduler, marbles: cstring): HotObservable
proc createHotObservablee*(scheduler: TestScheduler, marbles: cstring, values: varargs[auto]): HotObservable

proc expectObservable*(scheduler: TestScheduler, observable: Observable): auto
proc expectObservable*(scheduler: TestScheduler, observable: Observable, subscriptionMarbles: cstring): auto

proc expectSubscriptions*(scheduler: TestScheduler, actualSubscriptionLogs: array[auto]): auto
proc flush(scheduler: TestScheduler)
proc run*(scheduler: TestScheduler, callback: proc(helpers: seq[auto]): auto): auto
