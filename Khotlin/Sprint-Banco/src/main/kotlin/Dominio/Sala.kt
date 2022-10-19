package Dominio

data class Sala(var idSala:Int,
                var fkFilial:Int,
                var numeroSala:Int,
                var situacao:String
                ) {
    constructor(): this(0,0,0,"")
}