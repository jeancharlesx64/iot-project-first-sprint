USE sprint;
CREATE TABLE cliente (
idEmpresa int PRIMARY KEY AUTO_INCREMENT,
nome varchar(50),
cnpj varchar(20),
email varchar(100),
estado varchar(50),
cidade varchar(100),
bairro varchar(100),
cep varchar(20),
rua varchar(50),
qntHec decimal(10,3));

INSERT INTO cliente VALUES
(DEFAULT, 'AGROSUL', '40512337000100', 'gerencia.servicos@agrosuljd.com.br', 'São Paulo', 'São Paulo', 'Vila Matilde', '11703210', 'Rua Juréia', '2.500'),
(DEFAULT, 'AGROTOP', '40512337000122', 'agos@agrotop.com.br', 'São Paulo', 'São Paulo', 'Vila Mariana', '1170310', 'Rua Salvador', '1.500'),
(DEFAULT, 'Agrobras', '12345678901234', 'contato@agrobras.com.br', 'São Paulo', 'São Paulo', 'Campo Limpo', '05871010', 'Av. Interlagos', '3000.000'),
(DEFAULT, 'Agricultura RJ', '98765432109876', 'contato@agriculturarj.com.br', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', '22050010', 'Av. Atlântica', '1800.000'),
(DEFAULT, 'Agrocampo', '45612378904567', 'contato@agrocampo.com.br', 'São Paulo', 'São Paulo', 'Moema', '04071020', 'Rua Normandia', '2200.000'),
(DEFAULT, 'Agroverde', '78965412309876', 'contato@agroverde.com.br', 'Rio de Janeiro', 'Rio de Janeiro', 'Botafogo', '22250040', 'Rua Voluntários da Pátria', '1400.000');

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
codigo varchar(70),
tipo varchar(5),
dtAluguel date,
empresa varchar(50));

ALTER TABLE sensor ADD COLUMN temperaturaLM35 DECIMAL (5,0);
ALTER TABLE sensor ADD COLUMN temperaturDHT11 DECIMAL (5,0);


INSERT INTO sensor VALUES
(DEFAULT,'ABC123', 'LM35', '2024-03-14', 'AGROSUL'),
(DEFAULT,'DEF456', 'DHT11', '2024-03-14', 'AGROSUL'),
(DEFAULT,'GHI789', 'LM35', '2024-03-20','AGROTOP'),
(DEFAULT,'JKL012', 'DHT11', '2024-03-20', 'AGROTOP'),
(DEFAULT,'MNO345', 'LM35', '2024-03-25', 'Agrobras'),
(DEFAULT,'PQR678', 'DHT11', '2024-03-25', 'Agrobras'),
(DEFAULT,'STU901', 'LM35', '2024-03-28', 'Agricultura'),
(DEFAULT,'VWX234', 'DHT11', '2024-03-28', 'Agricultura'),
(DEFAULT,'YZA567', 'LM35', '2024-04-01', 'Agrocampo'),
(DEFAULT,'MNO345', 'DHT11', '2024-04-01', 'Agrocampo');

ALTER TABLE sensor
ADD CONSTRAINT chksensor CHECK(tipo IN('LM35','DHT11'));

SELECT * FROM sensor;
SELECT * FROM cliente;
SELECT * FROM sensor WHERE empresa = 'AGROSUL';
SELECT * FROM cliente WHERE estado = 'São Paulo' ORDER BY nome;
SELECT * FROM cliente WHERE qntHec > 2000;
SELECT * FROM cliente WHERE nome LIKE 'Agro%';
SELECT * FROM sensor WHERE codigo LIKE '%456%';
SELECT * FROM sensor WHERE dtAluguel LIKE '2024-03%';

INSERT INTO cliente VALUES 
(DEFAULT,'Nova Empresa', '12345678901234', 'contato@novaempresa.com.br', 'São Paulo', 'São Paulo', 'Novo Bairro', '12345678', 'Rua Nova', 1500.000);
INSERT INTO sensor VALUES (DEFAULT,'XYZ123', 'LM35', '2024-04-10', 'NovaEmpresa');
