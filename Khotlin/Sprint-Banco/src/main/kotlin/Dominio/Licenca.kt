package Dominio

data class Licenca(var idLicenca:Int,
                   var fkEmpresa:Int,
                   var tipoLicenca:String
                   ){

    constructor() : this(0,0,"")

}