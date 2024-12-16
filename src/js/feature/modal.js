export function setupModal(Category) {
    const modal = document.getElementById("modal")
    const closeModalBtn = document.getElementById("closeModal")

    modal.style.display = "block";
    console.log(Category) 

    
    closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none"
    })
}