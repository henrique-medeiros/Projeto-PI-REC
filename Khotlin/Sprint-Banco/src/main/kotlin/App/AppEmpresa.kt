package App

import Configuracao.Conexao
import Dominio.Empresa
import Repositorio.EmpresaRepositorio
import javax.swing.JOptionPane.*

fun main() {
    val jdbcTemplate = Conexao().getJdbcTemplate()
    val empresaRepositorio = EmpresaRepositorio(jdbcTemplate)

//    val novoRazao = showInputDialog(null,"Qual a razão social?")
//    val novoCNPJ = showInputDialog(null,"Qual o CNPJ ?")
//    val novoLogradouro = showInputDialog(null,"Qual o logradouro?")
//    val novoNumero = showInputDialog(null,"Numero ?").toInt()
//    val novoBairro = showInputDialog(null,"Bairro?")
//    val novoCidade = showInputDialog(null,"Cidade ?")
//    val novoEstado = showInputDialog(null,"Estado ?")
//    val novoCep = showInputDialog(null,"Cep ?")
//    val novoComplemento = showInputDialog(null,"Complemento ?")
//
//    val novoEmpresa = Empresa(0,novoRazao,novoCNPJ,novoLogradouro,novoNumero,novoBairro,novoCidade,novoEstado,novoCep,novoComplemento)
//    empresaRepositorio.inserir(novoEmpresa)

    val empresa = empresaRepositorio.listar()
    var consultar = ""

    empresa.forEach {
        consultar += "${it.idEmpresa}- ${it.razaoSocial}, ${it.CNPJ}, ${it.logradouro}, ${it.numero}, ${it.bairro}, ${it.cidade}, ${it.estado}, ${it.cep}, ${it.complemento},"
        consultar += "\r\n"
    }
    showMessageDialog(null, consultar)

}
