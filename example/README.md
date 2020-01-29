# Sample Nim RxJS app

This sample Nim RxJs app aims to demonstrate how to use React 16.x with Hooks using Nim 1.0.

## Build

`nim js app.nim`

## Run

`npm test`

## Use in browser

See [Importing RxJS 6 in browser](https://stackoverflow.com/questions/50308059/importing-rxjs-6-in-browser)

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/rxjs/6.1.0/rxjs.umd.js">
```

Everything is imported under the rxjs namespace, so to a simple example usage:

```js
rxjs.of(1, 2, 3)
  .subscribe(x => {
    const element = document.createElement('div');
    element.innerText = 'Data: ' + x;
    document.body.appendChild(element)
  },
  err => { },
  () => {
    const element = document.createElement('div');
    element.innerText = 'All done';
    document.body.appendChild(element)
  });

console.log({rxjs});
console.log({operators: rxjs.operators});
```

See [Stackblitz example app](https://stackblitz.com/edit/js-gm1qso?file=index.js)

You would then code the equivalent using the nim bound procedures (functions).

## Javascript libraries used

- RxJs 6.5.4
- Jest 25.1

## TODO

Use [Jest Nim bindings](https://github.com/kristianmandrup/jest-nim) for testing RxJs bindings work as expected

