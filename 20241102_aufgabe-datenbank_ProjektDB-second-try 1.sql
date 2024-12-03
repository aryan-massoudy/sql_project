-- 1. Erstellen Sie eine Datenbank mit dem Namen ProjektDB

CREATE DATABASE ProjektDB;


--2. Create a table named Projekte
-- Use the ProjektDB database
USE ProjektDB;

-- Create a table named Projekte
CREATE TABLE Projekte (
    -- Column a: ID is an integer (INT) that is the primary key and will auto-increment
    ID INT PRIMARY KEY IDENTITY(1,1),
    
    -- Column b: Projektname is a string of characters (up to 255), and it cannot be empty (NOT NULL)
    Projektname NVARCHAR(255) NOT NULL,
    
    -- Column c: Startdatum is a date type to store the project start date
    Startdatum DATE,
    
    -- Column d: Enddatum is a date type to store the project end date
    Enddatum DATE,
    
    -- Column e: Budget is a decimal number with up to 18 digits and 2 decimal places
    Budget DECIMAL(18, 2)
);



--3. Tabelle Mitarbeiter erstellen

-- Create a table named Mitarbeiter
CREATE TABLE Mitarbeiter (
    -- Column a: ID is an integer (INT) that is the primary key and will auto-increment
    ID INT PRIMARY KEY IDENTITY(1,1),
    
    -- Column b: Vorname is a string of characters (up to 50), to store the first name
    Vorname NVARCHAR(50),
    
    -- Column c: Nachname is a string of characters (up to 50), to store the last name
    Nachname NVARCHAR(50),
    
    -- Column d: Abteilung is a string of characters (up to 100), to store the department name
    Abteilung NVARCHAR(100)
);


--4. Tabelle Aufgaben erstellen

-- Use the ProjektDB database
USE ProjektDB;

-- Create a table named Aufgaben
CREATE TABLE Aufgaben (
    -- Column a: ID is an integer (INT) that is the primary key and will auto-increment
    ID INT PRIMARY KEY IDENTITY(1,1),
    
    -- Column b: Aufgabenname is a string (up to 255 characters) that cannot be empty (NOT NULL)
    Aufgabenname NVARCHAR(255) NOT NULL,
    
    -- Column c: Beschreibung is a text field to store detailed descriptions of the task
    Beschreibung TEXT,
    
    -- Column d: Startdatum is a date field for the task's start date
    Startdatum DATE,
    
    -- Column e: Enddatum is a date field for the task's end date
    Enddatum DATE,
    
    -- Column f: Status is a string (up to 50 characters) to indicate the task status
    Status NVARCHAR(50),
    
    -- Column g: ProjektID is an integer that will link to the Projekte table
    ProjektID INT,
    
    -- Column h: MitarbeiterID is an integer that will link to the Mitarbeiter table
    MitarbeiterID INT,
    
    -- Foreign key constraint for ProjektID referencing the ID in the Projekte table
    CONSTRAINT FK_Projekt FOREIGN KEY (ProjektID) REFERENCES Projekte(ID),
    
    -- Foreign key constraint for MitarbeiterID referencing the ID in the Mitarbeiter table
    CONSTRAINT FK_Mitarbeiter FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(ID)
);


-- 5. Füllen Sie die Tabelle Projekte mit 5 Projekten (Projekt 1 bis 5)

-- Insert 5 projects into the Projekte table
INSERT INTO Projekte (Projektname, Startdatum, Enddatum, Budget) VALUES
    ('Projekt 1', '2024-01-01', '2024-06-01', 10000.00),
    ('Projekt 2', '2024-02-15', '2024-08-15', 15000.00),
    ('Projekt 3', '2024-03-01', '2024-09-01', 20000.00),
    ('Projekt 4', '2024-04-10', '2024-10-10', 25000.00),
    ('Projekt 5', '2024-05-20', '2024-11-20', 30000.00);


-- 6. Füllen Sie die Tabelle Mitarbeiter mit 3 Datensätzen (Beachten Sie die Referenzen)


-- Insert 10 employees into the Mitarbeiter table
INSERT INTO Mitarbeiter (Vorname, Nachname, Abteilung) VALUES
    ('Max', 'Mustermann', 'IT'),
    ('Anna', 'Müller', 'HR'),
    ('Peter', 'Schmidt', 'Finance'),
    ('Laura', 'Schneider', 'Marketing'),
    ('Tobias', 'Weber', 'Sales'),
    ('Julia', 'Fischer', 'IT'),
    ('Markus', 'Bauer', 'HR'),
    ('Sophie', 'Richter', 'Finance'),
    ('Felix', 'Klein', 'Marketing'),
    ('Clara', 'Hoffmann', 'Sales');


