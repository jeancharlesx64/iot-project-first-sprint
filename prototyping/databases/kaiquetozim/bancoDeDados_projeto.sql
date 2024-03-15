create database GuardTech;

use GuardTech;
    
create table cadastro(
idCadastro int primary key auto_increment,
nomeEmpresa varchar(40) not null,
cnpj char(14) not null,
cep char(9) not null,
telefone char(11) not null,
email varchar(40) not null,
senha varchar(50) not null,
representanteLegal varchar(40) not null,
cpfRepresentante char(11),
contadorLegal varchar(40) not null,
PorteEmpresa varchar(40) not null
);


desc cadastro;

insert into cadastro values
(default, 'formilho', '56973451924965', '01245-976', '11945368935', 'formilho@gmail.com','cural345', 'Kaique Sotero Tozim', '53908736889', 'Igor Santos Bruno', 'Grande'),
(default, 'productormilho', '14373461925965', '08965-895', '11976964532', 'productormilho@gmail.com','pamonha910', 'Isaque Borges', '43567386802', 'Marcelo alves', 'pequeno'),
(default, 'milharal', '87674353027924', '13489-452', '11934635849', 'milharal@gmail.com','fuba138', 'Pedro Miguel','24934684823', 'Jean Charles', 'medio'),
(default, 'agromilho', '93457510445265', '48954-445', '11982455897', 'agromilho@gmail.com','mio157', 'Isabelly', '43958962821', 'Anthony', 'Grande');


create table sensor(
idSensor int primary key auto_increment,
tipo varchar(20),
UnidMedida varchar(20),
condiçãoAmbiental varchar(30),
saída varchar(20),
conectividade varchar(20),
custo varchar(20),
marca varchar(20),
dtFabricação date,
numero int);

create table Armazém(
idArmazem int primary key auto_increment,
cep char(9),
locadouro varchar(40),
telefone varchar(20),
temperatura varchar(10));













-- faixaDeTemperatura varchar(20),
-- precisão varchar(20),
--  resolução varchar(20),
 



 



