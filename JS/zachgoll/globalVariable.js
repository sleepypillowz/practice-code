//set to global scope
const myNumber = 20;

let myFunction = () => {
    if (myNumber < 50) {
        return 'returned the function early';
    } 

    return 40;
}

myFunction();