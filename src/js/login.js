const display = document.getElementById('display');
const buttons = document.querySelectorAll('.num');
const clearButton = document.getElementById('clear');

buttons.forEach(button => {
  button.addEventListener('click', () => {
    if (display.textContent.replace(/-/g, '').length < 11) { 
      display.textContent = display.textContent.replace(/-/, '') + button.value;
      display.textContent = display.textContent.padEnd(13, ''); 
    }
  });
});

clearButton.addEventListener('click', () => {
  display.textContent = '---------';
});
