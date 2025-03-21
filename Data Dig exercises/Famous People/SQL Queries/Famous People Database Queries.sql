CREATE DATABASE ENTERTAINMENT_DB;
USE ENTERTAINMENT_DB;

####### People Table (Famous individuals) ########

CREATE TABLE People (
    Person_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Birth_Date DATE,
    Nationality VARCHAR(50),
    Profession ENUM('Actor', 'Singer', 'Both')
);

###### Movies Table (For actors) ##########

CREATE TABLE Movies (
    Movie_id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Release_Year YEAR,
    Revenue DECIMAL(10,2),
    Region_Success VARCHAR(50)
);

####### Songs Table (For singers) #########

CREATE TABLE Songs (
    Song_Id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Release_Year YEAR,
    Revenue DECIMAL(10,2),
    Region_success VARCHAR(50)
);

####### Awards Table ############

CREATE TABLE Awards (
	Award_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(100),
    Year_Won YEAR,
    Person_Id INT,
    FOREIGN KEY (Person_Id) REFERENCES People(Person_Id)
);

######### Connections Table (Tracks multi-talented people) ############

CREATE TABLE Connections (
    Person_Id INT,
    Movie_Id INT NULL,
    Song_Id INT NULL,
    FOREIGN KEY (Person_Id) REFERENCES People(Person_Id),
    FOREIGN KEY (Movie_Id) REFERENCES Movies(Movie_Id),
    FOREIGN KEY (Song_Id) REFERENCES Songs(Song_Id)
);


######### Populating the Tables #############3

### PEOPLE TABLE

INSERT INTO People (Name, Birth_Date, Nationality, Profession) VALUES
('Beyoncé', '1981-09-04', 'American', 'Both'),
('Dwayne Johnson', '1972-05-02', 'American', 'Actor'),
('Lady Gaga', '1986-03-28', 'American', 'Both'),
('Leonardo DiCaprio', '1974-11-11', 'American', 'Actor'),
('Ariana Grande', '1993-06-26', 'American', 'Singer'),
('Will Smith', '1968-09-25', 'American', 'Both'),
('Taylor Swift', '1989-12-13', 'American', 'Singer'),
('Johnny Depp', '1963-06-09', 'American', 'Actor'),
('Ed Sheeran', '1991-02-17', 'British', 'Singer'),
('Jennifer Lopez', '1969-07-24', 'American', 'Both'),
('Brad Pitt', '1963-12-18', 'American', 'Actor'),
('Selena Gomez', '1992-07-22', 'American', 'Both'),
('Robert Downey Jr.', '1965-04-04', 'American', 'Actor'),
('Shakira', '1977-02-02', 'Colombian', 'Both'),
('Chris Hemsworth', '1983-08-11', 'Australian', 'Actor'),
('Adele', '1988-05-05', 'British', 'Singer'),
('Zendaya', '1996-09-01', 'American', 'Both'),
('Ryan Reynolds', '1976-10-23', 'Canadian', 'Actor'),
('Rihanna', '1988-02-20', 'Barbadian', 'Both'),
('Tom Holland', '1996-06-01', 'British', 'Actor');


######## MOVIES TABLE

INSERT INTO Movies (Title, Release_Year, Revenue, Region_Success) VALUES
('Inception', 2010, 836000000.00, 'Global'),
('Titanic', 1997, 2187000000.00, 'Global'),
('Black Adam', 2022, 393000000.00, 'USA'),
('Pirates of the Caribbean', 2003, 654000000.00, 'Global'),
('The Wolf of Wall Street', 2013, 392000000.00, 'USA'),
('Aladdin', 2019, 1050000000.00, 'Global'),
('Thor: Ragnarok', 2017, 854000000.00, 'Global'),
('Avengers: Endgame', 2019, 2798000000.00, 'Global'),
('Deadpool', 2016, 783000000.00, 'Global'),
('Spider-Man: No Way Home', 2021, 1910000000.00, 'Global');

SHOW CREATE TABLE Movies;

ALTER TABLE Movies MODIFY COLUMN Revenue DECIMAL(15,2);



########### SONGS TABLE

