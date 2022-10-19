package App

import Configuracao.Conexao
import Dominio.Licenca
import Repositorio.LicencaRepositorio
import javax.swing.JOptionPane.*

fun main() {
    val jdbcTemplate = Conexao().getJdbcTemplate()
    val licencaRepositorio = LicencaRepositorio(jdbcTemplate)

    while (true) {
        val novoIdLicenca = showInputDialog(null,"Qual o id").toInt()
        val novoFkEmpresa = showInputDialog(null, "Qual o id da empresa ?").toInt()
        val novoTipoLicenca = showInputDialog(null, "Qual o tipo de Licença ?")
        if (novoTipoLicenca == "analista" || novoTipoLicenca == "gerenciaFilial" || novoTipoLicenca == "gerenciaMatriz"){
            val novoLicenca = Licenca(novoIdLicenca,novoFkEmpresa,novoTipoLicenca)
            licencaRepositorio.inserir(novoLicenca)

            val licenca = licencaRepositorio.listar()
            var consultar = ""

            licenca.forEach {
                consultar += "Licenca - ${it.idLicenca}, ${it.fkEmpresa}, ${it.tipoLicenca}"
                consultar += "\r\n"
                showMessageDialog(null, consultar)
            }
        }
        else{
            showMessageDialog(null,"Valores invalidos")
        }
    }
}