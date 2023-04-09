/*
EXAMPLE #1
Inputs as arguments
Date(year, month, day, hour, minute, second, millisecond)
Note: the month is 0-indexed (I have no clue why...)
*/
new Date(2020, 11, 2, 7, 10);

/*
EXAMPLE #2
Inputs as various strings
This works with pretty much anything you can think of
*/
new Date('Jan 20 2020');
new Date('January 20 2020');
new Date('Jan-20-2020');
new Date('Jan 20 2020 02:20:10')

/*
EXAMPLE #3
Input as numbers (milliseonds)
*/
new Date(102031203)

/*
EXAMPLE #4
Inputs as ISO 8601 (we are about to talk about this)
*/
new Date('2020-01-20T00:00Z')

/* 
EXAMPLE #5
Inputs with timezone specifications
*/
new Date('Jan 20 2020 02:20:10 -10:00') // SPECIAL CASE
new Date('Jan 20 2020 02:20:10 -1000') // SPECIAL CASES
new Date('Jan 20 2020 02:20:10 (EDT)') // SPECIAL CASE

/*
EXAMPLE #6
The current moment, specified in the user's local timeone
*/
new Date(Date.now()) // SPECIAL CASE