DROP DATABASE IF EXISTS chevrowagen;

CREATE DATABASE IF NOT EXISTS chevrowagen;

USE chevrowagen;

CREATE TABLE clientes
(
	idcliente int NOT NULL,
	nomecliente varchar(40) NOT NULL,
	estado char(2) NOT NULL,
	PRIMARY KEY(idcliente)
);

CREATE TABLE veiculos
(
	idveiculo int NOT NULL,
	fabricante varchar(30) NOT NULL,
	modelo varchar(50) NOT NULL,
	ano year NOT NULL,
	preco decimal(10,2) NOT NULL,
	PRIMARY KEY(idveiculo)
);

CREATE TABLE vendas
(
	idvenda int NOT NULL,
	datavenda date NOT NULL,
	idcliente int NOT NULL,
	PRIMARY KEY(idvenda),
	FOREIGN KEY(idcliente) REFERENCES clientes(idcliente)
);

CREATE TABLE itensvendidos
(
	idvenda int NOT NULL,
	idveiculo int NOT NULL,
	qtdevendida tinyint NOT NULL,
	PRIMARY KEY(idvenda,idveiculo),
	FOREIGN KEY(idvenda) REFERENCES vendas(idvenda),
	FOREIGN KEY(idveiculo) REFERENCES veiculos(idveiculo)
);

INSERT INTO clientes
VALUES('1','Joaquim Jose da Silva Xavier','MG');

INSERT INTO clientes
VALUES('2','Alberto Santos Dumont','MG');

INSERT INTO clientes
VALUES('3','Jose Abelardo Barbosa de Medeiros','PE');

INSERT INTO clientes
VALUES('4','Raul Santos Seixas','BA');

INSERT INTO clientes
VALUES('5','Tancredo de Almeida Neves','MG');

INSERT INTO clientes
VALUES('6','Janio da Silva Quadros','MS');

INSERT INTO clientes
VALUES('7','Renato Manfredini Junior','RJ');

INSERT INTO veiculos
VALUES('200','Chevrolet','Corsa','1995','11704.00');

INSERT INTO veiculos
VALUES('201','Chevrolet','Vectra','2005','27009.00');

INSERT INTO veiculos
VALUES('202','Nissan','Kicks','2019','90499.90');

INSERT INTO veiculos
VALUES('203','Chevrolet','Celta','2006','17888.00');

INSERT INTO veiculos
VALUES('204','Fiat','Fiorino','1997','11136.00');

INSERT INTO veiculos
VALUES('205','Fiat','Palio','1999','11258.00');

INSERT INTO veiculos
VALUES('206','Ford','EcoSport','2009','48913.00');

INSERT INTO veiculos
VALUES('207','Ford','Fiesta','1998','10355.00');

INSERT INTO veiculos
VALUES('208','Ford','KA','2006','16707.00');

INSERT INTO veiculos
VALUES('209','Volkswagen','Fusca','1985','5855.00');

INSERT INTO vendas
VALUES ('400','2010-06-11','5');

INSERT INTO vendas
VALUES ('401','2010-06-11','1');

INSERT INTO vendas
VALUES ('402','2010-06-13','3');

INSERT INTO vendas
VALUES ('403','2010-06-21','2');

INSERT INTO vendas
VALUES ('404','2010-07-07','7');

INSERT INTO itensvendidos
VALUES('400','203','5');

INSERT INTO itensvendidos
VALUES('400','208','5');

INSERT INTO itensvendidos
VALUES('401','204','10');

INSERT INTO itensvendidos
VALUES('401','205','10');

INSERT INTO itensvendidos
VALUES('401','209','15');

INSERT INTO itensvendidos
VALUES('402','206','30');

INSERT INTO itensvendidos
VALUES('403','201','2');

INSERT INTO itensvendidos
VALUES('403','207','4');

INSERT INTO itensvendidos
VALUES('404','200','10');

INSERT INTO itensvendidos
VALUES('404','205','5');

INSERT INTO itensvendidos
VALUES('404','208','5');

INSERT INTO itensvendidos
VALUES('404','209','10');

ALTER TABLE veiculos ADD COLUMN Estoque INT NULL;

UPDATE veiculos SET Estoque=95 WHERE idveiculo=200;

UPDATE veiculos SET Estoque=25 WHERE idveiculo=201;

UPDATE veiculos SET Estoque=50 WHERE idveiculo=202;

UPDATE veiculos SET Estoque=45 WHERE idveiculo=203;

UPDATE veiculos SET Estoque=70 WHERE idveiculo=204;

UPDATE veiculos SET Estoque=10 WHERE idveiculo=205;

UPDATE veiculos SET Estoque=85 WHERE idveiculo=206;

UPDATE veiculos SET Estoque=49 WHERE idveiculo=207;

UPDATE veiculos SET Estoque=53 WHERE idveiculo=208;

UPDATE veiculos SET Estoque=24 WHERE idveiculo=209;

SELECT *,
CASE
   WHEN Estoque < 24 THEN 'Estoque critico'
   WHEN Estoque BETWEEN 25 AND 50 THEN 'Estoque em alerta'
   WHEN Estoque BETWEEN 51 AND 75 THEN 'Estoque dentro do esperado'
   ELSE 'Estoque em excesso'
END AS Status
FROM veiculos;

ALTER TABLE clientes ADD Cidade VARCHAR(50) NULL;

UPDATE clientes SET Cidade='Belo Horizonte' WHERE IDCliente=1;

UPDATE clientes SET Cidade='Salvador' WHERE IDCliente= 4;

UPDATE clientes SET Cidade='Uberlandia' WHERE IDCliente=5;

UPDATE clientes SET Cidade='Petropolis' WHERE IDCliente=7;

SELECT *
FROM clientes
WHERE Cidade IS NULL;

SELECT *
FROM clientes
WHERE Cidade IS NOT NULL;

SELECT * FROM clientes
ORDER BY
(CASE
    WHEN Cidade IS NULL THEN Estado
    ELSE Cidade
END);