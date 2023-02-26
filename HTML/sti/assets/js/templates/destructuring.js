//source https://www.youtube.com/watch?v=Mus_vwhTCq0&t=160s&ab_channel=Fireship

const turtle = {
    name: 'Bob',
    legs: 4,
    shell: true,
    type: 'amphibious',
    meal: 10,
    diet: 'berries'
}

'Bad Code'

function feed(animal) {
    return `Feed ${animal.name}; ${animal.meal} kilos of ${animal.diet}`;
}

'Good Code'

function feed({ name, meal, diet }) {
    return `Feed ${name} ${meal} kilos of ${diet}`;
}

// OR

function feed(animal) {
    const { name, meal, diet } = animal;
    return `Feed ${name} ${meal} kilos of ${diet}`;
}