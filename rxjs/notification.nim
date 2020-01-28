import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim Notification is only available for the JS target".}

{.push importcpp.}
proc toObservable*(notification: Notification): Observable
proc observe*(notification: Notification, observer: Observer)
proc accept*(notification: Notification, observer: Observer)
proc do*(notification: Notification, next: proc(value: auto))
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto))
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto), complete: proc())
{.pop.}