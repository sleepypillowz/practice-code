const firstNumber = 20;
const secondNumber = 10;
const jsExpression = firstNumber > secondNumber; //true

//Only using an if statement (no "else" statement required here)
if (jsExpression) {
    console.log('this expression is true');
}

// An if-else statement
if (jsExpression) {
    console.log('this expression is true');
}else {
    console.log('this expression is false');
}

// Adding another "code path" with "else if"
// Hint: you can use as many "else if" statement as you want
if (jsExpression) {
    console.log('the expression is true');
}else if (firstNumber > 0) {
    console.log('the expression is false and the firstNumber is greater than 0');
}else {
    console.log('expression false, and firstNumber 0 or less');
}

//Works the same, just formatted differently
if (jsExpression) {console.log('just a different formatting')};