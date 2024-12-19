export function setupPayButton(orderName, orderPrice) {
    
    const alertDiv = document.createElement("div")
    alertDiv.classList.add("custom-alert")
    alertDiv.innerHTML = `
        <h3>Pagamento Concluído</h3>
        <p>Você pagou R$<strong>${orderPrice}</strong> pelo pedido: <strong>${orderName}</strong></p>
    `
    document.body.appendChild(alertDiv)

    setTimeout(() => {
        alertDiv.remove()
    }, 3000)
}