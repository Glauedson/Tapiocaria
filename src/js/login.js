const display = document.getElementById('display');
const buttons = document.querySelectorAll('.num');
const clearButton = document.getElementById('clear');

buttons.forEach(button => {
  button.addEventListener('click', () => {
    if (display.textContent.replace(/-/g, '').length < 11) { // Limita a 11 dígitos
      display.textContent = display.textContent.replace(/-/, '') + button.value;
      display.textContent = display.textContent.padEnd(13, ''); // Preenche com '-'
    }
  });
});

clearButton.addEventListener('click', () => {
  display.textContent = '---------';
});
