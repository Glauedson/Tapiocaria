package com.netolanches.Tapiocas

import org.springframework.data.domain.Sort
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.text.DecimalFormat

@RestController
@CrossOrigin(origins = ["http://localhost:5500"])
class TapiocasController(
  val foodsRepository: FoodsRepository,
  val filingsRepository: FilingsRepository,
  val salesRepository: SalesRepository,
  val tapiocasCategoryRepository: TapiocasCategoryRepository,
  val cuscuzCategoryRepository: CuscuzCategoryRepository,
  val sanduichesCategoryRepository: SanduichesCategoryRepository
){

  @GetMapping("/food")
  fun getFilingsByFoodId(@RequestParam("id") id: Int = 0): Map<String, Any>{

    try {
      val food = foodsRepository.findById(id);
      val filings = filingsRepository.getAllFilingsByFoodId(id);

      val response =
        mapOf(
          "price" to food.get().price,
          "filings" to filings
        );

      return response;
    }catch(e: Exception){
      return mapOf("error" to e.message.toString());
    }
  }

  @GetMapping("/history")
  fun getAllSalesByCpfClient(@RequestParam("cpf") cpf: String): List<Sales>{
    return salesRepository.getAllSalesByCpfClient(cpf);
  }


  //Esse Endpoint é para ser usado na parte de categorias
  //No caso, esse Endpoint é para categoria de tapiocas
  @GetMapping("/Tapiocas")
  fun getTapiocaById(@RequestParam(required = false) id: Int?): Any {
    return if (id != null) {

      try {
        val tapioca = tapiocasCategoryRepository.findById(id)
        if (tapioca.isPresent) {

          val formattedPrice = DecimalFormat("#,##0.00").format(tapioca.get().preco)

          mapOf(
            "id" to tapioca.get().id,
            "nome" to tapioca.get().nome,
            "descricao" to tapioca.get().descricao,
            "ingredientes" to tapioca.get().ingredientes,
            "preco" to formattedPrice,
            "imagemUrl" to tapioca.get().imagemUrl,
            "avaliacaoEstrela" to tapioca.get().avaliacaoEstrela

          )
        } else {
          mapOf("error" to "Tapioca não encontrada")
        }
      } catch (e: Exception) {
        mapOf("error" to e.message.toString())
      }

    } else {
      val tapiocas = tapiocasCategoryRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
      val formattedTapiocas = tapiocas.map {
        mapOf(
          "id" to it.id,
          "nome" to it.nome,
          "descricao" to it.descricao,
          "ingredientes" to it.ingredientes,
          "preco" to DecimalFormat("#0.00").format(it.preco),
          "imagemUrl" to it.imagemUrl,
          "avaliacaoEstrela" to it.avaliacaoEstrela
        )
      }

      return formattedTapiocas
    }

  }

  //puxa todos os dados do banco de cuscuz
  @GetMapping("/Cuscuz")
  fun getCuscuzById(@RequestParam(required = false) id: Int?): Any {
    return if (id != null) {

      try {
        val cuscuz = cuscuzCategoryRepository.findById(id)
        if (cuscuz.isPresent) {

          val formattedPrice = DecimalFormat("#,##0.00").format(cuscuz.get().preco)

          mapOf(
            "id" to cuscuz.get().id,
            "nome" to cuscuz.get().nome,
            "descricao" to cuscuz.get().descricao,
            "ingredientes" to cuscuz.get().ingredientes,
            "preco" to formattedPrice,
            "imagemUrl" to cuscuz.get().imagemUrl,
            "avaliacaoEstrela" to cuscuz.get().avaliacaoEstrela
          )
        } else {
          mapOf("error" to "Cuscuz não encontrado")
        }
      } catch (e: Exception) {
        mapOf("error" to e.message.toString())
      }

    } else {
      val cuscuz = cuscuzCategoryRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
      val formattedCuscuz = cuscuz.map {
        val formattedPrice = DecimalFormat("#,##0.00").format(it.preco)

        mapOf(
          "id" to it.id,
          "nome" to it.nome,
          "descricao" to it.descricao,
          "ingredientes" to it.ingredientes,
          "preco" to formattedPrice,
          "imagemUrl" to it.imagemUrl,
          "avaliacaoEstrela" to it.avaliacaoEstrela
        )
      }

      return formattedCuscuz
    }
  }


  @GetMapping("/Sanduiches")
  fun getSanduicheById(@RequestParam(required = false) id: Int?): Any {
    return if (id != null) {

      try {
        val sanduiches = sanduichesCategoryRepository.findById(id)
        if (sanduiches.isPresent) {

          val formattedPrice = DecimalFormat("#,##0.00").format(sanduiches.get().preco)

          mapOf(
            "id" to sanduiches.get().id,
            "nome" to sanduiches.get().nome,
            "descricao" to sanduiches.get().descricao,
            "ingredientes" to sanduiches.get().ingredientes,
            "preco" to formattedPrice,
            "imagemUrl" to sanduiches.get().imagemUrl,
            "avaliacaoEstrela" to sanduiches.get().avaliacaoEstrela

          )
        } else {
          mapOf("error" to "Sanduiche não encontrado")
        }
      } catch (e: Exception) {
        mapOf("error" to e.message.toString())
      }

    } else {
      val sanduiches = sanduichesCategoryRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
      val formattedSanduiches = sanduiches.map {
        mapOf(
          "id" to it.id,
          "nome" to it.nome,
          "descricao" to it.descricao,
          "ingredientes" to it.ingredientes,
          "preco" to DecimalFormat("#0.00").format(it.preco),
          "imagemUrl" to it.imagemUrl,
          "avaliacaoEstrela" to it.avaliacaoEstrela
        )
      }

      return formattedSanduiches
    }
  }

}