-- 7. Füllen Sie die Tabelle Aufgaben mit 10 Datensätzen (Beachten Sie die Referenzen)

-- Insert 10 tasks into the Aufgaben table
INSERT INTO Aufgaben (Aufgabenname, Beschreibung, Startdatum, Enddatum, Status, ProjektID, MitarbeiterID) VALUES
    ('Task 1', 'Description for Task 1', '2024-01-02', '2024-01-10', 'In Progress', 1, 1),
    ('Task 2', 'Description for Task 2', '2024-01-11', '2024-01-20', 'Not Started', 1, 2),
    ('Task 3', 'Description for Task 3', '2024-02-01', '2024-02-15', 'In Progress', 2, 3),
    ('Task 4', 'Description for Task 4', '2024-02-16', '2024-03-01', 'Completed', 2, 4),
    ('Task 5', 'Description for Task 5', '2024-03-10', '2024-03-25', 'Not Started', 3, 5),
    ('Task 6', 'Description for Task 6', '2024-04-01', '2024-04-15', 'In Progress', 4, 6),
    ('Task 7', 'Description for Task 7', '2024-04-16', '2024-04-30', 'Completed', 4, 7),
    ('Task 8', 'Description for Task 8', '2024-05-01', '2024-05-15', 'In Progress', 5, 8),
    ('Task 9', 'Description for Task 9', '2024-05-16', '2024-05-30', 'Not Started', 5, 9),
    ('Task 10', 'Description for Task 10', '2024-06-01', '2024-06-15', 'In Progress', 1, 10);


--8. 8. Erstellen Sie ein Script um Login User und einen User mit dem Namen „ProjektAdmin“ mit dem Passwort „Test1234!“. 
--      Geben Sie diesem User die „db_owner“ Berechtigung.

-- Use the master database to create a new login
USE master;

-- Create a new SQL Server login for 'ProjektAdmin'
CREATE LOGIN ProjektAdmin WITH PASSWORD = 'Test1234!';

-- Use the ProjektDB database to create a user associated with the login
USE ProjektDB;

-- Create a user in the ProjektDB database for the login 'ProjektAdmin'
CREATE USER ProjektAdmin FOR LOGIN ProjektAdmin;

-- Grant the 'db_owner' role to the user 'ProjektAdmin'
ALTER ROLE db_owner ADD MEMBER ProjektAdmin;



-- Erweiterung Nr. 1:



-- Aufgabe 9. Was könnten Sie an dieser Datenbank in Hinsicht der 3. Normalform verbessern? Realisieren Sie das nach Absprach

 
select distinct status from Aufgaben;
 
-- Erstellung von Status tabele 
create table Status (
	ID INT PRIMARY KEY identity(1,1),
	Status nvarchar(50) not null
);
 
-- Einfugen von einmaligen Daten von Aufgaben Tabelle (Feld Status)
INSERT INTO Status (Status)
SELECT DISTINCT Status
FROM Aufgaben;
 
-- Testen ob daten in die Tabelle sind
select * from status;
 
-- Erstellen eines Fremdschlüssels in der Tabelle Aufgaben mit dem namen StatusID
Alter table Aufgaben add StatusID int;
 
update Aufgaben set statusID = status.id 
from Aufgaben inner join status
on Aufgaben.Status = status.Status
 
-- Testen ob daten in die Tabelle sind
select * from Aufgaben;


-- 11. Erweitern Sie die Tabelle Mitarbeiter um das Feld Stundensatz. Tragen Sie dort den Wert 25 ein.

-- Step 1: Add a new column 'Stundensatz' to the Mitarbeiter table
ALTER TABLE Mitarbeiter
ADD Stundensatz DECIMAL(10, 2);

-- Step 2: Set the value of 'Stundensatz' to 25 for all existing records in the Mitarbeiter table
UPDATE Mitarbeiter
SET Stundensatz = 25.00;

--12. Löschen Sie aus der Tabelle Mitarbeiter mittels eines SQL Scripts 2 Datensätze.

-- Use the ProjektDB database
USE ProjektDB;

