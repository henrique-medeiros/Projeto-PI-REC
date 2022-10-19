package Repositorio

import Dominio.Atm
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class AtmRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(atm: Atm){
        jdbcTemplate.update("""
           insert into Atm (fkFilial,nome,maquina,sistemaOp) values
            (${atm.fkFilial},'${atm.nome}','${atm.maquina}','${atm.sistemaOp}')
        """)
    }

    fun listar():List<Atm>{
        return jdbcTemplate.query("select * from Atm ",
        BeanPropertyRowMapper(Atm::class.java)
            )
    }
}