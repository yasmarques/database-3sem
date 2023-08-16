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

ALTER TABLE produtos ADD COLUMN Estoque TINYINT NULL;

SELECT * FROM produtos;

UPDATE produtos SET Estoque=20 WHERE IDProduto=1;

UPDATE produtos SET Estoque=80 WHERE IDProduto=2;

UPDATE produtos SET Estoque=45 WHERE IDProduto=3;

UPDATE produtos SET Estoque=10 WHERE IDProduto=4;

UPDATE produtos SET Estoque=70 WHERE IDProduto=5;

SELECT IDProduto, NomeProduto, Estoque,
CASE
   WHEN Estoque < 30 THEN 'Estoque baixo, providenciar compra'
   WHEN Estoque BETWEEN 30 AND 50 THEN 'Estoque em atenção'
   ELSE 'Estoque normal'
END AS Situacao
FROM produtos;

SELECT * FROM clientes;

ALTER TABLE clientes ADD Cidade VARCHAR(40) NULL;

ALTER TABLE clientes ADD Pais VARCHAR(40) NULL;

UPDATE clientes SET Cidade='Campinas', Pais='Brasil' WHERE IDCliente=1;

UPDATE clientes SET Pais='Brasil' WHERE IDCliente=2;

UPDATE clientes SET Cidade='New York', Pais='EUA' WHERE IDCliente=3;

UPDATE clientes SET Cidade='Rio Bonito' WHERE IDCliente= 4;

UPDATE clientes SET Pais='Alemanha' WHERE IDCliente=5;

SELECT *
FROM clientes
WHERE Cidade IS NULL;

SELECT *
FROM clientes
WHERE Pais IS NULL;

SELECT * FROM clientes
ORDER BY
(CASE
    WHEN Cidade IS NULL THEN Pais
    ELSE Cidade 
END);