USE sprint;

CREATE TABLE Empresa ( -- Empresas que já fecharam contrato.
idEmpresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR (50) NOT NULL,
cnpj VARCHAR (20) NOT NULL,
email VARCHAR (100) NOT NULL,
estado VARCHAR (50) NOT NULL,
cidade VARCHAR (100) NOT NULL,
bairro VARCHAR (100) NOT NULL,
cep VARCHAR (20) NOT NULL,
rua VARCHAR (50) NOT NULL);

INSERT INTO Empresa (nome, cnpj, email, estado, cidade, bairro, cep, rua) VALUES
('AGROSUL', '40512337000100', 'gerencia.servicos@agrosuljd.com.br', 'São Paulo', 'São Paulo', 'Vila Matilde', '11703210', 'Rua Juréia'),
('AGROTOP', '40512337000122', 'agos@agrotop.com.br', 'São Paulo', 'São Paulo', 'Vila Mariana', '1170310', 'Rua Salvador'),
('Agrobras', '12345678901234', 'contato@agrobras.com.br', 'São Paulo', 'São Paulo', 'Campo Limpo', '05871010', 'Av. Interlagos'),
('Agricultura RJ', '98765432109876', 'contato@agriculturarj.com.br', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', '22050010', 'Av. Atlântica'),
('Agrocampo', '45612378904567', 'contato@agrocampo.com.br', 'São Paulo', 'São Paulo', 'Moema', '04071020', 'Rua Normandia'),
('Agroverde', '78965412309876', 'contato@agroverde.com.br', 'Rio de Janeiro', 'Rio de Janeiro', 'Botafogo', '22250040', 'Rua Voluntários da Pátria');

INSERT INTO Empresa (nome, cnpj, email, estado, cidade, bairro, cep, rua) VALUES
('Nova Empresa', '12345678901234', 'contato@novaempresa.com.br', 'São Paulo', 'São Paulo', 'Novo Bairro', '12345678', 'Rua Nova');

CREATE TABLE Sensor ( -- Informações sobre o sensor.
idSensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo VARCHAR (6) NOT NULL, -- Identificação do sensor.
tipo VARCHAR (5) NOT NULL, -- Temperatura ou umidade.
dtAluguel DATE NOT NULL, -- Data em que foi alugado por tal empresa.
empresa VARCHAR (50) NOT NULL); -- Nome da empresa que alugou.

INSERT INTO Sensor (codigo, tipo, dtAluguel, empresa) VALUES
('ABC123', 'LM35', '2024-03-14', 'AGROSUL'),
('DEF456', 'DHT11', '2024-03-14', 'AGROSUL'),
('GHI789', 'LM35', '2024-03-20','AGROTOP'),
('JKL012', 'DHT11', '2024-03-20', 'AGROTOP'),
('MNO345', 'LM35', '2024-03-25', 'Agrobras'),
('PQR678', 'DHT11', '2024-03-25', 'Agrobras'),
('STU901', 'LM35', '2024-03-28', 'Agricultura'),
('VWX234', 'DHT11', '2024-03-28', 'Agricultura'),
('YZA567', 'LM35', '2024-04-01', 'Agrocampo'),
('MNO345', 'DHT11', '2024-04-01', 'Agrocampo');

INSERT INTO Sensor (codigo, tipo, dtAluguel, empresa) VALUES
('XYZ123', 'LM35', '2024-04-10', 'NovaEmpresa');

ALTER TABLE Sensor ADD CONSTRAINT chksensor CHECK(tipo IN('LM35','DHT11'));

CREATE TABLE Armazém ( -- Local de armazenamento de milho de tal empresa.
idArmazem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
empresa  VARCHAR (50) NOT NULL, 
capacidade VARCHAR (50) NOT NULL, -- Capacidade máxima em KG de armazenamento de milho.
cep VARCHAR (20) NOT NULL);

INSERT INTO Armazém (empresa, capacidade, cep) VALUES 
('AGROSUL','5.000','11703210'),
('AGROTOP','6.000','1170310');

SELECT * FROM Sensor;
SELECT * FROM Empresa;
SELECT * FROM Sensor WHERE empresa = 'AGROSUL';
SELECT * FROM Empresa WHERE estado = 'São Paulo' ORDER BY nome;
SELECT * FROM Empresa WHERE estado = 'São Paulo' ORDER BY email DESC;
SELECT * FROM Empresa WHERE nome LIKE 'Agro%';
SELECT * FROM Sensor WHERE codigo LIKE '%456%';
SELECT * FROM Sensor WHERE dtAluguel LIKE '2024-03%';
SHOW TABLES;
DESC Empresa;
DESC Sensor;
DESC Armazém;


UPDATE Empresa SET estado ="São Paulo" WHERE idEmpresa = 4;
UPDATE Sensor SET tipo = "LM35" WHERE idSensor = 4;

DELETE FROM Empresa WHERE idEmpresa = 7;
DELETE FROM Sensor WHERE idSensor = 4;
DROP TABLE Empresa;
DROP TABLE Sensor;
DROP TABLE Armazém;
