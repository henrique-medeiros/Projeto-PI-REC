package Repositorio

import Dominio.Filial
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class FilialRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(filial: Filial) {
        jdbcTemplate.update("""
           insert into Filial (fkEmpresa,nomeFantasia,logradouro,numero,bairro,cidade,estado,cep,receita) values
            (${filial.fkEmpresa},'${filial.nomeFantasia}','${filial.logradouro}',${filial.numero},'${filial.bairro}','${filial.cidade}','${filial.estado}',
            ${filial.cep},${filial.receita}
            )
        """)
    }

    fun listar():List<Filial> {
        return jdbcTemplate.query("select * from Filial",
            BeanPropertyRowMapper(Filial::class.java)
        )
    }
}