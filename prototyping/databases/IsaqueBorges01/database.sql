create database projeto;
use projeto;

create table cliente(
idcliente int primary key auto_increment,
nome varchar(70) not null,
email varchar(70) not null,
senha varchar(50) not null,
cep char(9) not null,
estado varchar(30),
cidade varchar(30),
endereco varchar (70)not null,
numero varchar(20) not null,
complemento varchar(30),
cpf char(11) not null
); 

desc cliente;

create table sensores (
idsensor int primary key auto_increment,
tipoSensor varchar(50),
lm35_temperatura decimal(5,2),
dht11_umidade decimal(4,2),
datahora datetime
);

alter table sensores
 add constraint chksensor check(tipoSensor in ('lm35_temperatura', 'dht11_umidade'));
 
desc sensores;

create table local(
idlocal int primary key auto_increment,
nome_local varchar(50),
endereco varchar(70),
complemento varchar (70),
capacidadeMaxima int,
temperaturaIdeal decimal (5,2),
umidadeIdeal decimal (5,2)
);

desc local;

insert into cliente values
(default, 'Jorge César', 'jorge@gmail.com','1010','09080501','SP','São Paulo',
'avenida juarez',1500,'torre 4','23454334500'),
(default, 'Marcos Paulo','marcos@gmail.com','marcos2024','12540401','SP','São Paulo',
'rua dos lobos',23,'apartamento 76','54323489000');

select * from cliente;

insert into sensores values 
(default,'lm35_temperatura', 14.11, 13.33, '2024-03-18 11:00:04'),
(default, 'dht11_umidade',13.29, 11.57, '2024-03-18 12:30:41'); 

select * from sensores;

insert into local values 
(default, 'armazem Primos','rua anjo de paulo', 1501,'10000',13,12),
(default, 'armazem do José','rua hadock ovelha','2034', '30000', 12,13);

select * from local;