-- Criação da tabela Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Nascimento DATE NOT NULL
);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (ClienteID, Nome, CPF, Nascimento) VALUES
(1, 'Ariano Suassuna', '123.456.789-01', '1922-05-21'),
(2, 'Grace Hopper', '543.765.987-23', '2002-04-29'),
(3, 'Richard Feynman', '987.654.231-90', '2001-10-12'),
(4, 'Edgar Poe', '432.765.678-67', '1998-12-14'),
(5, 'Gordon Freeman', '927.384.284-44', '1984-11-26');

-- Criação da tabela Veículo
CREATE TABLE Veículo (
    VeículoID INT PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    Placa VARCHAR(8) UNIQUE NOT NULL,
    Diária DECIMAL(10, 2) NOT NULL
);

-- Inserção de dados na tabela Veículo
INSERT INTO Veículo (VeículoID, Modelo, Cor, Placa, Diária) VALUES
(1, 'Fusca', 'Preto', 'WER-3456', 30.00),
(2, 'Variante', 'Rosa', 'FDS-8384', 60.00),
(3, 'Comodoro', 'Preto', 'CVB-9933', 20.00),
(4, 'Deloriam', 'Azul', 'FGH-2256', 80.00),
(5, 'Brasília', 'Amarela', 'DDI-3948', 45.00);

-- Criação da tabela Locação
CREATE TABLE Locação (
    LocaçãoID INT PRIMARY KEY,
    ClienteID INT NOT NULL,
    VeículoID INT NOT NULL,
    Dias INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (VeículoID) REFERENCES Veículo(VeículoID)
);

-- Inserção de dados na tabela Locação
INSERT INTO Locação (LocaçãoID, ClienteID, VeículoID, Dias, Total) VALUES
(101, 1, 1, 3, 90.00),
(102, 2, 2, 7, 420.00),
(103, 3, 3, 1, 20.00),
(104, 4, 4, 7, 560.00),
(105, 5, 5, 7, 315.00);

-- Criação da view LocaçõesDetalhadas
CREATE VIEW LocaçõesDetalhadas AS
SELECT
    L.LocaçãoID,
    C.Nome AS ClienteNome,
    C.CPF AS ClienteCPF,
    C.Nascimento AS ClienteNascimento,
    V.Modelo AS VeículoModelo,
    V.Cor AS VeículoCor,
    V.Placa AS VeículoPlaca,
    V.Diária AS VeículoDiária,
    L.Dias,
    L.Total
FROM
    Locação L
JOIN
    Cliente C ON L.ClienteID = C.ClienteID
JOIN
    Veículo V ON L.VeículoID = V.VeículoID;
    
-- Seleciona todos os registros da view LocaçõesDetalhadas
SELECT * FROM LocaçõesDetalhadas;