-- Delete two specific records from the Mitarbeiter table
DELETE FROM Mitarbeiter
WHERE ID IN (1, 2);



--13. Ändern Sie den Namen des ersten Mitarbeiters

-- Update the first employee's name (assuming their ID is 1)
UPDATE Mitarbeiter
SET Vorname = 'NeuerVorname', Nachname = 'NeuerNachname'
WHERE ID = 1;


--14. Heben Sie alle Stundensätze der Mitarbeiter um 10% schreiben Sie dafür ein Script.

-- Increase the Stundensatz of all employees by 10%
UPDATE Mitarbeiter
SET Stundensatz = Stundensatz * 1.10;

--15. Erstellen Sie eine Tabelle AufgabenStunden. Hier sollen Arbeitszeiten pro Mitarbeiter und...
--    ... Aufgabe eingetragen werden mit Start und Endzeit. Wie gestalten Sie diese Tabelle am besten um das abzubilden.


-- Create the AufgabenStunden table
CREATE TABLE AufgabenStunden (
    ID INT PRIMARY KEY IDENTITY(1,1),            -- Unique ID for each work entry
    AufgabeID INT NOT NULL,                      -- References the specific task (from Aufgaben)
    MitarbeiterID INT NOT NULL,                  -- References the specific employee (from Mitarbeiter)
    Startzeit DATETIME NOT NULL,                 -- Start time of the work session
    Endzeit DATETIME NOT NULL,                   -- End time of the work session

    -- Foreign key constraints to ensure task and employee IDs exist
    CONSTRAINT FK_AufgabenStunden_AufgabeID FOREIGN KEY (AufgabeID) REFERENCES Aufgaben(ID),
    CONSTRAINT FK_AufgabenStunden_MitarbeiterID FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(ID)
);



-- 16. Erfassen Sie pro Mitarbeiter mind. 5 Arbeitszeiten jeweils für den Monat Juli und

-- Use the ProjektDB database
USE ProjektDB;

-- Insert work sessions for each employee for the month of July
-- Note: Replace `1`, `2`, etc., with actual IDs from your Mitarbeiter and Aufgaben tables

-- Example for Employee with ID 1, Task with ID 1
-- Employee with ID 1, Task with ID 1
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (1, 1, '2024-07-01 08:00:00', '2024-07-01 17:00:00'),
    (1, 1, '2024-07-03 09:00:00', '2024-07-03 19:00:00'),
    (1, 1, '2024-08-05 10:00:00', '2024-08-05 20:00:00'),
    (1, 1, '2024-08-07 08:30:00', '2024-08-07 18:30:00'),
    (1, 1, '2024-08-10 09:00:00', '2024-08-10 13:00:00');

-- Employee with ID 2, Task with ID 2
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (2, 2, '2024-07-01 08:00:00', '2024-07-01 19:00:00'),
    (2, 2, '2024-08-04 09:00:00', '2024-08-04 13:00:00'),
    (2, 2, '2024-08-06 10:00:00', '2024-08-06 20:00:00'),
    (2, 2, '2024-08-08 08:30:00', '2024-08-08 12:30:00'),
    (2, 2, '2024-08-11 09:00:00', '2024-08-11 20:00:00');

-- Employee with ID 3, Task with ID 3
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (3, 3, '2024-07-02 08:00:00', '2024-07-02 17:00:00'),
    (3, 3, '2024-07-05 09:00:00', '2024-07-05 13:00:00'),
    (3, 3, '2024-08-09 10:00:00', '2024-08-09 18:00:00'),
    (3, 3, '2024-08-12 08:30:00', '2024-08-12 12:30:00'),
    (3, 3, '2024-08-15 09:00:00', '2024-08-15 19:00:00');

-- Employee with ID 4, Task with ID 4
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (4, 4, '2024-07-01 08:00:00', '2024-07-01 17:00:00'),
    (4, 4, '2024-07-03 09:00:00', '2024-07-03 16:00:00'),
    (4, 4, '2024-08-06 10:00:00', '2024-08-06 17:00:00'),
    (4, 4, '2024-08-08 08:30:00', '2024-08-08 12:30:00'),
    (4, 4, '2024-08-11 09:00:00', '2024-08-11 13:00:00');

