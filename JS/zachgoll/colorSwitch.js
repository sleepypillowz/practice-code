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
 switch (randomColor) {
    case 'orange':
        console.log('the color is orange');
    break;
    case 'green':
        console.log('the color is green');
    case 'yellow':
        console.log('the color is yellow');
    break;
    case 'purple':
        console.log('the color is purple');
    break;
    case 'blue':
        console.log('the color is blue');
    default:
    console.log('no color found');
 }