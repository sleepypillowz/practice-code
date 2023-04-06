/*
No, The two blocks of code have different answers
I would recommend using the snippet 2 if you don't care what type it is
while Snippet 1 if you want to be accurate with the type
*/

/* Snippet 1 false
const firstNumber = 20;
const secondNumber = '20';

const result = firstNumber === secondNumber;

console.log(result);
*/

/*Snippet 2 true*/
const firstNumber = 20;
const secondNumber = '20';

const result = firstNumber == secondNumber;

console.log(result);