package com.netolanches.Tapiocas

import org.springframework.data.domain.Sort
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.text.DecimalFormat

@RestController
class TapiocasController(
  val foodsRepository: FoodsRepository,
  val filingsRepository: FilingsRepository,
  val salesRepository: SalesRepository,
  val tapiocasCategoryRepository: TapiocasCategoryRepository
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
  @GetMapping("/tapiocas")
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
      tapiocasCategoryRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
    }

  }


}

