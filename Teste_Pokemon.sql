DROP DATABASE IF EXISTS Teste;
CREATE DATABASE if not exists Teste;
USE Teste;

--CHECK
CREATE TABLE Pessoas(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT NOT NULL,
    CHECK (Idade>=18)
);
--Criando tabela Pessoas e permitindo preencher somente maiores de 18 anos.

INSERT INTO Pessoas
VALUES(1,'Astrogildo','Gomes',22);
INSERT INTO Pessoas
VALUES(2,'Berisvaldo','Oliveira',12);

--------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Pessoas(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT NOT NULL,
    CHECK (Idade BETWEEN 18 AND 60)
);
--Usando CHECK pode utilizar também o comando BETWEEN.
--Criando tabela Pessoas e permitindo preencher somente maiores de 18 anos e menores de 60 anos.

INSERT INTO Pessoas
VALUES(1,'Astrogildo','Gomes',22);
INSERT INTO Pessoas
VALUES(2,'Berisvaldo','Oliveira',18);
INSERT INTO Pessoas
VALUES(3,'Gumercindo','Silva',61);

--------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Pessoas(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT NOT NULL,
    Estado CHAR(2) NOT NULL,
    CHECK (Idade>=18 AND Estado='SP')
);
--Usando CHECK para verificar multiplas colunas.
--Criando tabela Pessoas e permitindo somente maiores de 18 e moradores de SP

INSERT INTO Pessoas
VALUES(1,'Astrogildo','Gomes',22,'SP');
INSERT INTO Pessoas
VALUES(2,'Berisvaldo','Oliveira',18,'RJ');
INSERT INTO Pessoas
VALUES(3,'Gumercindo','Silva',61,'SP');
INSERT INTO Pessoas
VALUES(4,'Tiburcio','Ferreira',17,'SP');

--------------------------------------------------------------------------------------------------------------------------------------------

--DEFAULT
CREATE TABLE Pessoas(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT NOT NULL,
    Estado CHAR(2) NOT NULL
);
--Podemos adicionar/remover o CHECK em uma tabela já criada com o comando ALTER TABLE.

INSERT INTO Pessoas
VALUES(1,'Astrogildo','Gomes',22,'SP');
INSERT INTO Pessoas
VALUES(2,'Berisvaldo','Oliveira',18,'RJ');
INSERT INTO Pessoas
VALUES(3,'Gumercindo','Silva',61,'SP');
INSERT INTO Pessoas
VALUES(4,'Tiburcio','Ferreira',17,'SP');

ALTER TABLE Pessoas
ADD CHECK (Idade>=18);
--ou
ALTER TABLE Pessoas
ADD CONSTRAINT CHK_Pessoas CHECK (Idade>=18 AND Estado='SP');
--para apagar:
ALTER TABLE Pessoas
DROP CONSTRAINT CHK_Pessoas;

-------------------------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Teste;
CREATE DATABASE if not exists Teste;
USE Teste;

CREATE TABLE Pessoas(
    ID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT NOT NULL,
    Estado CHAR(2) NOT NULL DEFAULT 'SP'
);
--Criando tabela Pessoas e definindo o estado SP como padrão

INSERT INTO Pessoas
VALUES(1,'Astrogildo','Gomes',22,'SP');
INSERT INTO Pessoas
VALUES(2,'Berisvaldo','Oliveira',18,'RJ');
INSERT INTO Pessoas
VALUES(3,'Gumercindo','Silva',61,'SP');
INSERT INTO Pessoas
VALUES(4,'Tiburcio','Ferreira',17,'SP');

CREATE TABLE Pedidos(
    IDPedido INT NOT NULL PRIMARY KEY,
    DataPedido DATE NOT NULL DEFAULT CURRENT_DATE()
);
--Criando tabela Pedidos e definindo a data atual do sistema como padrão.

ALTER TABLE Pedidos
ALTER DataPedido SET DEFAULT CURRENT_DATE();

ALTER TABLE Pedidos
ALTER DataPedido DROP DEFAULT;

--------------------------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Teste;
CREATE DATABASE if not exists Teste;
USE Teste;

--AUTO_INCREMENT
CREATE TABLE Pessoas(
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Idade INT,
    PRIMARY KEY (ID)
);

ALTER TABLE Pessoas AUTO_INCREMENT=100;

INSERT INTO Pessoas(Nome, Sobrenome)
VALUES('Astrogildo', 'Gomes');

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Nentendo;
CREATE DATABASE if not exists Nentendo;
USE Nentendo;

CREATE TABLE Pokemons(
  PokeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Tipo VARCHAR(5) NOT NULL DEFAULT 'Fogo',
  Tamanho INT NOT NULL, CHECK (Tamanho>=50 AND Tamanho<=150),
  CHECK (Tipo ='Fogo' OR Tipo ='Terra' OR Tipo ='Gelo' OR Tipo ='Vento')
);
    
ALTER TABLE Pokemons AUTO_INCREMENT =150;

INSERT INTO Pokemons(Nome, Tamanho)
VALUES
('Charizard', 90),
('Venusaur', 100),
('Blastoise', 85),
('Feraligatr', 89)
('Meganium', 100);
('Typhlosion', 80);

ALTER TABLE Pokemons
ADD COLUMN HoraCadastro TIMESTAMP;

INSERT INTO Pokemons(Nome, Tipo, Tamanho)
VALUES
('Blaziken', 'Fogo', 52),
('Sceptile', 'Planta', 52),
('Swampert', 'Agua', 82),
('Infernape', 'Fogo', 55),
('Torterra', 'Planta', 150),
('Empoleon', 'Agua', 85),
('Emboar', 'Fogo', 150),
('Serperior', 'Planta', 63),
('Samurott', 'Agua', 95),
('Delphox', 'Fogo', 50),
('Chesnaught', 'Planta', 90),
('Greninja', 'Agua', 50)
('Incineroar', 'Fogo', 83),
('Decidueye', 'Planta', 50),
('Primarina', 'Agua', 50),
('Cinderace', 'Fogo', 50),
('Rillaboom', 'Planta', 90),
('Inteleon', 'Agua', 50),
('Skeledirge', 'Fogo', 150),
('Meowscarada', 'Planta', 50),
('Quaquaval', 'Agua', 62);