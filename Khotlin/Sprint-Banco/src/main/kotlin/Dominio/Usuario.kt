package Dominio

data class Usuario(var idUsuario:Int,
                   var fkFilial:Int,
                   var fkLicenca:Int,
                   var nomeUsuario:String,
                   var emailUsuario:String,
                   var senhaUsuario:Int
                   ) {
    constructor() : this(0,0,0,"","",0)
}