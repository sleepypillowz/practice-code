const regex = /[a-z]+/
const str = 'asdnfaskdjnfjkds2342354235lsdjf';

/* same with
regex.exec(str)
as long as you don't use global flag
*/

str.match(regex)