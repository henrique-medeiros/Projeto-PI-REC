package Dominio

data class Leitura(var idLeitura:Int,
                   var fkAtm:Int,
                   var cpuTotem:Int,
                   var memoriaTotem:Int,
                   var discoTotem:Int,
                   var dataHora:Int
                   ) {
    constructor() : this(0,0,0,0,0,0)
}