package App

import Configuracao.Conexao
import Dominio.Vendas
import Repositorio.VendasRepositorio
import javax.swing.JOptionPane.*

fun main() {
    val jdbcTemplate = Conexao().getJdbcTemplate()
    val vendasRepositorio = VendasRepositorio(jdbcTemplate)

    while (true){

    val novoFkFilial = showInputDialog(null,"Qual o id da filial?").toInt()
    val novoTransacao = showInputDialog(null,"Qual a transação ?")
        if (novoTransacao == "Bomboniere" || novoTransacao == "Ingressos"){
            val novoQtdTransacao = showInputDialog(null,"Qual a quatidade da transação?").toInt()
            val novoValor = showInputDialog(null,"Valor da transação:").toInt()

            val novoVendas = Vendas(0,novoFkFilial,novoTransacao,novoQtdTransacao,novoValor)
            vendasRepositorio.inserir(novoVendas)

            val vendas = vendasRepositorio.listar()
            var consultar = ""
            vendas.forEach{
                consultar += "${it.idVenda}, ${it.fkFiial}, ${it.transacao}, ${it.qtdTransacao}, ${it.valor}"
                consultar += "\r\n"
                showMessageDialog(null,consultar)
            }
        } else{
            showMessageDialog(null,"Valores invalidos")
        }
    }
}