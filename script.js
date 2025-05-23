window.addEventListener('DOMContentLoaded', () => {
  const slider = document.querySelector('.slider-container');
  const overlay = document.querySelector('.slider-overlay');
  const divider = document.querySelector('.divider');
  const copyBtn = document.getElementById('copyBtn');
  const codeBox = document.getElementById('codeBox');
  

  let isDragging = false;

  function updateSlider(x) {
    const rect = slider.getBoundingClientRect();
    let pos = x - rect.left;

    if (pos < 0) pos = 0;
    if (pos > rect.width) pos = rect.width;

    const percent = (pos / rect.width) * 100;

    // Adjust clip-path with some offset for the diagonal line
    overlay.style.clipPath = `polygon(0 0, ${percent}% 0, ${Math.max(percent - 15, 0)}% 100%, 0% 100%)`;

    // Position the divider line, subtract half its width for perfect center
    divider.style.left = `${pos}px`
  }

  slider.addEventListener('mousedown', (e) => {
    isDragging = true;
    updateSlider(e.clientX);
  });

  window.addEventListener('mousemove', (e) => {
    if (!isDragging) return;
    updateSlider(e.clientX);
  });

  window.addEventListener('mouseup', () => {
    isDragging = false;
  });

  // Copy button functionality
  copyBtn.addEventListener('click', () => {
    navigator.clipboard.writeText(codeBox.textContent.trim()).then(() => {
      copyBtn.textContent = 'Copied!';
      setTimeout(() => (copyBtn.textContent = 'Copy'), 1500);
    });
  });

  // Initialize divider in center on load
  const rect = slider.getBoundingClientRect();
  updateSlider(rect.left + rect.width / 2);
});
