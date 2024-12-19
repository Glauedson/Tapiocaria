package com.netolanches.Tapiocas

data class SaleRequest(
    val idfood: Int,
    val cpf: String,
    val description: String,
    val price: Float
)