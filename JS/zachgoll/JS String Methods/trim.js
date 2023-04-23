const externalData = [
    {
        title: 'How to code           ',
        author: ' Zach'
    },
    {
        title: ' What is Vim?',
        author: ' Zach'
    },
    {
        title: '   How do loops work in JavaScript?     ',
        author: ' Zach'
    }
];

for (let i = 0; i < externalData.length; i ++) {
    const currentTitle = externalData[i].title;
    const currentAuthor = externalData[i].author;
    
    externalData[i].title = currentTitle.trim();
    externalData[i].author = currentAuthor.trim();
}
