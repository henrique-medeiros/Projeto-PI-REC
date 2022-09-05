CREATE DATABASE REC;
USE REC;

CREATE TABLE Matriz (
    idMatriz INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    logradouro VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    fkMatriz INT,
    FOREIGN KEY (fkMatriz)
        REFERENCES Matriz (idMatriz),
    nomeEmpresa VARCHAR(45) NOT NULL,
    logradouroEmpresa VARCHAR(45) NOT NULL,
    numeroEmpresa INT NOT NULL,
    bairroEmpresa VARCHAR(45) NOT NULL,
    cidadeEmpresa VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    receita DECIMAL(8,1)
)  AUTO_INCREMENT=10;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
        REFERENCES Empresa (idEmpresa),
    nomeUsuario VARCHAR(45) NOT NULL,
    emailUsuario VARCHAR(45) NOT NULL,
    senhaUsuario VARCHAR(45) NOT NULL
)  AUTO_INCREMENT=100;

CREATE TABLE Sala (
    idSala INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
        REFERENCES Empresa (idEmpresa),
    numeroSala INT NOT NULL,
    situacao VARCHAR(45) NOT NULL CHECK (situacao = 'disponivel'
        OR situacao = 'indisponivel'
        OR situacao = 'manutencao')
)  AUTO_INCREMENT=500; 

CREATE TABLE Hardware (
    idHardware INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa)
        REFERENCES Empresa (idEmpresa),
    modeloMaquina VARCHAR(45) NOT NULL,
    sistemaOP VARCHAR(45) NOT NULL
)  AUTO_INCREMENT=1000;

CREATE TABLE Vendas (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkHardware INT,
    FOREIGN KEY (fkHardware)
        REFERENCES Hardware (idHardware),
    tituloTransacao VARCHAR(45) NOT NULL,
    valor DECIMAL(5 , 2 ) NOT NULL
)  AUTO_INCREMENT=50;

CREATE TABLE Leitura (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    fkHardware INT,
    FOREIGN KEY (fkHardware)
        REFERENCES Hardware (idHardware),
    cpuTotem INT NOT NULL,
    memoriaTotem DECIMAL(2 , 1 ) NOT NULL,
    discoTotem INT NOT NULL,
    dataHora DATETIME NOT NULL
);

SELECT * FROM Matriz;
SELECT * FROM Empresa;
SELECT * FROM Sala;
SELECT * FROM Usuario;
SELECT * FROM Hardware;
SELECT * FROM Leitura;
SELECT * FROM Vendas;

INSERT INTO matriz VALUES 
(NULL, 'Cinemark Brasil S.A.', '00779721002357','Avenida Doutor Chucri Zaida',920,'Vila Cordeiro','São Paulo','SP');
