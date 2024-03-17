create database GuardTech;

use GuardTech;
    
    -- Tabela cadastro, para obter os dados tanto da empresa, quanto do representante legal
create table cadastro(
idCadastro int primary key auto_increment,
email varchar(40) not null, -- email da mempresa
senha varchar(50) not null,
nomeEmpresa varchar(40) not null,
cnpj char(14) not null, 
cepEmpresa char(9) not null, -- cep da empresa
estado varchar(40) not null,
cidade varchar(40) not null,
logradouro varchar(50) not null,
numero int not null,
telefoneEmpresa char(11) not null,
representanteLegal varchar(40) not null,
cpfRepresentante char(11),
contadorLegal varchar(40) not null,
PorteEmpresa varchar(40) not null, -- Porte da empresa, se é uma empresa de porte pequena, media ou grande
constraint chckPorteEmpresa check(PorteEmpresa in('Grande', 'Pequena', 'Media'))
);


	-- tabela do sensor para conter informações do sensor  
create table sensor(
idSensor int primary key auto_increment,
tipoSensor varchar(20), -- se o tipo dos sensor é de temperatura ou umidade
NomeSensor varchar(20), -- para informar o nome do sensor podendo ser somente dht11 ou lm35 por conta da constraint
StatusSensor varchar(30), -- se o sensor estará somente desligado ou ligado  
temperatura decimal (5,2), -- qual será a temperatura identificada pelo sensor
umidade decimal (4,2), -- qual será a temperatura identificada pelo sensor
dataHora datetime,
constraint chkNomeSensor check(nomeSensor in('dht11', 'lm35')),
constraint chckTipo check(tipoSensor in('umidade', 'temperatura')),
constraint chckStatusSensor check(StatusSensor in('desconectado', 'conectado'))
);


	-- tabela Armazem pra conter informações do armazém de milho 
create table Armazem (
idArmazém int primary key auto_increment,
tipo varchar(50), -- se o armazém do tipo silo, granel, silobags dentre outros
identificacao int, -- Para identificar qual é o armazéns 
dimensao int -- tamanho do armazém em metros cubicos
);


    -- INSERINDO DADOS NA TABELA CADASTRO SEM COLOCAR O DEFAULT, PORQUE O ID JÁ POSSUI AUTO_INCREMENT
insert into cadastro(email, senha, nomeEmpresa, cnpj, cepEmpresa, estado, cidade, logradouro, numero, telefoneEmpresa, representanteLegal, cpfRepresentante, contadorLegal, PorteEmpresa) values
('formilho@gmail.com','cural345', 'formilho', '56973451924965', '01245-976', 'Mato Grosso', 'Juína','rua organof', 864, '11945368935', 'Kaique Sotero Tozim', '53908736889', 'Igor Santos Bruno', 'Grande'),
('productormilho@gmail.com','pamonha910','productormilho', '14373461925965', '08965-895','Goiás', 'Aporé', 'rua moroa', 596, '11976964532', 'Isaque Borges', '43567386802', 'Marcelo alves', 'Pequena'),
('milharal@gmail.com','fuba138','milharal', '87674353027924', '13489-452','Minas Gerais', 'Juíz de fora','vila almorada', 911, '11934635849', 'Pedro Miguel','24934684823', 'Jean Charles', 'Media'),
('agromilho@gmail.com','mio157', 'agromilho', '93457510445265', '48954-445', 'Paraná', 'Toledo', 'rua marsim', 1024, '11982455897', 'Isabelly', '43958962821', 'Anthony', 'Grande');

   -- INSERINDO DADOS NA TABELA SENSOR
insert into sensor values 
( default,'temperatura', 'lm35', 'conectado', 18.55, null, '2024-03-18 09:59:00'),
( default,'temperatura', 'lm35', 'desconectado', null, null, null),
(default, 'umidade', 'dht11', 'conectado', null,'17.10', '2024-03-18 08:45:02'),
( default,'umidade', 'dht11', 'desconectado', null, null, null);

    -- INSERINDO DADOS NA TABELA ARMAZÉM
insert into Armazem values
(default, 'silo', 1, 11000),
(default, 'silo', 2, 9000),
(default, 'silo', 3, 10500),
(default, 'silo', 4, 9000);


-- EXECUTANDO SELECT DA TABELA CADASTRO 

describe cadastro; -- descrever tabela cadastro

select * from cadastro; -- exibir todos os dados da tabela cadastro

select representanteLegal, cpfRepresentante, contadorLegal from cadastro; -- exibir apenas os dados do campo repesentanteLegal, cpfRepresentante, contadorLegal

select * from cadastro -- exibir todos os dados da tabela onde o idCadastro é igual a 1
	where idCadastro = 1;
    
select email, senha, cnpj, telefoneEmpresa from cadastro -- exibir apenas email, senha, cnpj, telefoneEmpresa onde o cnpj termina com a caracter 4
	where cnpj like '%4';
    
select * from cadastro  -- exibir todos os dados onde nomeEmpresa começa com m
	where nomeEmpresa like 'm%';
    
select * from cadastro 
	where PorteEmpresa like '_r%'; -- exibir tudo onde PorteEmpresa tem como segundo letra, a letra "r"
    
select * from cadastro
	where nomeEmpresa like '%h_'; -- exibir tudo onde a penúltima letra do nomeEmpresa é "h"  
    
select nomeEmpresa, representanteLegal, porteEmpresa from cadastro -- exibir o nomeEmpresa, represetanteLegal, porteEmpresa onde porteEmpresa é pequena e grande 
	where porteEmpresa  in('pequena', 'grande');
    
select estado, cidade, logradouro, numero from cadastro order by estado; -- exibir apenas o estado, cidade, logradouro, numero pela ordem crescente do estado

select * from cadastro order by idCadastro desc; -- exibir tudo pela ordem decrescente do id



-- ATUALIZANDO E EXCLUINDO DADOS DA TABELA SENSOR

describe sensor;

select * from sensor; -- exibir tabela sensor

 update sensor set temperatura = 19.50	 -- atualizar na tabela sensor a temperatura para 19.50 onde o id é igual 1 
	where idSensor = 1;
    
update sensor set statusSensor = 'desconectado',  umidade = null, datahora = null -- atualizar na tabela sensor o statusSensor para desconectado, a umidade para null, e dataHora para null onde o id é igual a 3
	where idSensor = 3;
    
update sensor set statusSensor = 'conectado', umidade = 16.00, dataHora = '2024-03-18 09:59:59'	-- atualizar na tabela sensor o statusSensor para desconectado, a umidade para 16.00 e a dataHora para '2024-03-18 09:59:59' onde o id é igual a 3 e 4
	where idSensor in(3, 4);
    
delete from sensor where idSensor = 3; -- excluir toda a tupla da tabela sensor onde o idSensor é igual a 3
	
-- ALTERANDO CAMPOS DA TABELA ARMAZÉM
describe armazem; -- descreve tabela armazem

select * from armazem; -- exibir todos os dados da tabela armazem

alter table armazem modify column tipo varchar(30);	 -- alterar tabela armazem modificando a coluna tipo para varchar (30)

alter table armazem rename column dimensao to capacidade ; 	-- alterar tabela armazem renomeando a coluna dimensao para capacidade

alter table armazem drop column identificacao;	 -- alterar tabela armazem excluindo a coluna identificação

truncate table armazem;	-- lipamdo os dados da tabela armazem

drop table cadastro; -- exluir tabela cadastro 
drop table sensor; 	-- exluir tabela sensor
drop table armazem; -- exluir tabela armazem






