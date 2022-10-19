package Dominio

data class Atm(var idAtm:Int,
               var fkFilial:Int,
               var nome:String,
               var maquina:String,
               var sistemaOp:String
               ) {
    constructor() : this(0,0,"","","")
}