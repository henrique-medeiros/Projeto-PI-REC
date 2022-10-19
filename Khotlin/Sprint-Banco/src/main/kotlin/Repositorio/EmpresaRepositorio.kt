package Repositorio

import Dominio.Empresa
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class EmpresaRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(empresa: Empresa) {
        jdbcTemplate.update("""
           insert into Empresa (razaoSocial, CNPJ, logradouro, numero, bairro, cidade, estado, cep, complemento) values
            ('${empresa.razaoSocial}',${empresa.CNPJ},'${empresa.logradouro}',${empresa.numero},'${empresa.bairro}',
            '${empresa.cidade}','${empresa.estado}',${empresa.cep},'${empresa.complemento}')
        """)
    }

    fun listar():List<Empresa> {
        return jdbcTemplate.query("select * from Empresa",
            BeanPropertyRowMapper(Empresa::class.java)
        )
    }
}