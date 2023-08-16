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

SELECT *
FROM veiculos
WHERE preco BETWEEN 10000.00 AND 15000.00;

SELECT *
FROM clientes
WHERE nomecliente BETWEEN 'F' AND 'R';

SELECT *
FROM veiculos
ORDER BY idveiculo
LIMIT 2;

SELECT MIN(preco)
FROM veiculos;

SELECT MAX(preco)
FROM veiculos;

SELECT MAX(preco) AS 'Maior Valor'
FROM veiculos;

SELECT COUNT(idveiculo)
FROM veiculos;

SELECT AVG(idveiculo)
FROM veiculos;

SELECT SUM(idveiculo)
FROM veiculos;

SELECT iv.idvenda, iv.idveiculo, iv.qtdevendida, v.preco * iv.qtdevendida AS Subtotal
FROM itensvendidos AS iv
INNER JOIN veiculos AS v
ON iv.idveiculo = v.idveiculo
ORDER BY idvenda;

SELECT iv.idvenda AS Venda,
vc.modelo AS Carro,
iv.qtdevendida AS Qtde,
vc.preco * iv.qtdevendida AS Subtotal
FROM itensvendidos AS iv
INNER JOIN veiculos AS vc
ON iv.idveiculo = vc.idveiculo
ORDER BY idvenda;

SELECT vd.idvenda AS Venda,
vd.datavenda AS Data,
cli.nomecliente AS Nome,
cli.estado AS UF
FROM vendas AS vd
INNER JOIN clientes AS cli;

SELECT iv.idvenda AS Venda,
vc.modelo AS Carro,
vc.preco * iv.qtdevendida AS Subtotal
FROM itensvendidos AS iv
INNER JOIN veiculos AS vc
ON iv.idveiculo = vc.idveiculo
LIMIT 5;

SELECT iv.idvenda AS Venda,
vc.modelo AS Carro,
vc.preco * iv.qtdevendida AS Subtotal
FROM itensvendidos AS iv
INNER JOIN veiculos AS vc
ON iv.idveiculo = vc.idveiculo
ORDER BY Subtotal DESC
LIMIT 3;