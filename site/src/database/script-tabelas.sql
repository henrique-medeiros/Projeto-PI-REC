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

CREATE TABLE Filial (
    idFilial INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
        REFERENCES Empresa (idEmpresa),
    nomeFilial VARCHAR(45) NOT NULL,
    logradouroFilial VARCHAR(45) NOT NULL,
    numeroFilial INT NOT NULL,
    bairroFilial VARCHAR(45) NOT NULL,
    cidadeFilial VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    receita DECIMAL(8,1)
)  AUTO_INCREMENT=10;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
    nomeUsuario VARCHAR(45) NOT NULL,
    emailUsuario VARCHAR(45) NOT NULL,
    tipoLogin VARCHAR(45) NOT NULL
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

CREATE TABLE Totem (
    idTotem INT PRIMARY KEY AUTO_INCREMENT,
    fkFilial INT,
    FOREIGN KEY (fkFilial)
        REFERENCES Filial (idFilial),
    modeloTotem VARCHAR(45) NOT NULL,
    numeroSerial INT NOT NULL
)  AUTO_INCREMENT=1000;

CREATE TABLE Vendas (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkTotem INT,
    FOREIGN KEY (fkTotem)
        REFERENCES Totem (idTotem),
    tituloTransacao VARCHAR(45) NOT NULL,
    valor DECIMAL(5 , 2 ) NOT NULL
)  AUTO_INCREMENT=50;

CREATE TABLE Leitura (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    fkTotem INT,
    FOREIGN KEY (fkTotem)
        REFERENCES Totem (idTotem),
    cpuTotem INT NOT NULL,
    memoriaTotem DECIMAL(2 , 1 ) NOT NULL,
    discoTotem INT NOT NULL,
    dataHora DATETIME NOT NULL
);

-- SELECT * FROM Empresa;
-- SELECT * FROM Filial;
-- SELECT * FROM Sala;
-- SELECT * FROM Usuario;
-- SELECT * FROM Totem;
-- SELECT * FROM Leitura;
-- SELECT * FROM Vendas;

INSERT INTO empresa VALUES 
(NULL, 'Cinemark Brasil S.A.', '00779721002357','Avenida Doutor Chucri Zaida',920,'Vila Cordeiro','São Paulo','SP');