INSERT INTO Songs (Title, Release_Year, Revenue, Region_Success) VALUES
('Halo', 2008, 5000000.00, 'Global'),
('Shallow', 2018, 12000000.00, 'Global'),
('Bad Guy', 2019, 7000000.00, 'USA'),
('Rolling in the Deep', 2010, 10000000.00, 'Global'),
('Love the Way You Lie', 2010, 9000000.00, 'USA'),
('Shape of You', 2017, 14000000.00, 'Global'),
('Hips Don’t Lie', 2005, 11000000.00, 'Latin America'),
('We Found Love', 2011, 12000000.00, 'Global'),
('Blank Space', 2014, 9000000.00, 'USA'),
('Dance Again', 2012, 6000000.00, 'Global');


########### AWARDS TABLE

INSERT INTO Awards (Name, Category, Year_Won, Person_Id) VALUES
('Academy Award', 'Best Actor', 2016, 4),
('Grammy', 'Best Song', 2019, 3),
('Golden Globe', 'Best Supporting Actor', 2020, 2),
('MTV Award', 'Best Music Video', 2017, 10),
('Billboard Award', 'Top Selling Song', 2018, 7),
('Grammy', 'Album of the Year', 2022, 16),
('Oscar', 'Best Actress', 2019, 17),
('Grammy', 'Best Latin Album', 2006, 14),
('Golden Globe', 'Best Actress', 2021, 18),
('MTV Award', 'Best Dance Song', 2012, 11);


########### CONNECTIONS TABLE 

INSERT INTO Connections (Person_Id, Movie_Id, Song_Id) VALUES
(1, NULL, 1), ## Beyoncé (Singer only)
(3, NULL, 2), ## Lady Gaga (Singer only)
(6, 6, NULL), ## Will Smith (Actor only)
(10, NULL, 4), ## Jennifer Lopez (Singer only)
(14, NULL, 7), ## Shakira (Singer only)
(19, NULL, 8), ## Rihanna (Singer only)
(5, NULL, 3), ## Ariana Grande (Singer only)
(13, 8, NULL), ## Robert Downey Jr. (Actor only)
(15, 7, NULL), ## Chris Hemsworth (Actor only)
(4, 1, NULL), ## Leonardo DiCaprio (Actor only)
(20, 10, NULL), ## Tom Holland (Actor only)
(9, NULL, 6), ## Ed Sheeran (Singer only)
(2, 3, NULL), ## Dwayne Johnson (Actor only)
(17, 9, NULL), ## Zendaya (Both)
(11, 5, NULL), ## Brad Pitt (Actor only)
(18, 9, NULL), ## Ryan Reynolds (Actor only)
(8, 4, NULL), ## Johnny Depp (Actor only)
(12, NULL, 5), ## Selena Gomez (Singer only)
(7, NULL, 9), ## Taylor Swift (Singer only)
(16, NULL, 10); ## Adele (Singer only)


SELECT * 
FROM movies;

########## INSERTING EXTRAS ############

INSERT INTO Movies (Title, Release_Year, Revenue, Region_Success) VALUES
('Children of Men', 2006, 70000000.00, 'Europe'),
('The Fall', 2006, 3700000.00, 'Global'),
('Moonlight', 2016, 65300000.00, 'USA'),
('Annihilation', 2018, 43000000.00, 'USA'),
('Upgrade', 2018, 17000000.00, 'Australia'),
('The Man from Earth', 2007, 1000000.00, 'USA'),
('Paprika', 2006, 1500000.00, 'Japan'),
('The Handmaiden', 2016, 38600000.00, 'South Korea'),
('Coherence', 2013, 100000.00, 'USA'),
('Burning', 2018, 8000000.00, 'South Korea');

INSERT INTO Songs (Title, Release_Year, Revenue, Region_Success) VALUES
('Blood on the Leaves', 2013, 1500000.00, 'USA'),
('Come Down', 2016, 2300000.00, 'USA'),
('Weightless', 2011, 800000.00, 'Global'),
('I’m Not in Love', 1975, 1000000.00, 'UK'),
('Ripe & Ruin', 2012, 670000.00, 'Europe'),
('Everything In Its Right Place', 2000, 950000.00, 'Global'),
('No One Knows', 2002, 1200000.00, 'USA'),
('Angel', 1998, 890000.00, 'UK'),
('Deep End', 2018, 750000.00, 'Europe'),
('Doomed', 2017, 550000.00, 'Global');

