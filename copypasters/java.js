  const slider = document.getElementById('slider');
  const imageUrls = Array.from({length: 20}, (_, i) => `https://picsum.photos/400/600?random=${i + 1}`);
  let currentIndex = 0;

  function createSlides() {
    slider.innerHTML = '';
    const total = imageUrls.length;
    const range = 3;

    for (let i = -range; i <= range; i++) {
      let index = (currentIndex + i + total) % total;
      const slide = document.createElement('div');
      slide.className = 'slide';
      slide.style.zIndex = range - Math.abs(i);
      slide.style.transform = `
        translateX(${i * 100}px)
        scale(${i === 0 ? 1 : 0.8})
        rotateY(${i * 10}deg)
      `;
      slide.innerHTML = `<img src="${imageUrls[index]}" alt="Image ${index + 1}">`;
      slider.appendChild(slide);
    }
  }

  function move(direction) {
    const total = imageUrls.length;
    currentIndex = (currentIndex + direction + total) % total;
    createSlides();
  }

  createSlides();