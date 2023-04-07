function myFunction() {
    console.log('hello world, this is my first function');
}

const myVar = 20;

typeof myFunction

myFunction();

/* Immediately invoked function */
(function anotherFunction() {
    console.log('hello');
})();

/*parameters*/
function myFunction(param1, param2) {
    console.log(param1);
    console.log(param2);
}

/*arguments*/
myFunction(20, 'some string');

/* another way to write a function */
const anotherFunction = function () {
    console.log('another thing');
}

typeof anotherFunction

myFunction();

anotherFunction();

/* Anonymous Function
function () {
    console.log('this does not work');
}
*/
