//source https://www.youtube.com/watch?v=Mus_vwhTCq0&t=160s&ab_channel=Fireship

const foo = {name: 'tom', age: 30, nervous: false};
const bar = {name: 'dick', age: 40, nervous: false};
const baz = {name: 'harry', age: 50, nervous: true};

`Bad Code`

//Doesn't show the name of the variable

console.log(foo);
console.log(bar);
console.log(baz);

`Good Code`

//Computed Property Names
//% sign substitutes data and css style

console.log('%c My Friends', 'color:  orange; font-weight: bold;' )
console.log({foo, bar, baz});

//console table if same inputs
console.table([foo,bar,baz])

//if benchmarking performance you can keep track of time
console.time('looper')

let i = 0;
while (i < 10000000) { i ++ }

console.timeEnd('looper')

//locates where console logger originated from

const deleteMe = () => console.trace('bye bye database')

deleteMe()