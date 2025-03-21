##### Retrieve a List of All People Along with Their Movies and Songs #######

SELECT 
    p.Name AS Person, 
    COALESCE(m.Title, 'No Movie') AS Movie, 
    COALESCE(s.Title, 'No Song') AS Song
FROM people p
LEFT JOIN connections c ON p.Person_Id = c.Person_Id
LEFT JOIN movies m ON c.Movie_Id = m.Movie_Id
LEFT JOIN songs s ON c.Song_Id = s.Song_Id
ORDER BY p.Name;

#### Find the Highest-Grossing Movies by Each Person ####

SELECT 
    p.Name AS Person, 
    m.Title AS Highest_Grossing_Movie, 
    MAX(m.Revenue) AS Revenue
FROM connections c
JOIN people p ON c.Person_Id = p.Person_Id
JOIN movies m ON c.Movie_Id = m.Movie_Id
GROUP BY p.Person_Id, m.Title
ORDER BY Revenue DESC;

##### Find the Most Successful Songs by Revenue and Their Creators ######

SELECT 
    p.Name AS Singer, 
    s.Title AS Song, 
    s.Revenue 
FROM connections c
JOIN people p ON c.Person_Id = p.Person_Id
JOIN songs s ON c.Song_Id = s.Song_Id
WHERE p.Profession IN ('Singer', 'Both')
ORDER BY s.Revenue DESC
LIMIT 10;

###### Find People Who Have Won Awards and Their Achievements ######

SELECT 
    a.Person_Name, 
    a.Name AS Award, 
    a.Category, 
    a.Year_Won
FROM awards a
ORDER BY a.Year_Won DESC, a.Person_Name;

###### Find the Most Awarded Individuals ######

SELECT 
    a.Person_Name, 
    COUNT(a.Award_Id) AS Total_Awards 
FROM awards a
GROUP BY a.Person_Name
ORDER BY Total_Awards DESC
LIMIT 10;


###### List People Who Have Acted in Movies but Not Released Songs #####

##### MOVIES ONLY ########

SELECT DISTINCT p.Name AS Actor
FROM people p
JOIN connections c ON p.Person_Id = c.Person_Id
JOIN movies m ON c.Movie_Id = m.Movie_Id
WHERE p.Profession = 'Actor' 
AND p.Person_Id NOT IN (
    SELECT DISTINCT c2.Person_Id FROM connections c2 WHERE c2.Song_Id IS NOT NULL
)
ORDER BY p.Name;

##### SONGS ONLY ##########

SELECT DISTINCT p.Name AS Musician
FROM people p
JOIN connections c ON p.Person_Id = c.Person_Id
JOIN songs s  ON c.Song_Id = s.Song_Id
WHERE p.Profession = 'Singer' 
AND p.Person_Id NOT IN (
    SELECT DISTINCT c2.Person_Id FROM connections c2 WHERE c2.Movie_Id IS NOT NULL
)
ORDER BY p.Name;


######## Show People Who Have Both Movies and Songs (Multi-Talented Individuals) ########

SELECT DISTINCT p.Name AS Multi_Talented
FROM people p
JOIN connections c ON p.Person_Id = c.Person_Id
WHERE c.Movie_Id IS NOT NULL AND c.Song_Id IS NOT NULL
ORDER BY p.Name;

######### Find the Most Successful Movie Region Based on Revenue ############

SELECT 
    m.Region_Success, 
    SUM(m.Revenue) AS Total_Revenue 
FROM movies m
GROUP BY m.Region_Success
ORDER BY Total_Revenue DESC;

######## Find the Most Successful Song Region Based on Revenue ########

SELECT 
    s.Region_Success, 
    SUM(s.Revenue) AS Total_Revenue 
FROM songs s
GROUP BY s.Region_Success
ORDER BY Total_Revenue DESC;

########  Find the Most Awarded Movie Stars #########

SELECT 
    p.Name AS Actor, 
    COUNT(a.Award_Id) AS Acting_Awards 
FROM people p
JOIN awards a ON p.Name = a.Person_Name
WHERE p.Profession IN ('Actor', 'Both')
GROUP BY p.Name
ORDER BY Acting_Awards DESC
LIMIT 10;


######## Find the Most Popular People in Movies, Songs & Awards Combined #########

SELECT 
    p.Name AS Celebrity, 
    COUNT(DISTINCT c.Movie_Id) AS Movie_Count, 
    COUNT(DISTINCT c.Song_Id) AS Song_Count, 
    COUNT(DISTINCT a.Award_Id) AS Award_Count,
    (COUNT(DISTINCT c.Movie_Id) + COUNT(DISTINCT c.Song_Id) + COUNT(DISTINCT a.Award_Id)) AS Total_Projects
FROM people p
LEFT JOIN connections c ON p.Person_Id = c.Person_Id
LEFT JOIN awards a ON p.Name = a.Person_Name
GROUP BY p.Name
ORDER BY Total_Projects DESC
LIMIT 10;



