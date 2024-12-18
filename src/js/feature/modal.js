export async function setupModal(Category) {
    const modal = document.getElementById("modal")
    const closeModalBtn = document.getElementById("closeModal")
    
    modal.style.display = "block"

    const modalHeader = document.getElementById("modal-header-text").innerHTML = `<h2>${Category}</h2>`
    const modalOrdersHub = document.getElementById("modal-orders-hub")
    
    var API = await fetch(`http://localhost:8080/${Category}`)
    var data = await API.json()

    for ( let i = 0; i < data.length; i++) {

        if ( data[i].id === 1 ) {
         
            modalOrdersHub.innerHTML += `
                <a href="#" style="display: block; width: 100%; height: 100%; text-decoration: none; color: black;">
                    <div class="modal-orders"> <!-- Comida personalizada -->
                        <div class="orders-text">
                            <h3>${data[i].nome}</h3>
                            <p style="font-size: 11px;">${data[i].descricao}</p>
                            <div class="price-for-first-order">
                                <h4 style="background-color: #3E8E41;
                                padding: 6PX;
                                color: white;
                                border-radius: 7px;
                                width: 160px;
                                text-align: center;">PREÇO BASE: R$ ${data[i].preco}</h4>
                            </div>
                        </div>
                        <div class="orders-image"
                        style="background-image: url(${data[i].imagemUrl});
                        background-position: center;
                        background-size: cover; height: 100%;"
                        >
                        </div>
                    </div>
                </a>
            `

        } else {
            
            modalOrdersHub.innerHTML += `
                <a href="#" style="display: block; width: 100%; height: 100%; text-decoration: none; color: black;">
                    <div class="modal-orders"> <!-- Comida do cardápio -->
                        <div class="orders-text">
                            <h3>${data[i].nome}</h3>
                            <p style="font-size: 11px;">${data[i].ingredientes}</p>
                            <div class="price-evaluation" style="display: flex;">
                                <h3>R$ ${data[i].preco}</h3>
                                <img src="../assets/icons/star-solid.svg" 
                                    alt="estrela de avaliação"
                                    width="19px" 
                                    style="padding-left: 15px;">
                                <h3>${data[i].avaliacaoEstrela}</h3>
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
    }
    
    closeModalBtn.addEventListener("click", () => {
        modal.style.display = "none"
        modalOrdersHub.innerHTML = ""
    })
}