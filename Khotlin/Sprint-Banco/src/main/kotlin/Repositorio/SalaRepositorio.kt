package Repositorio

import Dominio.Sala
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class SalaRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(sala: Sala) {
        jdbcTemplate.update("""
            insert into Sala (fkFilial,numeroSala,situacao) values 
            (${sala.fkFilial},${sala.numeroSala},'${sala.situacao}')
        """)
    }

    fun listar():List<Sala>{
        return jdbcTemplate.query("select * from Sala",
            BeanPropertyRowMapper(Sala::class.java)
        )
    }
}