function greetings() {
    const now = new Date();
    const hours = now.getHours();

    if (hours >= 0 && hours < 12) return "BOM DIA";
    else if (hours >= 12 && hours < 18) return "BOA TARDE";
    else return "BOA NOITE";
}

// Seleciona os elementos
const modal = document.getElementById("modal");
const openModalBtn = document.getElementById("openModal");
const closeModalBtn = document.getElementById("closeModal");

// Abre o modal
openModalBtn.addEventListener("click", (event) => {
    event.preventDefault(); // Evita o comportamento padrão do link
    modal.style.display = "block";
});

// Fecha o modal
closeModalBtn.addEventListener("click", () => {
    modal.style.display = "none";
});

// Adiciona a saudação no elemento
document.getElementById("saudacao").textContent = greetings();