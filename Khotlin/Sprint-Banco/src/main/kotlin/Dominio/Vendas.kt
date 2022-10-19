package Dominio

data class Vendas(var idVenda:Int,
                  var fkFiial:Int,
                  var transacao:String,
                  var qtdTransacao:Int,
                  var valor:Int
                  ) {
    constructor() : this(0,0,"",0,0)
}