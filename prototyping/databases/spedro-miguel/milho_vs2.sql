create database milho;
use milho;
show tables;

create table cliente (
	idCliente int primary key auto_increment,
	nome varchar(45),
    email varchar(45) not null,
    senha varchar(45) not null,
    cpf char(14) unique not null,
    telefone char(13),
    cep char(9),
    logradouro varchar(45),
    numero varchar(45),
    complemento varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45)
);

create table armazem(
	idArmazem int primary key auto_increment,
    descricao varchar(300),
    cep char(9),
    logradouro varchar(45),
    numero varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45)
);

create table sensor(
	idSensor int primary key auto_increment,
    nomeSensor varchar(40),
    tipoSensor varchar(30),
    statusSensor varchar(40) not null
    constraint chkStatus check(statusSensor in ('ativado', 'desativado'))
);

create table registro(
	idRegistro int primary key auto_increment,
    lm35_temperatura decimal(5,2),
    dht11_umidade decimal(4,2),
    dataHoraReg datetime
);

show tables;
desc cliente;
desc armazem;
desc registro;

insert into cliente (nome, email, senha, cpf, telefone, cep, logradouro, numero, complemento, bairro, cidade, estado) values
('Soares', 'soares14@yahoo.com', 'senha1', '133.456.123-45', '11 35698-7456', '09469-341', 'Rua Antônio Nascimento', '3', 'Bloco 1 AP 54', 'Itaim Bibi', 'São Paulo', 'SP'),
('Gerson', 'gerson26@yahoo.com', 'senha2', '132.465.367-23', '71 98237-7466', '01287-045', 'Rua Canções Prelúdios', '4', null, 'Ondina', 'Salvador', 'BA'),
('Jonas', 'jonas10@yahoo.com', 'senha3', '183.534.235-74', '41 98140-6134', '06432-081', 'Rua Cachoeira Alta', '2', 'Bloco 3 AP 01', 'Neva', 'Cascavel', 'PR');

insert into armazem (descricao, cep, logradouro, numero, bairro, cidade, estado) values
('Armazem do tipo silo, tem grande capacidade de armazenamento, onde o milho será mantido por um longo período, onde será instalado os sensores para monitoramento de temperatura e umidade', '09469-341', 'Rua Antônio Nascimento', '3', 'Itaim Bibi', 'São Paulo', 'SP'),
('Armazem do tipo graneleiro, possui uma boa capacidade de armazenamento, onde o milho será mantido por um período intermediário, onde será instalado os sensores para monitoramento de temperatura e umidade', '01287-856', 'Rua Conceição Paulista', '15', 'Ondina', 'Salvador', 'BA'),
('Armazem do tipo ensacamento, ideal para pequenas quantidades de grãos, onde o milho será mantido por um curto período', '06432-081', 'Rua Cachoeira Alta', '2', 'Neva', 'Cascavel', 'PR');

insert into sensor (nomeSensor, Tiposensor, statusSensor) values
('lm35', 'Sensor de temperatura', 'ativado'),
('dht11', 'Sensor de umidade', 'desativado');

insert into registro (lm35_temperatura, dht11_umidade, dataHoraReg) values
(14.40, 12.30, '2024-03-22 10:38:50'),
(13.34, 13.09, '2024-03-22 10:39:56'),
(14.60, 13.55, '2024-03-22 10:40:34');

select * from cliente;
select * from armazem;
select * from registro;
select * from sensor;

select * from cliente where nome like '%s';
select * from armazem where descricao like '%silo%';
select * from registro where dataHoraReg like '%3_';
select * from sensor where tipoSensor like '_e%';

update cliente set complemento = 'Bloco 5 AP 21' where idCliente = 2;
select complemento from cliente where idCliente = 2;

update armazem set numero = '22' where idArmazem = 3;
select numero from armazem where idArmazem = 3;

update sensor set statusSensor = 'ativado' where idSensor = 2;
select statusSensor from sensor where idSensor = 2;

update registro set lm35_temperatura = 11.76 where idRegistro = 1;
select lm35_temperatura from registro where idRegistro = 1;

alter table cliente modify column estado char(2);
desc cliente;

alter table armazem add column tipo varchar(30);
desc armazem;
alter table armazem drop column tipo;

alter table sensor add column qtdSensor int;
desc sensor;
alter table sensor drop column qtdSensor;

alter table registro rename column dataHoraReg to dataHora;
desc registro;

insert into cliente (nome, email, senha, cpf) values
('Fabio', 'fabio098@yahoo.com', 'senha4', '845624343-67');
select * from cliente;

delete from cliente where idCliente = 4;
select * from cliente;

truncate table cliente;
select * from cliente;
drop table cliente;

truncate table armazem;
select * from armazem;
drop table armazem;

truncate table sensor;
select * from sensor;
drop table sensor;

truncate registro;
select * from registro;
drop table registro;

show tables;