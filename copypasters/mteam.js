const slider = document.querySelector('.cards-wrapper');
let isDown = false;
let startX;
let scrollLeft;

// Drag-to-scroll
slider.addEventListener('mousedown', (e) => {
  isDown = true;
  slider.classList.add('active');
  startX = e.pageX - slider.offsetLeft;
  scrollLeft = slider.scrollLeft;
});

slider.addEventListener('mouseleave', () => {
  isDown = false;
  slider.classList.remove('active');
});

slider.addEventListener('mouseup', () => {
  isDown = false;
  slider.classList.remove('active');
});

slider.addEventListener('mousemove', (e) => {
  if (!isDown) return;
  e.preventDefault();
  const x = e.pageX - slider.offsetLeft;
  const walk = (x - startX) * 2;
  slider.scrollLeft = scrollLeft - walk;
});

// Auto-scroll every 3 seconds
setInterval(() => {
  // Scroll 230px to the right each time (width + gap)
  if (slider.scrollLeft + slider.clientWidth >= slider.scrollWidth) {
    slider.scrollTo({ left: 0, behavior: 'smooth' });
  } else {
    slider.scrollBy({ left: 230, behavior: 'smooth' });
  }
}, 2000);
