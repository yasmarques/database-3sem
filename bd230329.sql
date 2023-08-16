DROP DATABASE IF EXISTS bd230329;

CREATE DATABASE IF NOT EXISTS bd230329;

USE bd230329;

CREATE TABLE Vendidos (
	ID_NF INT NOT NULL,
	ID_ITEM INT NOT NULL,
	COD_PROD INT NOT NULL,
	VALOR_UNIT DECIMAL(4,2) NOT NULL,
    QUANTIDADE INT NOT NULL,
    DESCONTO INT NOT NULL, 
    PRIMARY KEY (ID_NF, ID_ITEM)
);

INSERT INTO Vendidos
VALUES ('1', '1', '1', '25.00', '10', '5');

INSERT INTO Vendidos
VALUES ('1', '2', '2', '13.50', '3', '0'),
('1', '3', '3', '15.00', '2', '0'),
('1', '4', '4', '10.00', '1', '0'),
('1', '5', '5', '30.00', '1', '0'),
('2', '1', '3', '15.00', '4', '0'),
('2', '2', '4', '10.00', '5', '0'),
('2', '3', '5', '30.00', '7', '0'),
('3', '1', '1', '25.00', '5', '0'),
('3', '2', '4', '10.00', '4', '0'),
('3', '3', '5', '30.00', '5', '0'),
('3', '4', '2', '13.50', '7', '0'),
('4', '1', '5', '30.00', '10', '15'),
('4', '2', '4', '10.00', '12', '5'),
('4', '3', '1', '25.00', '13', '5'),
('4', '4', '2', '13.50', '15', '5'),
('5', '1', '3', '15.00', '3', '0'),
('5', '2', '5', '30.00', '6', '0'),
('6', '1', '1', '25.00', '22', '15'),
('6', '2', '3', '15.00', '25', '20'),
('7', '1', '1', '25.00', '10', '3'),
('7', '2', '2', '13.50', '10', '4'),
('7', '3', '3', '15.00', '10', '4'),
('7', '4', '5', '30.00', '10', '1');

SELECT * FROM Vendidos 
WHERE DESCONTO = 0;

SELECT * FROM Vendidos 
WHERE DESCONTO > 0;

SELECT *, VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100))
AS VALOR_DESCONTO 
FROM Vendidos;

SELECT *, VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100)) AS VALOR_DESCONTO,
(VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100)))* QUANTIDADE AS SUBTOTAL FROM Vendidos;

SELECT ID_NF, SUM(VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100)))
AS TOTAL_GERAL
FROM Vendidos
GROUP BY ID_NF;