export async function setupModal(Category) {
    const modal = document.getElementById("modal")
    const closeModalBtn = document.getElementById("closeModal")
    
    modal.style.display = "block"

    const modalHeader = document.getElementById("modal-header-text").innerHTML = `<h2>${Category}</h2>`
    const API = await fetch(`http://localhost:8080/${Category}`)
    const data = await API.json()
    
    
    console.log(Category) 
    console.log(data)
    
    closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none"
    })
}