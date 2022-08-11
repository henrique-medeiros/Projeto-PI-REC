
-- Erika Mendes Rocha RA:03221023 data:21/03/2022 --

create database dados;
use dados;
create table Revista (idRevista int auto_increment primary key,
					  nome varchar(40),
                      categoria varchar(30));

-- Inserir 4 registros na tabela, mas sem informar a categoria.
insert into Revista (idRevista, nome) values (null, 'National Geographic'),
											 (null, 'Superinteressante'),
                                             (null, 'Quatro Rodas'),
                                             (null, 'Vogue');
                                             
-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'Ciencia' where idRevista = 1;
update Revista set categoria = 'Ciencia' where idRevista = 2;
update Revista set categoria = 'Automoveis' where idRevista = 3;
update Revista set categoria = 'Moda' where idRevista = 4;

-- Insira mais 3 registros completos.
insert into Revista values (null, 'Veja', 'Cultura'),
						   (null, 'Elle', 'Moda'),
						   (null, 'Capricho', 'Cultura');
                           
-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria.
desc Revista;

-- Renomeie a coluna nome para nomeRevista.
alter table Revista rename column nome to nomeRevista;

-- Exibir novamente os dados da tabela, para verificar se alterou o nome da coluna.
select * from Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15). Periodicidade é a informação se a revista é semanal, mensal, quinzenal, etc.
alter table Revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Atualize a tabela, preenchendo os valores da coluna periodicidade. Exiba novamente os dados da tabela.
update Revista set periodicidade = 'semanal' where idRevista <=7;
update Revista set periodicidade = 'quinzenal' where idRevista <= 2;

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Insira os dados de uma nova revista, com todos os seus dados. Exiba novamente os dados da tabela.
insert into Revista values (null,'Atrevida', 'Cultura', 'semanal');

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela. Exibir novamente os dados da tabela.
alter table Revista drop column periodicidade;

-- Exibir novamente os dados da tabela.
select * from Revista;

-- Criar a tabela Editora, nesse mesmo banco de dados, com os campos: idEditora (int e chave primária), nomeEditora (varchar, tamanho 40), dataFund (tipo date – representa a data da fundação da editora – podem inventar). idEditora terá o valor inicial 1000 e será incrementado automaticamente pelo sistema)
create table Editora (idEditora int primary key,
					  nomeEditora varchar (40),
                      dataFund date) auto_increment = 1000;

-- Inserir dados na tabela Editora.
insert into Editora (nomeEditora, dataFund) values ('Europa', '1965-03-14'),
						                           ('Escala', '1960-08-3'),
							                       ('Catarse', '1990-05-16'),
												   ('Daemon', '1973-04-27');
                                                   
select * from Editora;




                      

 
 
                                             
                      