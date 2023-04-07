function myFunction() {
    return 20;
}

myFunction();

const aliasVariable = myFunction;

aliasVariable();

const myObj = {
    prop1: 50,
    prop2: myFunction
}

myObj.prop2()