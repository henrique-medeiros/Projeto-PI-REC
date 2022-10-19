package Configuracao

fun main() {
    val jdbcTemplate = Conexao().getJdbcTemplate()

    jdbcTemplate.execute(""" 
        CREATE TABLE IF NOT EXISTS Empresa (
        idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
        razaoSocial VARCHAR(45) NOT NULL,
        CNPJ CHAR(14) NOT NULL,
        logradouro VARCHAR(45) NOT NULL,
        numero INT NOT NULL,
        bairro VARCHAR(45) NOT NULL,
        cidade VARCHAR(45) NOT NULL,
        estado CHAR(2) NOT NULL,
        cep CHAR (8) NOT NULL,
        complemento VARCHAR(45)
        );

        CREATE TABLE IF NOT EXISTS Licenca (
        idLicenca INT PRIMARY KEY,
        fkEmpresa INT,
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
        tipoLicenca VARCHAR(45) NOT NULL CHECK (tipoLicenca = 'analista'
        OR tipoLicenca = 'gerenciaFilial'
        OR tipoLicenca = 'gerenciaMatriz')
        );

        CREATE TABLE IF NOT EXISTS Filial (
        idFilial INT PRIMARY KEY AUTO_INCREMENT,
        fkEmpresa INT,
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
        nomeFantasia VARCHAR(45) NOT NULL,
        logradouro VARCHAR(45) NOT NULL,
        numero INT NOT NULL,
        bairro VARCHAR(45) NOT NULL,
        cidade VARCHAR(45) NOT NULL,
        estado CHAR(2) NOT NULL,
        cep CHAR(8) NOT NULL,
        receita FLOAT
        );

        CREATE TABLE IF NOT EXISTS Usuario (
        idUsuario INT PRIMARY KEY AUTO_INCREMENT,
        fkFilial INT,
        FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
	    fkLicenca INT,
        FOREIGN KEY (fklicenca) REFERENCES Licenca (idLicenca),
        nomeUsuario VARCHAR(45) NOT NULL,
        emailUsuario VARCHAR(45) NOT NULL,
        senhaUsuario VARCHAR(45) NOT NULL
        );
        
        CREATE TABLE Sala (
        idSala INT PRIMARY KEY AUTO_INCREMENT,
        fkFilial INT,
        FOREIGN KEY (fkFilial) REFERENCES Filial (idFilial),
        numeroSala INT NOT NULL,
        situacao VARCHAR(45) NOT NULL CHECK (situacao = 'disponivel'
        OR situacao = 'indisponivel'
        OR situacao = 'manutencao')
        ); 

        CREATE TABLE Atm (
        idAtm INT PRIMARY KEY AUTO_INCREMENT,
        fkFilial INT,
        FOREIGN KEY (fkFilial) REFERENCES Filial (idFilial),
	    nome VARCHAR(45) NOT NULL,
        maquina VARCHAR(45) NOT NULL,
        sistemaOp VARCHAR(45) NOT NULL
        );

        CREATE TABLE Vendas (
        idVenda INT PRIMARY KEY AUTO_INCREMENT,
        fkFilial INT,
        FOREIGN KEY (fkFilial) REFERENCES Filial (idFilial),
        transacao VARCHAR(45) NOT NULL CHECK (transacao = 'Bomboniere'
        OR transacao = 'Ingressos'),
        qtdTransacao INT NOT NULL,
        valor FLOAT NOT NULL
        );

        CREATE TABLE Leitura (
        idLeitura INT PRIMARY KEY AUTO_INCREMENT,
        fkAtm INT,
        FOREIGN KEY (fkAtm) REFERENCES Atm (idAtm),
        cpuTotem FLOAT NOT NULL,
        memoriaTotem FLOAT NOT NULL,
        discoTotem FLOAT NOT NULL,
        dataHora DATETIME NOT NULL
        );
""")
}