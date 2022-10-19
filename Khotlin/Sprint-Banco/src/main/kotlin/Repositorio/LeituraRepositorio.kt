package Repositorio

import Dominio.Leitura
import org.springframework.jdbc.core.JdbcTemplate

class LeituraRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(leitura: Leitura) {
        jdbcTemplate.update("""
           insert into  () values
            ()
        """)
    }
}