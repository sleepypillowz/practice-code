const regex = new RegExp('FavoritE');

const string1 = 'my favorite food is steak';
const string2 = 'my favorite thing to do is code';

regex.test(string1)

regex.test(string2)

//fix errors
/favorite/.test(string1)
/[A-Z]/.test(string1)
/[0-9]/.test(string1)
/[A-Za-z0-9]/.test(string1)
/\d./.test(string1) //number
/\s/.test(string1) //whitespace
/\w/.test(string1) //all letters and numbers

/^f/.test(string1) //beginning of the string
/f$/.test(string1) //end of the line
/code|steak/.test(string1) //or

/(a-z)/.exec(string1) //only one match
/[a-z]*/.exec(string1)
/[a-z]+/.exec(string1) //one or more
/[a-z]?/.exec(string1) //0 or 1
/[a-z ]/.exec(string1) //examine entire string
/[a-z ]/{5}.exec(string1) //1st 5 characters
/[a-z]/{2,6}.exec(string1) //1st 5 characters

const regex2 = /[a-z]+/g

const str = 'hello world, 2021 @ more of a string';
/^[a-z ]+,[0-9 ]+@[a-z ]+$/.exec(str);
/.+/.exec(str);