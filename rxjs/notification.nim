import macros, dom, jsffi, asyncjs

{.experimental: "callOperator".}

when not defined(js):
  {.error: "RxJS.nim Notification is only available for the JS target".}

type
  Notification{.importc.} = ref object
    hasValue*,
    kind*,
    value*,
    error*  

proc toObservable*(notification: Notification): Observable {.
importjs "rxjs.toObservable".}
proc observe*(notification: Notification, observer: Observer) {.
importjs "rxjs.observe".}
proc accept*(notification: Notification, observer: Observer) {.
importjs "rxjs.accept".}
proc do*(notification: Notification, next: proc(value: auto)) {.
importjs "rxjs.do".}
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto)) {.
importjs "rxjs.do".}
proc do*(notification: Notification, next: proc(value: auto), error: proc(err: auto), complete: proc()) {.
importjs "rxjs.do".}
