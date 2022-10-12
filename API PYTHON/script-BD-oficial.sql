create database REC;
use REC;

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
);

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

CREATE TABLE Leitura (
	idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    fkAtm INT,
    FOREIGN KEY (fkAtm)
        REFERENCES Atm (idAtm),
    cpuTotem FLOAT NOT NULL,
   memoriaTotem FLOAT NOT NULL,
    discoTotem FLOAT NOT NULL,
    dataHora DATETIME NOT NULL
 );
 select * from leitura;

INSERT INTO Empresa 
	VALUES (NULL, 'Cinemark Brasil S.A.', '00779721002357','Avenida Doutor Chucri Zaida',920,'Vila Cordeiro','São Paulo','SP');
    
INSERT INTO Filial 
	VALUES (null, 1, 'Cinemark Tatuape','04140130', 'Endereço Teste', 100, 'Vila Lageado', 'São Paulo', 'SP', null, 8000000.0);

INSERT INTO Sala 
	VALUES (NULL, 10, 1,"disponivel");

INSERT INTO Licenca
	VALUES (105345,1, "gerenciaMatriz"),
			(105346,1, "gerenciaFilial"),
            (105347,1, "analista");

INSERT INTO Usuario
	VALUES (NULL, 10,105345, "fernandoBrandao", "fernando.brandao@sptech.school", "12345");
    
INSERT INTO Vendas
	VALUES (NULL, 10, "bomboniere",5,500);
    
 INSERT INTO Atm (fkFilial, nome, maquina, sistemaOp) VALUES (10, "nomeMaquina" , "maquina", "sistema");
 select * from atm;
    
select * from empresa;
select * from filial;
select * from usuario;
select * from leitura;




