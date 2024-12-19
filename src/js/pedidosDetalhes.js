async function Main() {
    const urlParams = new URLSearchParams(window.location.search)
    const pedidoId = urlParams.get("id")
    const category = urlParams.get("category")

    console.log("ID do pedido:", pedidoId)
    console.log("Categoria:", category)

    try {
        const API = await fetch(`http://localhost:8080/${category}?id=${pedidoId}`)
        const data = await API.json()

        const orderImage = document.querySelector(".order-image")
        orderImage.style.backgroundImage = `url(${data.imagemUrl})`

        const categoryStars = document.querySelector(".category-stars p")
        const stars = document.querySelector(".stars p")
        categoryStars.textContent = category.charAt(0).toUpperCase() + category.slice(1)
        stars.textContent = data.avaliacaoEstrela

        const orderName = document.querySelector(".order-description h3")
        orderName.textContent = data.nome

        const orderDescription = document.querySelector(".order-description > p:nth-of-type(2)")
        orderDescription.textContent = data.descricao

        const ingredientsContainer = document.querySelector(".ingredients-container")
        ingredientsContainer.innerHTML = ""
        const ingredientes = data.ingredientes.split(", ")
        ingredientes.forEach((ingrediente) => {
            const ingredientBox = document.createElement("div")
            ingredientBox.classList.add("ingredients-box")
            ingredientBox.innerHTML = `<h3 style="font-size: 18px;">${ingrediente.toUpperCase()}</h3>`
            ingredientsContainer.appendChild(ingredientBox)
        })

        const priceInfo = document.querySelector(".price-info h2")
        priceInfo.textContent = `R$ ${data.preco}`

        const payButton = document.querySelector(".pay-button")
        payButton.addEventListener("click", async () => {
            const cpf = "111.111.111-11"

            if (!pedidoId || !data || !data.nome || !data.preco) {
                alert("Dados inválidos ou incompletos. Verifique o pedido.")
                return
            }

            const paymentData = {
                idfood: pedidoId,
                cpf: cpf,
                description: data.nome,
                price: parseFloat(data.preco.replace(/[^\d,-]/g, '').replace(',', '.')),
                datesale: new Date().toISOString().split('T')[0]
            }

            if (isNaN(paymentData.price) || paymentData.price <= 0) {
                alert("Preço inválido. Verifique os dados do pedido.")
                return
            }

            try {
                const response = await fetch("http://localhost:8080/payment", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(paymentData)
                })

                const result = await response.json()

                if (response.ok) {
                    alert("Pagamento realizado com sucesso!")
                } else {
                    console.error("Erro ao processar o pagamento:", result)
                    alert(`Erro: ${result.message || "Tente novamente."}`)
                }
            } catch (error) {
                console.error("Erro ao enviar os dados de pagamento:", error)
                alert("Erro ao realizar o pagamento. Tente novamente mais tarde.")
            }
        })
    } catch (error) {
        console.error("Erro ao buscar ou processar os dados:", error)
    }
}

Main()
