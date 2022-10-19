package Repositorio

import Dominio.Vendas
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class VendasRepositorio(val jdbcTemplate: JdbcTemplate) {
    fun inserir(vendas: Vendas) {
        jdbcTemplate.update("""
           insert into vendas (fkFilial,transacao,qtdTransacao,valor) values
            (${vendas.fkFiial},'${vendas.transacao}',${vendas.qtdTransacao},${vendas.valor})
        """)
    }

    fun listar():List<Vendas> {
        return jdbcTemplate.query("select * from Vendas",
            BeanPropertyRowMapper(Vendas::class.java)
        )
    }
}