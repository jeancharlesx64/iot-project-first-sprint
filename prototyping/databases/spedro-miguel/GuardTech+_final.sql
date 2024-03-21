create database GuardTech; -- criando banco de dados GuardTech
use GuardTech; -- acessando banco de dados GuardTech

create table cliente ( -- criando tabela cliente
	idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(60) unique not null, -- email único e não pode ser nulo
    senha varchar(20) not null, -- senha não pode ser nula
    cpf char(14) unique not null, -- cpf único e não pode ser nulo
    telefone char(13),
    cep char(9),
    logradouro varchar(45),
    numero varchar(15),
    complemento varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45)
);

create table armazem( -- criando tabela armazem
	idArmazem int primary key auto_increment,
    tipo varchar(45),
    capacidade varchar(45), -- capacidade máxima de armazenamento
    descricao varchar(300), -- descrição detalhada sobre o tipo de armazem e suas vantagens
    cep char(9),
    logradouro varchar(45),
    numero varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45)
);

create table sensor( -- criando tabela sensor
	idSensor int primary key auto_increment,
    nomeSensor varchar(40),
    tipoSensor varchar(30), -- tipo do sensor, umidade ou temperatura
    statusSensor varchar(40) not null, -- se o sensor está ativado ou desativado
    constraint chkNomeSensor check(nomeSensor in ('lm35', 'dht11')), -- restrição para checar se o nome é lm35 ou dht11
    constraint chkStatus check(statusSensor in ('ativado', 'desativado')) -- restrição para checar se está ativado ou desativado
);

create table registro( -- criando tabela registro
	idRegistro int primary key auto_increment,
    lm35_temperatura decimal(5,2), -- valor capturado do sensor de temperatura
    dht11_umidade decimal(4,2), -- valor capturado do sensor de umidade
    dataHoraReg datetime -- hora em que o dado foi capturado
);

show tables; -- exibir todas as tabelas
desc cliente; -- descrever tabela cliente
desc armazem; -- descrever tabela armazem
desc registro; -- descrever tabela registro

insert into cliente (nome, email, senha, cpf, telefone, cep, logradouro, numero, complemento, bairro, cidade, estado) values -- inserindo valor na tabela cliente
('Soares', 'soares14@yahoo.com', 'senha1', '133.456.123-45', '11 35698-7456', '09469-341', 'Rua Antônio Nascimento', '3', 'Bloco 1 AP 54', 'Itaim Bibi', 'São Paulo', 'SP'),
('Gerson', 'gerson26@yahoo.com', 'senha2', '132.465.367-23', '71 98237-7466', '01287-045', 'Rua Canções Prelúdios', '4', null, 'Ondina', 'Salvador', 'BA'),
('Jonas', 'jonas10@yahoo.com', 'senha3', '183.534.235-74', '41 98140-6134', '06432-081', 'Rua Cachoeira Alta', '2', 'Bloco 3 AP 01', 'Neva', 'Cascavel', 'PR');

insert into armazem (tipo, capacidade, descricao, cep, logradouro, numero, bairro, cidade, estado) values -- inserindo dados na tabela armazem
('Silo', '10 mil toneladas', 'Armazem do tipo silo, tem grande capacidade de armazenamento, onde o milho será mantido por um longo período, onde será instalado os sensores para monitoramento de temperatura e umidade', '09469-341', 'Rua Antônio Nascimento', '3', 'Itaim Bibi', 'São Paulo', 'SP'),
('Graneleiro', '3 mil toneladas', 'Armazem do tipo graneleiro, possui uma boa capacidade de armazenamento, onde o milho será mantido por um período intermediário, onde será instalado os sensores para monitoramento de temperatura e umidade', '01287-856', 'Rua Conceição Paulista', '15', 'Ondina', 'Salvador', 'BA'),
('Ensacamento', '900 toneladas', 'Armazem do tipo ensacamento, ideal para pequenas quantidades de grãos, onde o milho será mantido por um curto período', '06432-081', 'Rua Cachoeira Alta', '2', 'Neva', 'Cascavel', 'PR');

insert into sensor (nomeSensor, Tiposensor, statusSensor) values -- inserindo dados na tabela sensor
('lm35', 'Sensor de temperatura', 'ativado'),
('dht11', 'Sensor de umidade', 'desativado');

insert into registro (lm35_temperatura, dht11_umidade, dataHoraReg) values -- inserindo dados na tabela registro
(14.40, 12.30, '2024-03-22 10:38:50'),
(13.34, 13.09, '2024-03-22 10:39:56'),
(14.60, 13.55, '2024-03-22 10:40:34');

select * from cliente; -- exibir todos os dados da tabela cliente
select * from armazem; -- exibir todos os dados da tabela armazem
select * from registro; -- exibir todos os dados da tabela registro
select * from sensor; -- exibir todos os dados da tabela sensor

select * from cliente where nome like '%s'; -- exibir os dados da tabela cliente onde a última letra do nome é 's'
select * from armazem where descricao like '%silo%'; -- exibir os dados da tabela armazem onde tem a palavra 'silo' na descrição
select * from registro where dataHoraReg like '%3_'; -- exibir os dados da tabela registro onde o penúltimo número é 3 da dataHoraReg
select * from sensor where tipoSensor like '_e%'; -- exibir os dados da tabela sensor onde a segunda letra é 'e' do tipoSensor

update cliente set complemento = 'Bloco 5 AP 21' where idCliente = 2; -- atualizando o complemento do cliente com idCliente 2
select complemento from cliente where idCliente = 2; -- exibindo o complemento do cliente com idCliente 2

alter table cliente modify column estado char(2); -- alterando a tabela cliente, modificando a coluna estado para char(2)
desc cliente;

delete from registro where idRegistro = 3; -- deletando os dados da tabela registro onde o idRegistro é 3
select * from registro;