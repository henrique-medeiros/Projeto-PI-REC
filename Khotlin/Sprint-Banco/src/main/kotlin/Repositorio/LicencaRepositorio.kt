package Repositorio

import Dominio.Licenca
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class LicencaRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(licenca: Licenca) {
        jdbcTemplate.update("""
           insert into Licenca (idLicenca,fkEmpresa,tipoLicenca) values
            (${licenca.idLicenca},${licenca.fkEmpresa},'${licenca.tipoLicenca}')
        """)
    }
    fun listar():List<Licenca> {
        return jdbcTemplate.query("select * from Licenca",
            BeanPropertyRowMapper(Licenca::class.java)
        )
    }
}