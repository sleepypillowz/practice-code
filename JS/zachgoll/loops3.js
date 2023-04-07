const arr = ['a', 'b', 'c', 'd', 20, 20, 40, 50]

for (let i = 0; i < arr.length; i++) {
    if (typeof arr[i] === 'number') {
        console.log(arr[i]);
    }
}