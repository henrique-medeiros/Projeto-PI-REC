create database Atleta;
use Atleta;
create table Atleta (
idAtleta int primary key,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);
insert into atleta values (210248, 'Isaquias Queiroz', 'Canoagem', 4);
insert into atleta values (210203,'César Cielo', 'Natação', 3);
insert into atleta values (210215, 'Mayra Aguiar', 'Judô', 3);
insert into atleta values (210228, 'Robert Scheidt', 'Vela', 5);
insert into atleta values (210274, 'Gustavo Borges', 'Natação', 4);
insert into atleta values (210231, 'Marcelo Ferreira', 'Vela', 3);
insert into atleta values (210265, 'Torben Grael', 'Vela', 5);
insert into atleta values (210202, 'Jaqueline Carvalho', 'Vôlei', 2);
insert into atleta values (210259, 'Sheilla Castro', 'Vôlei', 2);
select * from Atleta;
select nome, qtdMedalha from Atleta;
select modalidade, nome from Atleta;
select idAtleta, nome, modalidade, qtdMedalha from Atleta where modalidade in ('Canoagem');
select idAtleta, nome, modalidade, qtdMedalha from Atleta where modalidade in ('Natação');
select idAtleta, nome, modalidade, qtdMedalha from Atleta where modalidade in ('Judô');
select idAtleta, nome, modalidade, qtdMedalha from Atleta where modalidade in ('Vela');
select idAtleta, nome, modalidade, qtdMedalha from Atleta where modalidade in ('Vôlei');
select idAtleta, nome, modalidade from Atleta where qtdMedalha in (3,5); 
select nome from Atleta where idAtleta < 210231;
select nome from Atleta where modalidade in ('Canoagem');
select nome from Atleta where modalidade in ('Natação');
select nome from Atleta where modalidade in ('Judô');
select nome from Atleta where modalidade in ('Vela');
select nome from Atleta where modalidade in ('Vôlei');
select idAtleta, nome, modalidade, qtdMedalha from Atleta where idAtleta not in (210202, 210203, 210215, 210228);

