create database GuardTech;

use GuardTech;

create table login (
idLogin int primary key auto_increment,
email varchar(50) not null,
senha varchar(50) not null
);

desc login;

insert into login values
	(default, 'formilho@gmail.com', 'cural345'),
    (default, 'productormilho@gmail.com', 'pamonha910'),
    (default, 'milharal@gmail.com', 'fuba138'),
    (default, 'agromilho@gmail.com','mio157');
    
select * from login;

select senha from login 
	where senha like 'fuba138'; -- exibir apenas o campo senha onde senha é igual a 'fuba138'
    
select * from login
	where email like 'f%';  -- exibir todos os dados onde email começa com 'f' 
    
select * from login 
	where senha like '%1_'; -- exibir todos os dados onde senha tenha a penúltima caracter igual a '1'
    
update login set senha = 'milho456' -- atualizar o dado do campo senha para 'milho456' onde o id é igual a 4
	where idLogin = 4;

select * from login; -- exibir tabela

alter table login modify column senha varchar(20); -- modificando a coluna senha para ser permitido inserir até 20 caracteres

describe login; -- exibir descrição da tabela para verificar se atualizou o campo senha


create table cadastro(
idCadastro int primary key auto_increment,
nomeEmpresa varchar(40) not null,
cnpj char(14) not null,
cep char(9) not null,
telefone char(11) not null,
email varchar(40) not null,
representanteLegal varchar(40) not null,
contadorLegal varchar(40) not null,
PorteEmpresa varchar(40) not null
);


desc cadastro;

insert into cadastro values
(default, 'formilho', '56973451924965', '01245-976', '11945368935', 'formilho@gmail.com', 'Kaique Sotero Tozim', 'Igor Santos Bruno', 'Grande'),
(default, 'productormilho', '14373461925965', '08965-895', '11976964532', 'productormilho@gmail.com', 'Isaque Borges', 'Marcelo alves', 'pequeno'),
(default, 'milharal', '87674353027924', '13489-452', '11934635849', 'milharal@gmail.com', 'Pedro Miguel', 'Jean Charles', 'medio'),
(default, 'agromilho', '93457510445265', '48954-445', '11982455897', 'agromilho@gmail.com', 'Isabelly', 'Anthony', 'Grande');



 



