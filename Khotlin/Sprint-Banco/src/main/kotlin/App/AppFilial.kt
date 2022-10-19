package App

import Configuracao.Conexao
import Dominio.Filial
import Repositorio.FilialRepositorio
import javax.swing.JOptionPane.*

fun main() {
    val jdbcTemplate = Conexao().getJdbcTemplate()
    val filialRepositorio = FilialRepositorio(jdbcTemplate)

    val novoFkEmpresa = showInputDialog(null,"Qual a id referente a empresa ?").toInt()
    val novoNomeFantasia = showInputDialog(null,"Qual o nome Fantasia da empresa ?")
    val novologradouro = showInputDialog(null,"Qual o logradouro ?")
    val novoNumero = showInputDialog(null,"Numero ?").toInt()
    val novoBairro = showInputDialog(null,"Bairro ?")
    val novoCidade = showInputDialog(null,"Cidade ?")
    val novoEstado = showInputDialog(null, "Estado ?")
    val novoCep = showInputDialog(null,"Cep ?").toInt()
    val novoReceita = showInputDialog(null,"Qual a receita da empresa ?").toInt()

    val novoFilial = Filial(0,novoFkEmpresa,novoNomeFantasia,novologradouro,novoNumero,novoBairro,novoCidade,novoEstado,novoCep,novoReceita)
    filialRepositorio.inserir(novoFilial)

    val filial = filialRepositorio.listar()
    var consultar = ""

    filial.forEach {
        consultar += "Empresa:${it.idFilial} - ${it.fkEmpresa},${it.nomeFantasia},${it.logradouro},${it.numero},${it.bairro},${it.cidade},${it.estado},${it.cep},${it.receita},"
        consultar += "\r\n"
    }
    showMessageDialog(null, consultar)
}