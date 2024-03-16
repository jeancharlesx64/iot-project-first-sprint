-- =================================================== --
-- =                    *READ DATA*                  = --
-- =================================================== --

USE guardtech;

 -- selecionando nossos leads, potencial cliente
SELECT * from tbLead;

-- selecionar o email e as mensagens dos leads
SELECT emailLead, descriptionMessageLead FROM tbLead;


-- =========================================

-- Monitorador do armazém
-- ele quer analisar os armazenamentos, se estão tudo ok
SELECT * FROM tbCornStorage;

-- qual o tipo e onde está localizado ?
SELECT typeCornStorage, CONCAT(latitudeCornStorage, 'º', latitudeDirectionCornStorage, ',',longitudeCornStorage, 'º',longitudeDirectionCornStorage) AS 'Localização' 
FROM tbCornStorage;

-- o funcionário quer ver os que tem maiores capacidade
SELECT * FROM tbCornStorage ORDER BY volumeCornStorage DESC;

-- Selecione apenas o armazém com a maior capacidade entre todos, mostre também a localização
SELECT typeCornStorage, CONCAT(latitudeCornStorage, 'º', latitudeDirectionCornStorage, ',', longitudeCornStorage, 'º',longitudeDirectionCornStorage) AS 'Localização' 
FROM tbCornStorage
WHERE idCornStorage = 2;

-- agora encontrado o armazém, o funcionário vai poder ver os sensores que estão lá
SELECT * FROM tbSensorDevice;

-- algum inativo? medir a temperatura e umidade é importante, isso é um problema, deve ser constatado a equipe de TI;
SELECT * FROM tbSensorDevice 
WHERE statusSensorDevice = 'Inativo'; -- porque está inativo?

-- agora o funcionário quer averiguar se o retorno dos que estão ativos esta ok
SELECT * FROM tbSensorDeviceLog;
 
 -- =======================================================================

-- selecionando os dados da empresa que contatou a equipe pra ver se esta tudo ok
SELECT * FROM tbCompany
WHERE idCompany = 1;

-- selecionar a localização de uma determinada empresa, precisamos ir la dar suporte
SELECT streetCompany,streetNumberCompany,streetComplementCompany,neighborhoodCompany,townCompany FROM tbCompany
WHERE idCompany = 1;

-- selecionar os contratos que estão atrasados
SELECT statusValueContract FROM tbContract
WHERE idContract = 1;

-- selecionar a data de vencimento 
SELECT dueDateContract as 'Data de Vencimento' FROM tbContract
WHERE idContract = 1;

-- selecionando o nome do resonsável e o email pra entrar em contato
SELECT nameResponsible, emailResponsible FROM tbResponsible;

-- selecione o telefone do responsavel, se ela não responder o email, temos outro meio de contato
SELECT nameResponsible, phoneResponsible FROM tbResponsible
WHERE idResponsible = 1;

-- informar para a responsável quem constatou
SELECT nameUser,emailUser FROM tbUser
WHERE idUser = 1;

