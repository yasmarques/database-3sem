DROP DATABASE IF EXISTS Pizzaria;

CREATE DATABASE IF NOT EXISTS Pizzaria;

USE Pizzaria;

CREATE TABLE Clientes(
    CodCliente INT NOT NULL PRIMARY KEY,
    NomeCliente VARCHAR(50) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    CEP VARCHAR(9) NOT NULL,
    Compl VARCHAR(100) NOT NULL,
    Bairro VARCHAR(30) NOT NULL,
    Telefone VARCHAR(14) NOT NULL
);

CREATE TABLE Pizzas(
    CodPizza INT NOT NULL PRIMARY KEY,
    NomePizza VARCHAR(50) NOT NULL,
    Ingredientes VARCHAR(150) NOT NULL,
    Tamanho VARCHAR(7) NOT NULL,
    PrecoPizza DECIMAL(5,2) NOT NULL
);

CREATE TABLE Bebidas (
    CodBebida INT NOT NULL PRIMARY KEY,
    NomeBebida VARCHAR(30) NOT NULL,
    Peso INT NOT NULL,
    PrecoBebida DECIMAL(5,2) NOT NULL
);

CREATE TABLE Pedidos (
    CodPedido INT NOT NULL PRIMARY KEY,
    DataPedido TIMESTAMP NOT NULL,
    CodCliente INT NOT NULL,
    FOREIGN KEY (CodCliente) REFERENCES Clientes (CodCliente)
);

CREATE TABLE PizzasPedidas(
    CodPedido INT NOT NULL,
    CodPizza INT NOT NULL,
    QtdePizza INT NOT NULL,
    FOREIGN KEY (CodPedido) REFERENCES Pedidos (CodPedido),
    FOREIGN KEY (CodPizza) REFERENCES Pizzas (CodPizza)
);

CREATE TABLE BebidasPedidas(
    CodPedido INT NOT NULL,
    CodBebida INT NOT NULL,
    QtdeBebida INT NOT NULL,
    FOREIGN KEY (CodPedido) REFERENCES Pedidos (CodPedido),
    FOREIGN KEY (CodBebida) REFERENCES Bebidas (CodBebida)
);

INSERT INTO Clientes
VALUES (1, 'Yasmin Marques Tito', 'Bahia', '04849522', '245', 'Cantinho do Céu', '59333362'),
(2, 'Sophia Cruz Sodre', 'Pierre de Beranger', '04676051', '141', 'Campo Grande', '977149197'),
(3, 'Walssimon dos Santos Silva Sacramento', 'Alameda Santo Amaro', '04647001', '11', 'Santo Amaro', '971485417'),
(4, 'Wersington dos Santos Silva Sacramento', 'Angelo José Ribeiro', '04779841', '4', 'Parelheiros', '59797906'),
(5, 'Juliana Sabino', 'Boa Vista', '04698713', '134', 'Gaivotas', '55281922');

INSERT INTO Pizzas
VALUES (1, 'Mussarela', 'Queijo e Tomate', 'Grande', '40.00'),
(2, 'Caipira', 'Frango, Catupiry e Milho', 'Grande', '45.00'),
(3, 'Calabresa', 'Calabresa e Cebola', 'Medio', '30.00'),
(4, 'Brocolis', 'Brocolis e Bacon', 'Media', '30.00'),
(5, 'Sensacao', 'Chocoalte e Morango', 'Pequena', '25.00');

INSERT INTO Bebidas
VALUES (1, 'Coca Cola', '1.5', '9.00'),
(2, 'Fanta Laranja', '1.5', '7.00'),
(3, 'Guarana', '2', '8.00');

INSERT INTO Pedidos
VALUES(1, '09/05/2023', 2),
(2, '08/05/2023', 2),
(3, '07/05/2023', 3),
(4, '06/05/2023', 4),
(5, '05/05/2023', 5);

INSERT INTO PizzasPedidas
VALUES (1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(2, 4, 1),
(2, 5, 1),
(3, 3, 1),
(3, 2, 1),
(3, 1, 1),
(4, 4, 1),
(4, 5, 1),
(5, 5, 1),
(5, 1, 1),
(5, 2, 1);

INSERT INTO BebidasPedidas
VALUES (1, 1, 1),
(2, 1, 1),
(3, 2, 1),
(4, 1, 1),
(5, 3, 1);

CREATE TEMPORARY TABLE tmp_subtotalPizzas
SELECT pz.PrecoPizza * pzp.QtdePizza AS SubtotalPizza
FROM Pizzas AS pz
INNER JOIN PizzasPedidas AS pzp
ON pz.CodPizza = pzp.CodPizza;

CREATE TEMPORARY TABLE tmp_subotalBebidas
SELECT bz.PrecoBebida * bzp.QtdeBebida AS SubtotalBebidas
FROM Bebidas AS bz
INNER JOIN BebidasPedidas AS bzp
ON bz.CodBebida = bzp.CodBebida;

CREATE TEMPORARY TABLE tmp_total AS
SELECT Pedidos.CodPedido, Pedidos.DataPedido, Clientes.NomeCliente,
    SUM(Bebidas.PrecoBebida * BebidasPedidas.QtdeBebida) + 
    SUM(Pizzas.PrecoPizza * PizzasPedidas.QtdePizza) AS Total
FROM Pedidos
JOIN Clientes ON Pedidos.CodCliente = Clientes.CodCliente
LEFT JOIN PizzasPedidas ON Pedidos.CodPedido = PizzasPedidas.CodPedido
LEFT JOIN Pizzas ON PizzasPedidas.CodPizza = Pizzas.CodPizza
LEFT JOIN BebidasPedidas ON Pedidos.CodPedido = BebidasPedidas.CodPedido
LEFT JOIN Bebidas ON BebidasPedidas.CodBebida = Bebidas.CodBebida
GROUP BY Pedidos.CodPedido;
