export async function setupModal(Category) {
    const modal = document.getElementById("modal")
    const closeModalBtn = document.getElementById("closeModal")
    const modalOrdersHub = document.getElementById("modal-orders-hub")

    modal.style.display = "block"

    closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none"
        modalOrdersHub.innerHTML = ""
    })

    document.getElementById("modal-header-text").innerHTML = `<h2>${Category}</h2>`

    // Criar placeholders antes da requisição
    // Isso é pra ser um loading Skeleton
    modalOrdersHub.innerHTML = ""
    for (let i = 0; i < 6; i++) {
        modalOrdersHub.innerHTML += `
            <div class="modal-orders placeholder">
                <div class="orders-text">
                    <h3 class="placeholder-text"></h3>
                    <p class="placeholder-text"></p>
                    <div class="price-placeholder"></div>
                </div>
                <div class="orders-image placeholder-image"></div>
            </div>
        `
    }

    try {
        var API = await fetch(`http://localhost:8080/${Category}`)
        var data = await API.json()

        modalOrdersHub.innerHTML = ""

        for (let i = 0; i < data.length; i++) {
            modalOrdersHub.innerHTML += `
                <a href="/src/html/pedidosDetalhes.html?category=${Category}&id=${data[i].id}" 
                   style="display: block; width: 100%; height: 100%; text-decoration: none; color: black;">
                    <div class="modal-orders">
                        <div class="orders-text">
                            <h3>${data[i].nome}</h3>
                            <p style="font-size: 11px;">${data[i].descricao || data[i].ingredientes}</p>
                            <div class="price-evaluation" style="display: flex;">
                                <h3>R$ ${data[i].preco}</h3>
                                ${data[i].avaliacaoEstrela ? `
                                    <img src="../assets/icons/star-solid.svg" width="19px" style="padding-left: 15px;">
                                    <h3>${data[i].avaliacaoEstrela}</h3>` 
                                : ''}
                            </div>
                        </div>
                        <div class="orders-image"
                            style="background-image: url(${data[i].imagemUrl});
                            background-position: center;
                            background-size: cover;">
                        </div>
                    </div>
                </a>
            `
        }
    } catch (error) {
        setTimeout(() => {
            modalOrdersHub.innerHTML = "<p>Erro ao carregar os pedidos. Tente novamente.</p>"
        }, 10000)
    }
}
