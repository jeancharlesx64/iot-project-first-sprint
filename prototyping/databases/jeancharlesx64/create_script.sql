-- =================================================== --
-- =                 *CREATE TABLES*                 = --
-- =================================================== --
-- ==== auxilio do 4Devs para a inserção de dados ==== --
-- =================================================== --


-- 6 leads capturados (possíveis clientes), valores correto no check
INSERT INTO tbLead VALUES
	(DEFAULT,'Fernanda Caramico','fernanda.caramico@sptech.school','16971561565','Olá! tenho interesse no seu produto, podemos marcar uma reunição?', '2024-03-18'),
	(DEFAULT,'Caio Santos','caio.santos@sptech.school','19999557123','Hmm.. Vocês irão usar alguma tecnologia internacional? Eu quero uma tecnologia simples pra mim','2024-03-12'),
    (DEFAULT,'Rafael Petry','rafael.petry@sptech.school','87997511680','Bacana, eu queria entender a documentação do projeto, como irá funcionar?','2024-03-19'),
    (DEFAULT,'Vivian Silva','vivian.silva@sptech.school','79964032623','Os dados capturado pelo sensor são precisos??','2024-03-19'),
    (DEFAULT,'Marise Miranda','marise.miranda@sptech.school','42967115367','Como funciona essa tecnologia? usa algum tipo de computação quântica?','2024-03-12'),
    (DEFAULT,'Marcio Santana','marcio.santana@sptech.school','43989418398','Essa solução pode ser usada em todos os ambientes?','2024-03-20'),
    (DEFAULT,'Thiago Gomes','thiago.gomes@sptech.school','86988070677','Não consigo controlar minhas emoções, finalmente achei a solução, pode me explicar como funciona?','2024-03-07');

-- 2 empresa que tem interese (prospect) ou que ja comprou a ideia
INSERT INTO tbCompany VALUES
	(DEFAULT,'Grão de Milhões','Grão de Milhões Agricola S A','18894115000132','grande','15750970','Avenida Sílvio Rallio','874','Perto do Morro do Taboão','Centro','Santa Albertina'),
    (DEFAULT,'Max Safra','Max Safra Brasil PW','48469050000149','médio','13504056','Avenida', '48','Posto do Ipiranga','Rio Claro','Rio Claro');
INSERT INTO tbCompany(sizeCompany) VALUE ('pequenininha'); -- testando check da empresa constraint vai ser violada


--  telefones de uma determinada empresa 
INSERT INTO tbPhoneCompany VALUES
	(DEFAULT,'62976942369','Comercial'), 
    (DEFAULT,'31968753636', 'Residêncial'),
    (DEFAULT,'54967719944','Pessoal');
INSERT INTO tbPhoneCompany(typePhoneCompany) VALUE ('whatsapp'); -- testando check constraint vai ser violada

-- responsavel da empresa que tem interesse na empresa, ou que comprou a ideia
INSERT INTO tbResponsible VALUE (DEFAULT,'Fernanda Caramico','92710525011','1995-04-13','fernanda.caramico@sptech.school','16971561565');
    
-- dados do contrato, segurança pra a empresa e controle
INSERT INTO tbContract VALUES 
	(DEFAULT,'2024-03-22','2024-06-05',1293.20,'pago'),
    (DEFAULT,'2024-01-29','2024-09-15',1190.20,'pendente'),
    (DEFAULT,'2024-03-23','2024-07-21',4190.20,'atrasado');

-- usuários que administra a ferramenta, cadastrada pela empresa
INSERT INTO tbUser VALUES
	(DEFAULT,'julia_monitora','#Gf11122233396','julia@sptech.school'),
    (DEFAULT,'fernando_monitor','#Gf1112233396','fernando@sptech.school');

-- armazens cadadastrados pelo usuário, mas que pertence á empresa
INSERT INTO tbCornStorage VALUES
	(DEFAULT,'Silo','210','','','',''),
    (DEFAULT,'Graneleiro','500','','','',''),
    (DEFAULT,'Bolsa','90','','', '','');
