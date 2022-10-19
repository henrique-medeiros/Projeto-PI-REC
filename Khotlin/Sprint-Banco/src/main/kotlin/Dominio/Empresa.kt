package Dominio

data class Empresa(var idEmpresa:Int,
                   var razaoSocial:String,
                   var CNPJ:String,
                   var logradouro:String,
                   var numero:Int,
                   var bairro:String,
                   var cidade:String,
                   var estado:String,
                   var cep:String,
                   var complemento:String
                   ) {
constructor() : this(0,"","","",0,"","","","","")
}