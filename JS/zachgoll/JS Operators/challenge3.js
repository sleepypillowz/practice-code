/* 
expression5 evaluates to false 
const result = !(((100 % 50) < (100 / 50)) && 300 + 5 === 305);
*/

const expression1 = 100 % 50;
const expression2 = 100 / 50;
const expression3 = expression1 < expression2;
const expression4 = expression3 && 300 + 5 === 305;
const expression5 = !expression4;

console.log(expression5);
