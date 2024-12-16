
import { setupModal } from './feature/modal.js'
import { greetings } from './feature/greetings.js'

const categories = document.querySelectorAll(".openModal")

categories.forEach((category) => {
    category.addEventListener("click", (event) => {
        event.preventDefault()

        const Category = category.getAttribute("value")

        setupModal(Category)
    })
})


greetings()