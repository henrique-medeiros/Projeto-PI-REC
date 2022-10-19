package Repositorio

import Dominio.Usuario
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class UsuarioRepositorio(val jdbcTemplate: JdbcTemplate) {

    fun inserir(usuario: Usuario ) {
        jdbcTemplate.update("""
           insert into Usuario (idUsuario, fkFilial, fkLicenca, nomeUsuario, emailUsuario, senhaUsuario) values
            (${usuario.idUsuario}, ${usuario.fkFilial}, ${usuario.fkLicenca}, '${usuario.nomeUsuario}', 
            '${usuario.emailUsuario}', ${usuario.senhaUsuario})
        """)
    }

    fun listar():List<Usuario> {
        return jdbcTemplate.query("select * from Usuario",
            BeanPropertyRowMapper(Usuario::class.java)
        )
    }
}