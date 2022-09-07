-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
CREATE DATABASE REC;
USE REC;
-- DROP DATABASE REC;

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    logradouro VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE Licenca (
idLicenca INT PRIMARY KEY,
fkEmpresa INT,
FOREIGN KEY (fkEmpresa)
	REFERENCES Empresa (idEmpresa),
tipoLicenca VARCHAR(45) NOT NULL CHECK (tipoLicenca = 'analista'
        OR tipoLicenca = 'gerenciaFilial'
        OR tipoLicenca = 'gerenciaMatriz')
);

CREATE TABLE Filial (
    idFilial INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
        REFERENCES Empresa (idEmpresa),
    nomeFantasia VARCHAR(45) NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL,
    complemento VARCHAR(45),
    receita DECIMAL(8,1)
)  AUTO_INCREMENT=10;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
	fkLicenca INT,
    FOREIGN KEY (fklicenca)
		REFERENCES Licenca (idLicenca),
    nomeUsuario VARCHAR(45) NOT NULL,
    emailUsuario VARCHAR(45) NOT NULL,
    senhaUsuario VARCHAR(45) NOT NULL
)  AUTO_INCREMENT=100;

CREATE TABLE Sala (
    idSala INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
    numeroSala INT NOT NULL,
    situacao VARCHAR(45) NOT NULL CHECK (situacao = 'disponivel'
        OR situacao = 'indisponivel'
        OR situacao = 'manutencao')
)  AUTO_INCREMENT=500; 

CREATE TABLE Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
	nome VARCHAR(45) NOT NULL,
    maquina VARCHAR(45) NOT NULL,
    sistemaOp VARCHAR(45) NOT NULL
)  AUTO_INCREMENT=1000;

CREATE TABLE Vendas (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
    transacao VARCHAR(45) NOT NULL CHECK (transacao = 'Bomboniere'
        OR transacao = 'Ingressos'),
    qtdTransacao INT NOT NULL,
    valor FLOAT NOT NULL
)  AUTO_INCREMENT=50;

--  ******************************************************
--  * NÃO CRIAR A TABELA LEITURA, A API PYTHON VAI CRIAR *
--  ******************************************************
-- CREATE TABLE Leitura (
--    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
--    fkAtm INT,
--    FOREIGN KEY (fkAtm)
--        REFERENCES Atm (idAtm),
--    cpuTotem FLOAT NOT NULL,
--   memoriaTotem FLOAT NOT NULL,
--    discoTotem FLOAT NOT NULL,
--    dataHora DATETIME NOT NULL
-- );

-- Inserção e visualização de dados em tabelas

-- Inserção feita pela REC
DESC Empresa;
INSERT INTO Empresa 
	VALUES (NULL, 'Cinemark Brasil S.A.', '00779721002357','Avenida Doutor Chucri Zaida',920,'Vila Cordeiro','São Paulo','SP');
SELECT * FROM Empresa;

-- Inserção feita pelo Usuario
DESC Filial;
INSERT INTO Filial 
	VALUES (null, 1, 'Cinemark Tatuape','04140130', 'Endereço Teste', 100, 'Vila Lageado', 'São Paulo', 'SP', null, 8000000.0);
SELECT * FROM Filial;

-- Inserção feita pelo Usuario
DESC Sala;
INSERT INTO Sala 
	VALUES (NULL, 10, 1,"disponivel");
SELECT * FROM Sala;

-- Inserção feita pela REC
DESC Licenca;
INSERT INTO Licenca
	VALUES (105345,1, "gerenciaMatriz"),
			(105346,1, "gerenciaFilial"),
            (105347,1, "analista");
SELECT * FROM Licenca;

-- Inserção feita pelo Usuario
DESC Usuario;
INSERT INTO Usuario
	VALUES (NULL, 10,105345, "fernandoBrandao", "fernando.brandao@sptech.school", "12345");
SELECT * FROM Usuario;

-- Inserção feita pela API REC (NÃO EXECUTAR O INSERT)
DESC Atm;
-- INSERT INTO Atm
-- VALUES ();
-- INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (10, "nomeMaquina" , "maquina", "sistema");
SELECT * FROM Atm;
TRUNCATE Atm;

-- Inserção feita pela API REC (NÃO EXECUTAR O INSERT)
-- DESC Leitura;
-- INSERT INTO Leitura
-- VALUES ();
-- INSERT INTO Leitura (fkAtm, cpuTotem, memoriaTotem, discoTotem, dataHora) VALUES (1000, 3232 , 323, 32131,'2022-10-21 10:06:23');
-- SELECT * FROM Leitura;
-- DROP TABLE Leitura;
-- TRUNCATE Leitura;

-- Inserção feita pela REC
DESC Vendas;
INSERT INTO Vendas
	VALUES (NULL, 10, "bomboniere",5,500);
SELECT * FROM Vendas;

select * from filial;
select * from usuario;

