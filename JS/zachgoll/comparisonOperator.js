/* 
> greater than
< less than
= assignment operator
!= not equals
== equality despite of type
!== no equality
=== equality should be the same type
? ternary is a compact if else
*/
const result = 20 > 18;
result

const result2 = 20 === 20;
result2

const stringValue = "20";
const numberValue = 20;


typeof numberValue
typeof stringValue

stringValue == numberValue;

stringValue === numberValue;

Number(stringValue) === numberValue;

const resultVariable = stringValue == numberValue;

numberValue != stringValue
numberValue !== stringValue

20===20
20==20

'hello world' === 'hello world';

true === true

const myObj = {
    property1: 'some value',
    property2: 20
};

const myArray = [1, 2, 3, 4, 5];

myArray === myArray

const anotherArray = [1, 2, 3, 4, 5];

myArray === anotherArray

myObj === myObj

const anotherObj = {
    property1: 'some value',
    property2: 20
};

myObj === anotherObj

const result3 = 20 === 20 ? 'values match' : 'values do not match';

let resultVariable2;

if(20 === 20) {
    resultVariable = 'values match';    
}else {
    resultVariable = 'values do not match';
}