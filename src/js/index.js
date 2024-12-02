const initialScreen = document.querySelector('.initial-screen')
const main = document.querySelector('.main')

initialScreen.addEventListener('click', () => {
  initialScreen.style.transform = 'translateY(-100%)'
  setTimeout(() => {
    initialScreen.style.display = 'none'
    main.style.display = 'block'
  }, 1000)
})
