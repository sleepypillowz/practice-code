const myString = 'My Dog jumped on the bed, My dog is a bad Dog';
const newString = myString.replaceAll('Dog', 'Cat');
newString

const correctStr = myString.replaceAll(/[Dd]{1}og/g, 'cat');