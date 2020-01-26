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

## Example app

See `example/app.nim` (WIP)