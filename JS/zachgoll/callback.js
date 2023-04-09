function myCallback(someNumber) {
    return someNumber * 2;
}

function mainFunction(randomNumber, shouldCall, callback) {

    let result = randomNumber; //in this example result === 20

    // In this example, shouldCall is'true', so we do reach the callback
    if (shouldCall) {
        //In this example, 'callback' represents 'MyCallback' from above
        result = callback(randomNumber);
    }
    // Since 'result' was re-assigneed by the callback function, returns 40
    return result;

}

mainFunction(20, true, myCallback); // return as 40