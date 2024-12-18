
async function Main(){
const urlParams = new URLSearchParams(window.location.search);

const pedidoId = urlParams.get('id');
const category = urlParams.get('category');


console.log("ID do pedido:", pedidoId)
console.log("Categoria:", category)

var API = await fetch(`http://localhost:8080/${category}?id=${pedidoId}`)
var data = await API.json()

console.log(data)
}

Main()