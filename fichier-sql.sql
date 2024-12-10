-- creation de base de donnée
CREATE DATABASE LocationVoitures;
USE LocationVoitures;

-- creation des tables
CREATE TABLE Clients (
    NumClient INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(100),
    Adresse VARCHAR(255),
    Tel VARCHAR(15)
);
CREATE TABLE Voitures (
    NumImmatriculation VARCHAR(10) PRIMARY KEY,
    Marque VARCHAR(50),
    Modele VARCHAR(50),
    Annee INT
);
CREATE TABLE Contrats (
    NumContrat INT AUTO_INCREMENT PRIMARY KEY,
    DateDebut DATE,
    DateFin DATE,
    Duree INT,
    NumClient INT,
    NumImmatriculation VARCHAR(10),
    FOREIGN KEY (NumClient) REFERENCES Clients(NumClient),
    FOREIGN KEY (NumImmatriculation) REFERENCES Voitures(NumImmatriculation)
);
-- ajouter
INSERT INTO Clients (Nom, Adresse, Tel) VALUES
('anouar ishak', 'Tanger, Maroc', '0612675678'),
('kawtar hatimi', 'Sefrou, Maroc', '0678900934'),
('amal elmaanaoui', 'Safi, Maroc', '0600900934'),
('kawtar malika', 'Rabat, Maroc', '0655900934');

INSERT INTO Voitures (NumImmatriculation, Marque, Modele, Annee) VALUES
('J654BCD', 'Nissan', 'Juke', 2021),
('K765DEF', 'Opel', 'Astra', 2020),
('L876GHI', 'Mazda', 'CX-5', 2023),
('M987HIJ', 'Hyundai', 'Tucson', 2019),
('N123JKL', 'Kia', 'Sportage', 2022);

INSERT INTO Contrats (DateDebut, DateFin, Duree, NumClient, NumImmatriculation) VALUES
('2024-01-15', '2024-01-20', 5, 8, 'L876GHI'),
('2024-02-10', '2024-02-15', 5, 9, 'N123JKL'),
('2024-03-05', '2024-03-12', 7, 10, 'J654BCD');
 
 -- afficher
SELECT * FROM Clients;
SELECT * FROM Voitures;
SELECT * FROM Contrats;
 
 -- supprimer
DELETE FROM Contrats WHERE NumContrat = 1;
DELETE FROM Contrats WHERE NumContrat IN (1, 2, 3);
DELETE FROM Contrats WHERE NumContrat = 1;
 
 -- modifier
UPDATE Contrats
SET DateDebut = '2024-01-01', DateFin = '2024-01-10', Duree = 10
WHERE NumContrat = 1;

UPDATE Clients
SET Nom = 'Anouar Ishak', Adresse = 'Casablanca, Maroc', Tel = '0612345678'
WHERE NumClient = 1;

UPDATE Contrats
SET Duree = 7
WHERE NumClient = 2 AND DateDebut >= '2024-01-01';







