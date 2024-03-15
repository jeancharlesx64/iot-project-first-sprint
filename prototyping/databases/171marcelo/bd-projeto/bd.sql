create database bdsprint1;
use bdsprint1;

create table usuario (
idusuario int primary key auto_increment,
nome varchar(100)not null,
email varchar(100)not null,
cpf varchar(15),
telefone varchar(13)not null);
desc usuario;

insert into usuario values
(default,'francisco','francisquinho@gmail.com','317027925-52','11925175027'),
(default,'rose','rosarose@gmail.com','179204618-34','11927450143'),
(default,'fernanda','caramico@gmail.com','762014856-77','11965748329');

select * from usuario;

drop table usuario;

create table armazem (
idarmazem int primary key auto_increment,
cep varchar(20) not null,
lograd varchar(100)not null,
bairro varchar(100)not null,
cidd varchar(100)not null);

desc armazem;

insert into armazem values
(default,'19999-999','mei do mato','chitaozinho','sao paulo'),
(default,'23799-999','rj agro','sapucai','rio de janeiro');

select * from armazem;

drop table armazem;

create table sensor (
idsensor int primary key auto_increment,
nome varchar(50),
temperatura decimal(7,2),
umidade decimal(7,2),
dtferificacao datetime);

desc sensor;

insert into sensor values
(default,'DHT11','20.13','13.13','2024-01-12 10:10:10');

insert into sensor values
(default,'DHT11','23.20','15.10','2024-03-10 15:12:58');

SELECT * FROM sensor;

select nome as'sensor'from sensor;

select temperatura as'calorzinho',umidade as'molhadinho'from sensor;