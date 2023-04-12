const  emailValidatorRegex = new RegExp('^.+@.+\..+$');

const userInput = 'invalidemail@g';

const isValid = emailValidatorRegex.test(userInput);

isValid

//Identifiers, Quantifiers

const regex = new RegExp('g');

const string1 = 'my favorite food is steak';
const string2 = 'my favorite thing to do is code';

regex.test(string1);

regex.test(string2);