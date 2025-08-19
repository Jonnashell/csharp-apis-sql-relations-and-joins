CREATE TABLE Directors (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100),
	Country VARCHAR(100)
);

CREATE TABLE Stars (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100),
	DOB DATE
);

CREATE TABLE Writers (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE Films (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(100),
	Director_FK INT NOT NULL,
	Star_FK INT NOT NULL,
	Writer_FK INT NOT NULL,
	Year INT CHECK (Year BETWEEN 1800 AND 2100),
	Genre VARCHAR(100),
	Score INT,
	FOREIGN KEY (Writer_FK) REFERENCES Writers(Id),
	FOREIGN KEY (Director_FK) REFERENCES Directors(Id),
	FOREIGN KEY (Star_FK) REFERENCES Stars(Id)
);

/* Directors */

INSERT INTO Directors (Name, Country)
VALUES ('Stanley Kubrick', 'USA');

INSERT INTO Directors (Name, Country)
VALUES ('George Lucas', 'USA');

INSERT INTO Directors (Name, Country)
VALUES ('Robert Mulligan', 'USA');

INSERT INTO Directors (Name, Country)
VALUES ('James Cameron', 'Canada');

INSERT INTO Directors (Name, Country)
VALUES ('David Lean', 'UK');

INSERT INTO Directors (Name, Country)
VALUES ('Anthony Mann', 'USA');

INSERT INTO Directors (Name, Country)
VALUES ('Theodoros Angelopoulos', 'Greece');

INSERT INTO Directors (Name, Country)
VALUES ('Paul Verhoeven', 'Netherlands');

INSERT INTO Directors (Name, Country)
VALUES ('Krzysztof Kieslowski', 'Poland');

INSERT INTO Directors (Name, Country)
VALUES ('Jean-Paul Rappeneau', 'France');

/* Stars */


INSERT INTO Stars (Name, DOB)
VALUES ('Keir Dullea', '1936-05-30');

INSERT INTO Stars (Name, DOB)
VALUES ('Mark Hamill', '1951-09-25');

INSERT INTO Stars (Name, DOB)
VALUES ('Gregory Peck', '1916-04-05');

INSERT INTO Stars (Name, DOB)
VALUES ('Leonardo DiCaprio', '1974-11-11');

INSERT INTO Stars (Name, DOB)
VALUES ('Julie Christie', '1940-04-14');

INSERT INTO Stars (Name, DOB)
VALUES ('Charlton Heston', '1923-10-04');

INSERT INTO Stars (Name, DOB)
VALUES ('Manos Katrakis', '1908-08-14');

INSERT INTO Stars (Name, DOB)
VALUES ('Rutger Hauer', '1944-01-23');

INSERT INTO Stars (Name, DOB)
VALUES ('Juliette Binoche', '1964-03-09');

INSERT INTO Stars (Name, DOB)
VALUES ('Gerard Depardieu', '1948-12-27');

/* Writers */

INSERT INTO Writers (Name, Email)
VALUES ('Arthur C Clarke', 'arthur@clarke.com');

INSERT INTO Writers (Name, Email)
VALUES ('George Lucas', 'george@email.com');

INSERT INTO Writers (Name, Email)
VALUES ('Harper Lee', 'harper@lee.com');

INSERT INTO Writers (Name, Email)
VALUES ('James Cameron', 'james@cameron.com');

INSERT INTO Writers (Name, Email)
VALUES ('Boris Pasternak', 'boris@boris.com');

INSERT INTO Writers (Name, Email)
VALUES ('Frederick Frank', 'fred@frank.com');

INSERT INTO Writers (Name, Email)
VALUES ('Theodoros Angelopoulos', 'harper@lee.com');

INSERT INTO Writers (Name, Email)
VALUES ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com');

INSERT INTO Writers (Name, Email)
VALUES ('Krzysztof Kieslowski', 'email@email.com');

INSERT INTO Writers (Name, Email)
VALUES ('Edmond Rostand', 'edmond@rostand.com');


/* Films */

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('2001: A Space Odyssey', 1, 1, 1, 1968, 'Science Fiction', 10);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Star Wars: A New Hope', 2, 2, 2, 1977, 'Science Fiction', 7);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('To Kill A Mockingbird', 3, 3, 3, 1962, 'Drama', 10);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Titanic', 4, 4, 4, 1997, 'Romance', 5);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Dr Zhivago', 5, 5, 5, 1965, 'Historical', 8);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('El Cid', 6, 6, 6, 1965, 'Historical', 6);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Voyage to Cythera', 7, 7, 7, 1984, 'Drama', 8);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Soldier of Orange', 8, 8, 8, 1977, 'Thriller', 8);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Three Colours: Blue', 9, 9, 9, 1993, 'Drama', 8);

INSERT INTO Films (Title, Director_FK, Star_FK, Writer_FK, Year, Genre, Score)
VALUES ('Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);

/* Queries */

-- 1. 
SELECT Title, D.Name FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK;

-- 2.
SELECT Title, D.Name, s.Name FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
INNER JOIN Stars s ON s.Id = f.Star_FK;

-- 3
SELECT Title FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
WHERE d.Country = 'USA';

-- 4
SELECT Title FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
INNER JOIN Writers w ON w.Id = f.Writer_FK
WHERE w.Name = d.Name;

-- 5
SELECT d.Name AS Director, f.Title FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
WHERE f.Score >= 8;

-- 6
SELECT
	f.Title,
	d.Name AS Director,
	d.Country AS Director,
	s.Name AS Star,
	s.DOB AS StarDOB,
	w.Name AS Writer,
	w.Email AS WriterEmail,
	f.Year,
	f.Genre,
	f.Score
FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
INNER JOIN Stars s ON s.Id = f.Star_FK
INNER JOIN Writers w ON w.Id = f.Writer_FK

-- 7
SELECT d.Country, COUNT(*) AS Count 
FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
INNER JOIN Stars s ON s.Id = f.Star_FK
INNER JOIN Writers w ON w.Id = f.Writer_FK
GROUP BY d.Country
ORDER BY Count DESC

-- 8
SELECT f.Title, f.Genre, f.Year, f.Score, d.Name
FROM Films f
INNER JOIN Directors d ON d.Id = f.Director_FK
INNER JOIN Stars s ON s.Id = f.Star_FK
ORDER BY f.Year DESC, f.Score DESCs