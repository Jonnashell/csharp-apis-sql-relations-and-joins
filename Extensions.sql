/* Extension Task 1 */

CREATE TABLE Films (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(100),
	Director_FK INT NOT NULL,
	Star_FK INT NOT NULL,
	Writer_FK INT NOT NULL,
	Year INT CHECK (Year BETWEEN 1800 AND 2100),
	Genre VARCHAR(100),
	Score INT,
	FOREIGN KEY (Writer_FK) REFERENCES People(Id),
	FOREIGN KEY (Director_FK) REFERENCES People(Id),
	FOREIGN KEY (Star_FK) REFERENCES People(Id)
);

CREATE TABLE Roles (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100)
);

CREATE TABLE People (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);

/* Films */

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score) VALUES 
('2001: A Space Odyssey', 1, 11, 21, 1968, 'Science Fiction', 10),
('Star Wars: A New Hope', 2, 12, 2, 1977, 'Science Fiction', 7),
('To Kill A Mockingbird', 3, 13, 22, 1962, 'Drama', 10),
('Titanic', 4, 14, 4, 1997, 'Romance', 5),
('Dr Zhivago', 5, 15, 23, 1965, 'Historical', 8),
('El Cid', 6, 16, 24, 1961, 'Historical', 6),
('Voyage to Cythera', 7, 17, 7, 1984, 'Drama', 8),
('Soldier of Orange', 8, 18, 25, 1977, 'Thriller', 8),
('Three Colours: Blue', 9, 19, 9, 1993, 'Drama', 8),
('Cyrano de Bergerac', 10, 20, 26, 1990, 'Historical', 9);



/* Roles */
INSERT INTO Roles (Name) VALUES ('Writer');
INSERT INTO Roles (Name) VALUES ('Director');
INSERT INTO Roles (Name) VALUES ('Star');

/* Directors */
INSERT INTO People (Name) VALUES ('Stanley Kubrick');
INSERT INTO People (Name) VALUES ('George Lucas');
INSERT INTO People (Name) VALUES ('Robert Mulligan');
INSERT INTO People (Name) VALUES ('James Cameron');
INSERT INTO People (Name) VALUES ('David Lean');
INSERT INTO People (Name) VALUES ('Anthony Mann');
INSERT INTO People (Name) VALUES ('Theodoros Angelopoulos');
INSERT INTO People (Name) VALUES ('Paul Verhoeven');
INSERT INTO People (Name) VALUES ('Krzysztof Kieslowski');
INSERT INTO People (Name) VALUES ('Jean-Paul Rappeneau');


/* Stars */

INSERT INTO People (Name) VALUES ('Keir Dullea');
INSERT INTO People (Name) VALUES ('Mark Hamill');
INSERT INTO People (Name) VALUES ('Gregory Peck');
INSERT INTO People (Name) VALUES ('Leonardo DiCaprio');
INSERT INTO People (Name) VALUES ('Julie Christie');
INSERT INTO People (Name) VALUES ('Charlton Heston');
INSERT INTO People (Name) VALUES ('Manos Katrakis');
INSERT INTO People (Name) VALUES ('Rutger Hauer');
INSERT INTO People (Name) VALUES ('Juliette Binoche');
INSERT INTO People (Name) VALUES ('Gerard Depardieu');

/* Writers */

INSERT INTO People (Name) VALUES ('Arthur C Clarke');
INSERT INTO People (Name) VALUES ('Harper Lee');
INSERT INTO People (Name) VALUES ('Boris Pasternak');
INSERT INTO People (Name) VALUES ('Frederick Frank');
INSERT INTO People (Name) VALUES ('Erik Hazelhoff Roelfzema');
INSERT INTO People (Name) VALUES ('Edmond Rostand');


-- 1
SELECT f.Title, p.Name AS Director FROM Films f
INNER JOIN People p ON p.Id = f.Director_FK

-- 2
SELECT
	f.Title,
	p.Name AS Director,
	P2.Name AS Star
FROM Films f
JOIN People p ON p.Id = f.Director_FK
JOIN People P2 ON P2.Id = f.Star_FK