-- Employee with ID 5, Task with ID 5
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (5, 5, '2024-07-02 08:00:00', '2024-07-02 12:00:00'),
    (5, 5, '2024-07-04 09:30:00', '2024-07-04 19:30:00'),
    (5, 5, '2024-08-07 10:00:00', '2024-08-07 18:00:00'),
    (5, 5, '2024-08-09 08:15:00', '2024-08-09 20:15:00'),
    (5, 5, '2024-08-12 09:45:00', '2024-08-12 20:45:00');

-- Employee with ID 6, Task with ID 6
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (6, 6, '2024-07-03 08:00:00', '2024-07-03 12:00:00'),
    (6, 6, '2024-07-05 09:00:00', '2024-07-05 13:00:00'),
    (6, 6, '2024-08-08 10:00:00', '2024-08-08 14:00:00'),
    (6, 6, '2024-08-10 08:30:00', '2024-08-10 12:30:00'),
    (6, 6, '2024-08-13 09:00:00', '2024-08-13 13:00:00');

-- Employee with ID 7, Task with ID 7
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (7, 7, '2024-07-02 08:30:00', '2024-07-02 17:30:00'),
    (7, 7, '2024-07-04 09:15:00', '2024-07-04 13:15:00'),
    (7, 7, '2024-08-06 10:30:00', '2024-08-06 18:30:00'),
    (7, 7, '2024-08-08 08:45:00', '2024-08-08 12:45:00'),
    (7, 7, '2024-08-11 09:30:00', '2024-08-11 13:30:00');

-- Employee with ID 8, Task with ID 8
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (8, 8, '2024-07-01 07:45:00', '2024-07-01 11:45:00'),
    (8, 8, '2024-07-03 09:45:00', '2024-07-03 20:45:00'),
    (8, 8, '2024-08-05 10:00:00', '2024-08-05 14:00:00'),
    (8, 8, '2024-08-09 08:00:00', '2024-08-09 18:00:00'),
    (8, 8, '2024-08-13 09:00:00', '2024-08-13 19:00:00');

-- Employee with ID 9, Task with ID 9
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (9, 9, '2024-07-02 08:00:00', '2024-07-02 12:00:00'),
    (9, 9, '2024-07-04 10:00:00', '2024-07-04 14:00:00'),
    (9, 9, '2024-08-07 09:30:00', '2024-08-07 13:30:00'),
    (9, 9, '2024-08-10 08:30:00', '2024-08-10 12:30:00'),
    (9, 9, '2024-08-12 09:15:00', '2024-08-12 13:15:00');

-- Employee with ID 10, Task with ID 10
INSERT INTO AufgabenStunden (AufgabeID, MitarbeiterID, Startzeit, Endzeit) VALUES
    (10, 10, '2024-07-03 08:15:00', '2024-07-03 12:15:00'),
    (10, 10, '2024-07-05 09:45:00', '2024-07-05 20:45:00'),
	(10, 10, '2024-08-05 09:45:00', '2024-08-05 16:45:00'),
	(10, 10, '2024-08-05 09:45:00', '2024-08-05 13:45:00'),
	(10, 10, '2024-08-05 09:45:00', '2024-08-05 19:45:00')


--17,18,20:

-- Update the view to include a warning for overtime
CREATE VIEW MitarbeiterArbeitsZeiten AS
SELECT 
    m.ID,
    m.Vorname,
    m.Nachname,
    MONTH(a.Startzeit) AS Monat,
    YEAR(a.Startzeit) AS Jahr,
    SUM(DATEDIFF(HOUR, a.Startzeit, a.Endzeit)) AS GesamtArbeitszeit,
    SUM(DATEDIFF(HOUR, a.Startzeit, a.Endzeit) * m.Stundensatz) AS GesamtVerguetung,
    CASE 
        WHEN SUM(DATEDIFF(HOUR, a.Startzeit, a.Endzeit)) > 35 THEN 'Achtung Überstunden'
        ELSE 'normale Arbeitszeit'
    END AS ArbeitszeitWarnung
FROM 
    Mitarbeiter m
JOIN 
    AufgabenStunden a ON m.ID = a.MitarbeiterID
GROUP BY 
    m.ID, m.Vorname, m.Nachname, YEAR(a.Startzeit), MONTH(a.Startzeit);


--19.
-- Query the view with sorting
SELECT * 
FROM MitarbeiterArbeitsZeiten
ORDER BY GesamtArbeitszeit DESC;

--20. see above

--21. 

ALTER TABLE Aufgaben
ADD CONSTRAINT DF_Startdatum DEFAULT GETDATE() FOR Startdatum;


