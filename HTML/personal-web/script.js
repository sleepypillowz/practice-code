//smooth scrolling
document.addEventListener('DOMContentLoaded', function () {
  var navLinks = document.querySelectorAll('.nav-link');
  for (var i = 0; i < navLinks.length; i++) {
    navLinks[i].addEventListener('click', function (event) {
      event.preventDefault();
      var target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.classList.add('scroll-offset');
        window.location.hash = this.getAttribute('href');
        target.classList.remove('scroll-offset');
      }
    });
  }
});
// smooth scrolling

// change skill color
document.addEventListener("DOMContentLoaded", function () {
  const skillProgressBars = document.querySelectorAll(".skill-progress-bar");

  skillProgressBars.forEach(function (progressBar) {
    const width = parseInt(progressBar.style.width, 10);

    if (width >= 0 && width <= 24) {
      progressBar.style.backgroundColor = "#FA8072";
    } else if (width >= 25 && width <= 74) {
      progressBar.style.backgroundColor = "#F0E68C";
    } else if (width >= 75 && width <= 100) {
      progressBar.style.backgroundColor = "#50C878";
    }
  });
});
// change skill color

// loader

// Wait for the page to load
window.addEventListener('load', function () {
  // Hide the loader after 2 seconds
  setTimeout(function () {
    var loader = document.getElementById('loader');
    loader.classList.add('hidden');

    var content = document.getElementById('content');
    content.style.display = 'block';
  }, 1500);
});
// loader