INSERT INTO Awards (Name, Category, Year_Won, Person_Id) VALUES
('Best Experimental Album', 'Music', 2012, 1),  
('Breakthrough Artist', 'Music', 2017, 2),  
('Best Trip-Hop Album', 'Music', 1999, 3),  
('Best Alternative Soundtrack', 'Film', 2006, 4),  
('Best Screenplay - Cannes', 'Film', 2018, 5),  
('Best Animated Film - Japan Academy', 'Film', 2006, 6),  
('Best Sound Design', 'Film', 2018, 7),  
('Most Innovative Artist', 'Music', 2020, 8),  
('Best Indie Performance', 'Music', 2019, 9),  
('Best Cinematic Score', 'Film', 2021, 10);

SELECT *
FROM connections;


###### To display the Name of the Famous Person, The Movie they starred in and the song they made 
SELECT 
    p.Name AS Person,
    COALESCE(m.Title, 'No Movie') AS Movie,
    COALESCE(s.Title, 'No Song') AS Song
FROM connections c
JOIN people p ON c.Person_Id = p.Person_Id
LEFT JOIN Movies m ON c.Movie_Id = m.Movie_Id
LEFT JOIN Songs s ON c.Song_Id = s.Song_Id;

###### Adding new entries into People table that have made both Movies and Songs

INSERT INTO People (Person_Id, Name, Birth_Date, Nationality, Profession) VALUES
(21, "Donald Glover", "1983-09-25", "American", "Both"),
(22, "Jared Leto", "1971-12-26", "American", "Both"),
(23, "Hailee Steinfeld", "1996-12-11", "American", "Both"),
(24, "Jamie Foxx", "1967-12-13", "American", "Both"),
(25, "Harry Styles", "1994-02-01", "British", "Both");

INSERT INTO Movies (Title, Release_Year, Revenue, Region_Success) VALUES
("Atlanta", 2016, 0.00, "USA"),  # Donald Glover
("Morbius", 2022, 167500000.00, "Global"),  # Jared Leto
("Bumblebee", 2018, 468000000.00, "Global"),  # Hailee Steinfeld
("Django Unchained", 2012, 425000000.00, "Global"),  # Jamie Foxx
("Dunkirk", 2017, 527000000.00, "Global");

INSERT INTO Songs (Title, Release_Year, Revenue, Region_Success) VALUES
("This Is America", 2018, 5000000.00, "Global"),  # Donald Glover
("The Kill", 2006, 2000000.00, "Global"),  # Jared Leto
("Starving", 2016, 3000000.00, "Global"),  # Hailee Steinfeld
("Blame It", 2009, 4500000.00, "USA"),  # Jamie Foxx
("Sign of the Times", 2017, 6000000.00, "Global");


INSERT INTO Connections (Person_Id, Movie_Id, Song_Id) VALUES
(21, 11, 11),  # Donald Glover - Atlanta / This Is America
(22, 12, 12),  # Jared Leto - Morbius / The Kill
(23, 13, 13),  # Hailee Steinfeld - Bumblebee / Starving
(24, 14, 14),  # Jamie Foxx - Django Unchained / Blame It
(25, 15, 15);  # Harry Styles - Dunkirk / Sign of the Times

SELECT *
FROM people;

SELECT *
FROM movies;

SELECT *
FROM songs;

SELECT *
FROM awards;

SELECT *
FROM connections;

#### ADDING name columns to the connection table to not only show Ids but names too #######

##Adding new columns

ALTER TABLE connections
ADD COLUMN Person_Name VARCHAR(100),
ADD COLUMN Movie_Name VARCHAR(100),
ADD COLUMN Song_Name VARCHAR(100);

## Updating connections table

UPDATE connections c
JOIN people p ON c.Person_Id = p.Person_Id
LEFT JOIN movies m ON c.Movie_Id = m.Movie_Id
LEFT JOIN songs s ON c.Song_Id = s.Song_Id
SET c.Person_Name = p.Name,
    c.Movie_Name = COALESCE(m.Title, 'No Movie'),
    c.Song_Name = COALESCE(s.Title, 'No Song');
    
SELECT *
FROM connections;


#### Adding name column to Awards table to include not just the Person_Id but thye name as well ####

ALTER TABLE awards
ADD COLUMN Person_Name VARCHAR(100);

UPDATE awards a
JOIN people p ON a.Person_Id = p.Person_Id
SET a.Person_Name = p.Name;












