const moreComplexArr = [
    {
        firstName: 'Bob',
        lastName: 'Smith'
    },
    {
        firstName: 'Alice',
        lastName: 'Smith'
    },
    {
        firstName: 'Jon',
        lastName: 'Smith'
    },
    {
        firstName: 'Jon',
        lastName: 'Doe'
    }
];

moreComplexArr.findIndex((arrItem) => {
    return arrItem.lastName != 'Smith';
})