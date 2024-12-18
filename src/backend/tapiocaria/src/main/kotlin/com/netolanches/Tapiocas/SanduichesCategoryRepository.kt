package com.netolanches.Tapiocas

import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table
import org.springframework.data.jpa.repository.JpaRepository

@Entity
@Table(name = "sanduiches")
data class SanduicheCategoryRepository(
    @Id val id: Int,
    val nome: String,
    val descricao: String,
    val ingredientes: String,
    val preco: Double,
    val imagemUrl: String,
    val avaliacaoEstrela: Float
)

interface SanduichesCategoryRepository : JpaRepository<SanduicheCategoryRepository, Int> {
    fun findByNome(nome: String): SanduicheCategoryRepository?
}