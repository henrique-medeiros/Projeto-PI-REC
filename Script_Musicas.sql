create database Musica;
use Musica;
create table Musica (
idMusica int primary key, 
título varchar (40),
artista varchar (40),
gênero varchar (40)
);
insert into Musica values (001, 'Toda Menina Baiana', 'Gilberto Gil', 'MPB');
insert into Musica values (002, 'Dê um Rolê', 'Novos Baianos', 'MPB');
insert into Musica values (003, 'Preciso Me Encontrar', 'Cartola', 'Samba');
insert into Musica values (004, 'Pela Luz dos Olhos Teus', 'Tom Jobim e Miúcha', 'MPB');
insert into Musica values (005, 'Baila Comigo', 'Rita Lee', 'Rock Nacional');
insert into Musica values (006, 'Chove Chuva', 'Jorge Ben Jor', 'Samba');
insert into Musica values (007, 'Panis Et Circenses', 'Os Mutantes', 'Rock Nacional');
insert into Musica values (008, 'Mas, que nada!', 'Jorge Ben Jor', 'Samba');
select * from Musica;
select título, artista from Musica;
select gênero, artista from Musica;
select idMusica, título, artista from Musica where gênero in ('MPB');
select idMusica, título, artista from Musica where gênero in ('Samba');
select idMusica, título, artista from Musica where gênero in ('Rock Nacional');
select idMusica, título, gênero from Musica where artista in ('Jorge Ben Jor');
select título from Musica where gênero in ('MPB');
select título from Musica where gênero in ('Samba');
select título from Musica where gênero in ('Rock Nacional');
select título, gênero from Musica where artista in ('Jorge Ben Jor');
select título, artista, gênero from Musica where idMusica in (004,005,006,007,008);
select idMusica, título, artista, gênero from Musica where idMusica <=006;
select idMusica, título, artista, gênero from Musica where idMusica >005;




