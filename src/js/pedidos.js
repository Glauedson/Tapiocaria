function greetings() {
    const now = new Date()
    const hours = now.getHours()

    if (hours >= 0 && hours < 12) return "BOM DIA"
    else if (hours >= 12 && hours < 18) return "BOA TARDE"
    else return "BOA NOITE"
}

document.getElementById("saudacao").textContent = greetings();