package App

import Configuracao.Conexao
import Dominio.Sala
import Repositorio.SalaRepositorio
import javax.swing.JOptionPane.*

fun main() {

    val jdbcTemplate = Conexao().getJdbcTemplate()
    val salaRepositorio = SalaRepositorio(jdbcTemplate)

    val novoFkFilial = showInputDialog(null,"Qual o id referente a filial?").toInt()
    val novoNumeroSala = showInputDialog(null,"Numero de salas ?").toInt()
    val novoSituacao = showInputDialog(null,"Qual a situação da sala ?")
        if (novoSituacao == "disponivel" || novoSituacao == "indisponivel" || novoSituacao == "manutencao"){
            val novoSala = Sala(0,novoFkFilial,novoNumeroSala,novoSituacao)
            salaRepositorio.inserir(novoSala)

            val sala = salaRepositorio.listar()
            var consultar = ""

            sala.forEach{
                consultar += "${it.idSala},${it.fkFilial}, ${it.numeroSala}, ${it.situacao}"
                consultar += "\r\n"
                showMessageDialog(null, consultar)
            }
        }
        else{
            showMessageDialog(null,"Valores Invalidos")
        }
}