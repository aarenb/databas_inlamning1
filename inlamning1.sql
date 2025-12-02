/*
Skapar en databas för en liten bokhandel
Av: Aaren Bertilsson YH25
*/

CREATE DATABASE Bokhandel;

USE Bokhandel;

-- Bok tablell
CREATE TABLE Böcker (
ISBN VARCHAR(13) PRIMARY KEY,
Titel VARCHAR(100) NOT NULL,
Författare VARCHAR(200) NOT NULL,
Lagerstatus INT NOT NULL,
Pris DECIMAL(10,2) NOT NULL CHECK(Pris > 0)
);

-- Kund tabell
CREATE TABLE Kunder (
KundID INT AUTO_INCREMENT PRIMARY KEY,
Namn VARCHAR(100) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Telefon VARCHAR(15) NOT NULL,
Address VARCHAR (255) NOT NULL
);

-- Beställning tabell
CREATE TABLE Beställningar (
Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
KundID INT,
TotalBelopp DECIMAL(10,2) NOT NULL CHECK(TotalBelopp > 0),
Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
);

-- Orderrad tabell
CREATE TABLE Orderrader (
OrderradID INT AUTO_INCREMENT PRIMARY KEY,
ISBN VARCHAR(13),
Ordernummer INT,
Antal INT,
FOREIGN KEY (ISBN) REFERENCES Böcker(ISBN),
FOREIGN KEY (Ordernummer) REFERENCES Beställningar(Ordernummer)
);


-- Lägg till lite test data:

INSERT INTO Böcker (ISBN, Titel, Författare, Lagerstatus, Pris) VALUES
('9781728206141', 'Boyfriend Material', 'Alexis Hall', '8', '131'),
('9781728250922', 'Husband Material', 'Alexis Hall', '5', '102');

INSERT INTO Kunder (Namn, Email, Telefon, Address) VALUES
('Aaren Bertilsson', 'aarenbs@gmail.com', '0706861894', 'Kalmarvägen 1, 333 33 Kalmar');

INSERT INTO Beställningar (KundID, TotalBelopp) VALUES
(1, 233);

INSERT INTO Orderrader (ISBN, Ordernummer, Antal) VALUES
('9781728206141', 1, 1),
('9781728250922', 1, 1);


-- Visa test datan i tabellerna:

SELECT * FROM Böcker;
SELECT * FROM Kunder;
SELECT * FROM Beställningar;
SELECT * FROM Orderrader;
