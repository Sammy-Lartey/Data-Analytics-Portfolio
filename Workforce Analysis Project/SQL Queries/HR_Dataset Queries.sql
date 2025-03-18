SELECT * 
FROM departmentinformation;

SELECT * 
FROM employeeinformation;

SELECT * 
FROM hrdatabase;

##### Describing the Tables to show the column Datatypes

DESCRIBE employeeinformation;

DESCRIBE departmentinformation;

DESCRIBE hrdatabase;

###### Cleaning ########

##### Removing spaces from column names #####

##### employeeinformation table ####

ALTER TABLE employeeinformation
RENAME COLUMN `Performance Review` TO `Performance_Review`,  
RENAME COLUMN `Last Promotion Date` TO `Last_Promotion_Date`,  
RENAME COLUMN `Overdue Vacation?` TO `Overdue_Vacation`;

ALTER TABLE employeeinformation  
RENAME COLUMN `ï»¿ID` TO `ID`;  

SELECT *
FROM employeeinformation;

##### departmentinformation table #####

ALTER TABLE departmentinformation
 
RENAME COLUMN `ï»¿DepartmentID` TO `DepartmentID`;

ALTER TABLE departmentinformation
RENAME COLUMN `DepartmentID` TO `Department_ID`;

SELECT *
FROM departmentinformation;


###### hrdatabase table #######

ALTER TABLE hrdatabase
RENAME COLUMN `Birth Date` TO `Birth_Date`,  
RENAME COLUMN `Hire Date` TO `Hire_Date`,  
RENAME COLUMN `Termination Date` TO `Termination_Date`,
RENAME COLUMN `Termination Reason` TO `Termination_Reason`,
RENAME COLUMN `Department ID` TO `Department_ID`,
RENAME COLUMN `ï»¿ID` TO `ID`; 

SELECT *
FROM hrdatabase;

########### Handling Datatypes ###############

DESCRIBE departmentinformation;

DESCRIBE employeeinformation;

DESCRIBE hrdatabase;

############## employeeinformation ####################
##### Changing Last_Promotion_Date column to Date Datatype

SELECT DISTINCT Last_Promotion_Date FROM employeeinformation;

UPDATE employeeinformation  
SET Last_Promotion_Date = NULL  
WHERE Last_Promotion_Date = '';

UPDATE employeeinformation  
SET Last_Promotion_Date = STR_TO_DATE(Last_Promotion_Date, '%m/%d/%Y')  
WHERE Last_Promotion_Date IS NOT NULL AND Last_Promotion_Date != '';

ALTER TABLE employeeinformation  
MODIFY COLUMN Last_Promotion_Date DATE;

######## Convert Salary from INT to DECIMAL ########

ALTER TABLE employeeinformation  
MODIFY COLUMN Salary DECIMAL(10,2);

DESCRIBE employeeinformation;

############# Removing weird characters from the column values   #############

UPDATE employeeinformation  
SET City = REPLACE(City, 'Â', '');


SELECT *
FROM employeeinformation;


####### Handling data types ######

DESCRIBE hrdatabase;

UPDATE hrdatabase  
SET Birth_Date = NULL  
WHERE Birth_Date = '';

UPDATE hrdatabase  
SET Birth_Date = STR_TO_DATE(Birth_Date, '%m/%d/%Y')  
WHERE Birth_Date IS NOT NULL AND Birth_Date != '';

ALTER TABLE hrdatabase  
MODIFY COLUMN Birth_Date DATE;

UPDATE hrdatabase  
SET Hire_Date = NULL  
WHERE Hire_Date = '';

UPDATE hrdatabase  
SET Hire_Date = STR_TO_DATE(Hire_Date, '%m/%d/%Y')  
WHERE Hire_Date IS NOT NULL AND Hire_Date != '';

ALTER TABLE hrdatabase  
MODIFY COLUMN Hire_Date DATE;

UPDATE hrdatabase  
SET Termination_Date = NULL  
WHERE Termination_Date = '';

UPDATE hrdatabase  
SET Termination_Date = STR_TO_DATE(Termination_Date, '%m/%d/%Y')  
WHERE Termination_Date IS NOT NULL AND Termination_Date != '';

ALTER TABLE hrdatabase  
MODIFY COLUMN Termination_Date DATE;

SELECT *
FROM hrdatabase;



##### Handling Hidden characters in data values #####

UPDATE employeeinformation  
SET City = REPLACE(City, CONCAT(CHAR(13), CHAR(10)), CHAR(10));

UPDATE employeeinformation  
SET City = REPLACE(City, CHAR(13), CHAR(10));


SELECT City, HEX(City)  
FROM employeeinformation  
WHERE City LIKE '%\r%' OR City LIKE '%\n%' OR City LIKE '%Â%';

SELECT City, HEX(City)  
FROM employeeinformation  
WHERE City LIKE '%Â%' OR City LIKE '% %' OR City LIKE '%\r%' OR City LIKE '%\n%';

SELECT DISTINCT City  
FROM employeeinformation  
WHERE City LIKE '% %';  

UPDATE employeeinformation  
SET City = 'Arizona'  
WHERE City LIKE ' Arizona';  -- Fix leading non-breaking space

UPDATE employeeinformation  
SET City = 'Montana'  
WHERE City LIKE ' Montana';  -- Fix leading space

UPDATE employeeinformation  
SET City = 'Maryland'  
WHERE City LIKE ' Maryland';  -- Fix leading space

SELECT *
FROM employeeinformation;

SELECT *
FROM departmentinformation;

SELECT *
FROM hrdatabase;


SELECT * FROM hrdatabase 
WHERE Birth_Date IS NULL;

SELECT *  
FROM employeeinformation  
GROUP BY ID, City, Last_Promotion_Date, Salary, Performance_Review, Overdue_Vacation  
HAVING COUNT(*) > 1;

######  Identifying the Hidden Characters
SELECT Termination_Reason, HEX(Termination_Reason) 
FROM hrdatabase 
WHERE Termination_Reason = '' OR Termination_Reason IS NULL;

##### Counting empty strings
SELECT COUNT(*) 
FROM hrdatabase 
WHERE Termination_Reason = '';

### converting empty strings to NULL
UPDATE hrdatabase 
SET Termination_Reason = NULL 
WHERE Termination_Reason = '';

### TEST
SELECT Termination_Reason, COUNT(*) AS Count 
FROM hrdatabase 
WHERE Termination_Reason IS NOT NULL 
GROUP BY Termination_Reason 
ORDER BY Count DESC;


############ CREATING CONNECTIONS ####################
ALTER TABLE employeeinformation ADD PRIMARY KEY (ID);
ALTER TABLE departmentinformation ADD PRIMARY KEY (Department_ID);
ALTER TABLE hrdatabase ADD PRIMARY KEY (ID);

-- Linking employeeinformation to hrdatabase (One-to-One)
ALTER TABLE employeeinformation  
ADD CONSTRAINT fk_employee_hr FOREIGN KEY (ID)  
REFERENCES hrdatabase(ID) ON DELETE CASCADE;

-- Linking hrdatabase to departmentinformation (Many-to-One)
ALTER TABLE hrdatabase  
ADD CONSTRAINT fk_hr_department FOREIGN KEY (Department_ID)  
REFERENCES departmentinformation(Department_ID) ON DELETE SET NULL;


















