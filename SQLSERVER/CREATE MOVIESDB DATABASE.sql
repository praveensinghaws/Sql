-- CREATE MOVIESDB DATABASE
USE master; -- Assuming you are creating the database in the master database. Change it if needed.

-- Drop the database if it already exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'MoviesDB')
BEGIN
    DROP DATABASE MoviesDB;
END

-- Create MoviesDB database
CREATE DATABASE MoviesDB;

-- Switch to the newly created database
USE MoviesDB;

-- Create Actors table
CREATE TABLE actors (
  actor_id INT PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  birth_year INT
);

-- Create Financials table
CREATE TABLE financials (
  movie_id INT PRIMARY KEY,
  budget DECIMAL(10,2),
  revenue DECIMAL(10,2),
  unit VARCHAR(20),
  currency CHAR(3)
);

-- Create Languages table
CREATE TABLE languages (
  language_id TINYINT PRIMARY KEY,
  name VARCHAR(45) NOT NULL
);


-- Create Movies table
CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  industry VARCHAR(45),
  release_year INT, -- Modified data type
  imdb_rating DECIMAL(3,1),
  studio VARCHAR(45),
  language_id TINYINT,
  FOREIGN KEY (language_id) REFERENCES languages(language_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create Movie_Actor table
CREATE TABLE movie_actor (
  movie_id INT,
  actor_id INT,
  PRIMARY KEY (movie_id, actor_id),
  FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Example for the Actors table
BULK INSERT actors
FROM 'D:\data\movies-db-actors.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If your CSV has a header row, otherwise remove this line
);

GO;

-- Example for the Financials table
BULK INSERT financials
FROM 'D:\data\movies-db-financials.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If your CSV has a header row, otherwise remove this line
);

GO;

-- Example for the Languages table
BULK INSERT languages
FROM 'D:\data\movies-db-languages.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If your CSV has a header row, otherwise remove this line
);

GO;

-- Example for the Movie_Actor table
BULK INSERT movie_actor
FROM 'D:\data\movies-db-movie-actor.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If your CSV has a header row, otherwise remove this line
);

GO;

-- Example for the Movies table
BULK INSERT movies
FROM 'D:\data\movies-db-movies.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- If your CSV has a header row, otherwise remove this line
);

GO;
