-- =================================================== --
-- =                 *CREATE TABLES*                 = --
-- =================================================== --
-- =  Dados referente a GuardTech -> Cliente|Empresa = --
-- =================================================== --

CREATE DATABASE guardtech; -- criando o banco geral
USE guardtech; -- usando o banco geral

-- possivel cliente, lead capturado pela tela de contato (site corporativo)
CREATE TABLE tbLead(
	idLead INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    nameLead VARCHAR(45),
    emailLead VARCHAR(50) NOT NULL UNIQUE, 
    phoneNumberLead CHAR(11) NOT NULL,
    descriptionMessageLead VARCHAR(500),
    dateContact DATE -- registrando a data do contato feito pelo lead
);

-- empresa, para que a guardtech tenha como entrar em contato e ter segurança da exitência do tal
CREATE TABLE tbCompany( 
	idCompany INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    commercialNameCompany VARCHAR(60), -- nome comercial exemplo "Coca Cola"
    corporateNameCompany VARCHAR(60),  -- nome corporativo exemplo "Coca Cola Indústrias Ltda Brazil"
    cnpjCompany CHAR(14), -- CNPJ
    sizeCompany VARCHAR(12), -- microempresa, pequena, média, grande porte
    zipcodeComapny CHAR(8), -- CEP
    streetCompany VARCHAR(45),
    streetNumberCompany VARCHAR(10),
    streetComplementCompany VARCHAR(45),
    neighborhoodCompany VARCHAR(45),
	townCompany VARCHAR(45)
    -- fk lead => referenciar qual lead (contato incial) fez chegar até aquela tal empresa
);

-- guardando os telefones da empresa, para fortalecer o meio de contato
CREATE TABLE tbPhoneCompany(
	idPhoneComapany INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    typePhoneCompany VARCHAR(11), -- tipo residencial, comercial etc
    numberPhoneCompany VARCHAR(11) -- número em si
    -- fk empresa => referenciar que esses registro de telefone pertence tal empresa
);

-- responsável de quem estaria se apresentando como empresa, o cliente referente (caramico)
CREATE TABLE tbResponsible(
	idResponsible INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameResponsible VARCHAR(45),
    cpfResponsible CHAR(11),
    birthdate DATE,
    emailResponsible VARCHAR(45),
    phoneResponsible VARCHAR(11)
    -- fk empresa => referenciar que este responsável que estará fechando contrato, pertence a tal empresa
);


-- dados do contrato feito entre a empresa/cliente e a nossa empresa
CREATE TABLE tbContract(
	idContract INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    startDateContract DATE , -- data inicial do contrato feito pela empresa e guardtech
    dueDateContract DATE , -- data de vencimento do contrato
    valueContract DECIMAL(9,2) , -- valor do contrato, valor pra cumprimento da entrega do serviço-produto
    statusValueContract VARCHAR(12) -- status se esta "pago", "pendente", "atrasado"
	-- fk empresa => referenciar que este contrato foi feito com a tal empresa
);

-- ================================================== --
-- =  Dados referente do sistema p/ Empresa|Cliente = --
-- ================================================== --

-- usuários da aplicação (uma empresa, poderia registrar varios usuários para administrar o sistema deles,
-- acesso ao dashboard, controle de login
CREATE TABLE tbUser(
	idUser INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameUser VARCHAR(20),
    passwordUser VARCHAR(255),
    emailUser VARCHAR(60)
    -- fk empresa -- este usuario(s) é de "qual empresa?", logo ele pode acessar apenas aquele dashboard especifico da tal empresa
);

-- armazém, o local onde seria implantado o sensor
CREATE TABLE tbCornStorage(
	idCornStorage INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    typeCornStorage VARCHAR(100), -- tipos de armazém, silos, graneleiro, granel, silobags etc
    volumeCornStorage INT, --  capacidade em volume metros cúbicos
    latitudeCornStorage VARCHAR(8), -- cordenadas latitude em graus
    latitudeDirectionCornStorage CHAR(1), -- DIREÇÃO da Latitude O-L
	longitudeCornStorate VARCHAR(8), -- cordenadas longitude em graus
    longitudeDirectionCornStorage CHAR(1) -- DIREÇÃO da longitude N-S
    -- fk empresa => referenciar que este armazém(ns) pertence "qual empresa?"
);

-- dados do dispositivo sensor
CREATE TABLE tbSensorDevice(
	idSensorDevice INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    typeSensorDevice VARCHAR(5), -- tipo do sensor "DHT11" "LM35"
    statusSensorDevice VARCHAR(10) -- verificação se o sensor esta ativado ou desativado
    -- fk armazém => referenciar que este sensor esta localizado em "qual armazém?"
);

-- registros do sensor sendo enviados e registrados
-- caso o sensor é do tipo DHT11 o LM35 recebe null, e assim por diante
CREATE TABLE tbSensorDeviceLog(
	idSensorDeviceLog INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    lm35DataDeviceLog decimal(4,1), -- dados recebidos se for LM35
    dht11DataDeviceLog decimal(3,1), -- dados recebidos se for DHT11
    dateHourDeviceLog DATETIME -- data e hora do registro
    -- fk sensor => referenciar que esses registro do sensor é de "qual sensor?"
);

-- ===================================================== --
-- =    Fortalecendo regras de negócio, ALTER TABLE    = --
-- ===================================================== --

-- verificando o porte da empresa
ALTER TABLE tbCompany
ADD CONSTRAINT chkSizeCompany CHECK(
	sizeCompany IN('micro','pequeno','médio','grande')
);

-- verificando o tipo de telefone
ALTER TABLE tbPhoneCompany 
ADD CONSTRAINT chkTypePhoneCompany CHECK(
	typePhoneCompany IN('Residêncial','Comercial','Pessoal')
);

-- verificando o status do valor do contrato, se está pago, pendente, atrasado, ou cancelado
ALTER TABLE tbContract
ADD CONSTRAINT chkStatusContract CHECK(
	statusValueContract IN('pago','pendente','atrasado','cancelado')
);


-- verificar o tipo do armazenamento, silos, granel etc
ALTER TABLE tbCornStorage
ADD CONSTRAINT chkTypeCornStorage CHECK(
	typeCornStorage IN ('Silo','Graneleiro','Convencional', 'Bolsa')
);

-- veriificar as direções de latitude N = NORTH(norte) | S = SOUTH(sul)
ALTER TABLE tbCornStorage 
ADD CONSTRAINT chkLatitudeDirection CHECK(
	latitudeDirectionCornStorage IN('N','S')
);

-- verificar as direções de longitude W = WEST(oeste) | E = EAST(leste)
ALTER TABLE tbCornStorage
ADD CONSTRAINT chkLongitudeDirection CHECK(
	longitudeDirectionCornStorage IN('W','E')
);