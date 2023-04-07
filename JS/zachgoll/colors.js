const colors = ['orange', 'green', 'yellow', 'purple', 'blue'];

//Gets a random number between 0 and 4 and stores in a variable
const randomIndex = Math.floor(Math.random() * colors.length );

/*
Remember to get a value from an array, we use bracket notation
for example, to get 'green', we  use 'colors[1]

Since randomIndex will be a random number between 0-4, we can pas this in as our index to retrieve a random color from the array
*/

const randomColor = colors[randomIndex];

//Conditionals
 if (randomColor === 'orange') {
    console.log('the color is orange');
 }else if (randomColor === 'green') {
    console.log('the color is green');
 }else if (randomColor === 'yellow') {
    console.log('the color is yellow');
 }else if (randomColor === 'purple') {
    console.log('the color is purple');
 }else if (randomColor === 'blue') {
    console.log('the color is blue');
 }else {
    console.log('no color found');
 }