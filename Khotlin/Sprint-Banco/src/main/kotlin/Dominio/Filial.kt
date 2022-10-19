package Dominio

data class Filial(var idFilial:Int,
                  var fkEmpresa:Int,
                  var nomeFantasia:String,
                  var logradouro:String,
                  var numero:Int,
                  var bairro:String,
                  var cidade:String,
                  var estado:String,
                  var cep:Int,
                  var receita:Int
                  ) {
    constructor() : this(0,0,"","",0,"","","",0,0)
}