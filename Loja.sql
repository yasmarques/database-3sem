DROP DATABASE IF EXISTS Loja;

CREATE DATABASE IF NOT EXISTS Loja;

USE Loja;

CREATE TABLE clientes (
  IDCliente int(11) NOT NULL,
  NomeCliente varchar(50) NOT NULL,
  CPFCliente varchar(14) NOT NULL,
  PRIMARY KEY (IDCliente),
  UNIQUE KEY UN_Clientes (CPFCliente)
);

INSERT INTO clientes VALUES (1,'Astrogildo','111.111.111-00'),(2,'Berisvaldo','222.222.222-00'),(3,'Gumercindo','333.333.333-00'),(4,'Pafuncia','444.444.444-00'),(5,'Tiburcio','555.555.555-00');

CREATE TABLE produtos (
  IDProduto int(11) NOT NULL,
  NomeProduto varchar(50) NOT NULL,
  PrecoUnitario decimal(5,2) NOT NULL,
  PRIMARY KEY (IDProduto)
);

INSERT INTO produtos VALUES (1,'Amoxicilina',45.99),(2,'Dipirona',17.30),(3,'Paracetamol',9.99),(4,'Sivastatina',5.00),(5,'Metaformina',11.30);

CREATE TABLE vendas (
  IDVenda int(11) NOT NULL,
  DataVenda timestamp NOT NULL,
  IDCliente int(11) NOT NULL,
  PRIMARY KEY (IDVenda),
  CONSTRAINT FK_Vendas_Clientes FOREIGN KEY (IDCliente) REFERENCES clientes (IDCliente)
);

CREATE TABLE itensvendidos (
  IDVenda int(11) NOT NULL,
  IDProduto int(11) NOT NULL,
  QtdeVendida tinyint(4) NOT NULL,
  PRIMARY KEY (IDVenda,IDProduto),  
  CONSTRAINT FK_ItensVendidos_Produtos FOREIGN KEY (IDProduto) REFERENCES produtos (IDProduto),
  CONSTRAINT FK_ItensVendidos_Vendas FOREIGN KEY (IDVenda) REFERENCES vendas (IDVenda)
);

INSERT INTO vendas VALUES (1,'2021-08-11 22:45:04',3),(2,'2021-08-11 22:49:15',5),(3,'2021-08-11 22:50:53',1),(4,'2021-08-11 22:52:46',2),(5,'2021-08-11 22:54:10',1);

INSERT INTO itensvendidos VALUES (1,2,10),(1,4,1),(1,5,2),(2,1,1),(2,5,5),(3,3,10),(3,4,10),(4,3,1),(4,4,1),(4,5,1),(5,1,10),(5,5,10);

SELECT *
FROM produtos
WHERE PrecoUnitario BETWEEN 9.00 AND 15.00;

SELECT *
FROM clientes
WHERE NomeCliente BETWEEN 'A' AND 'C';

SELECT *
FROM produtos
ORDER BY IDProduto
LIMIT 2;

SELECT MIN(PrecoUnitario)
FROM produtos;

SELECT MAX(PrecoUnitario)
FROM produtos;

SELECT MAX(PrecoUnitario) AS 'Maior Valor'
FROM produtos;

SELECT COUNT(IDProduto)
FROM produtos;

SELECT AVG(IDProduto)
FROM produtos;

SELECT SUM(IDProduto)
FROM produtos;

SELECT IDVenda, QtdeVendida,
QtdeVendida * PrecoUnitario AS Subtotal
FROM itensvendidos
INNER JOIN produtos
ON itensvendidos.IDProduto = produtos.IDProduto
ORDER BY IDVenda;

SELECT iv.IDVenda AS Venda,
p.NomeProduto AS Nome,
iv.QtdeVendida AS Qtde,
p.PrecoUnitario AS Preco,
iv.QtdeVendida * p.PrecoUnitario AS Subtotal
FROM itensvendidos AS iv
INNER JOIN produtos AS p
ON iv.IDProduto = p.IDProduto
ORDER BY iv.IDVenda;