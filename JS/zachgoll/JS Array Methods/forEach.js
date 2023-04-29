const arr = [1, 2, 3];

arr.forEach(arrItem => {
    console.log(arrItem)
})
arr.forEach((arrItem, index) => {
    console.log(arrItem + " is in the index of " + index);
})