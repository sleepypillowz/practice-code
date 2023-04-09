const myArray = [2, 4, 6, 8];

function myCustomMapOperationCallback(itemFromArray) {
    return itemFromArray * 2;
}

const newArray = myArray.map(myCustomMapOperationCallback);

newArray