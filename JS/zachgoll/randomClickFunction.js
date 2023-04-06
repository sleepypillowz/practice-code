//On a FireFox Browser  Click Inspect to Access Developer Tools then go to Console and Paste this Code to execute.

clear()

const htmlBody = document.querySelector('body');

const randomClickFunction = function () {
    const colors = ["#002942", "#0Ca708", "red", "blue", "green", "yellow", "orange", "purple"];

    const randomIndex = Math.floor(Math.random() * colors.length);

    const randomColor = colors[randomIndex];

    htmlBody.style.backgroundColor = randomColor;

    console.log('The user clicked and set the color to ' + randomColor);

}

htmlBody.onclick = randomClickFunction;