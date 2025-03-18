######### Employee Demographics & Distribution  ###########

SELECT Gender, COUNT(*) AS Employee_Total 
FROM hrdatabase 
GROUP BY Gender;

-- More Males than Females. Males; 56 , Females; 34

######### Age Distribution ##########

SELECT 
    AVG(YEAR(CURDATE()) - YEAR(Birth_Date)) AS Average_Age, 
    MIN(YEAR(CURDATE()) - YEAR(Birth_Date)) AS Youngest_Age, 
    MAX(YEAR(CURDATE()) - YEAR(Birth_Date)) AS Oldest_Age 
FROM hrdatabase;

-- Average Age; 41.9
-- Youngest Age; 23
-- Oldest Age; 64


########## Number of Employees per City

SELECT City, COUNT(*) AS Employee_Count 
FROM employeeinformation 
GROUP BY City 
ORDER BY Employee_Count DESC;

-- Cities with the most employees; Washington and Texas with 9 employess
-- Oregon and Montana; 8
-- Missouri, New York and Ohio 7
-- City with the least number of employees; Rhode Island with 3 employees

############# Salary & Compensation Analysis #############

######### Salary Distribution ########

SELECT 
    AVG(Salary) AS Average_Salary, 
    MIN(Salary) AS Lowest_Salary, 
    MAX(Salary) AS Highest_Salary
FROM employeeinformation;

-- Average Salary; 4108.7
-- Lowest Salary; 3609.00
-- Highest Salary; 4576.00

######## Salary by Department #########

SELECT d.Department, AVG(e.Salary) AS Avg_Salary 
FROM employeeinformation e
JOIN hrdatabase h ON e.ID = h.ID
JOIN departmentinformation d ON h.Department_ID = d.Department_ID
GROUP BY d.Department
ORDER BY Avg_Salary DESC;

-- Highest paid department; Marketing with 4313.75
-- Lowest paid department; 3698.00


########### Employee Performance & Promotions ###########

####### Performance Score Distribution #########

SELECT Performance_Review, COUNT(*) AS Employee_Count 
FROM employeeinformation 
GROUP BY Performance_Review 
ORDER BY Performance_Review DESC;

-- Most common review was 7 for 20 individuals
-- 16 people had a Review of 10
-- 18 people had a Review of 9

########## Time Since Last Promotion  ############

SELECT e.ID, h.Employee, e.City, e.Salary, DATEDIFF(CURDATE(), e.Last_Promotion_Date) AS Days_Since_Last_Promotion
FROM employeeinformation e
JOIN hrdatabase h ON e.ID = h.ID
ORDER BY Days_Since_Last_Promotion DESC
LIMIT 10;

-- Longest Time Without a Promotion (Fraser Kelly - 2770 Days)
-- Missouri & Texas Employees Stagnating (2565 Days)
-- High Salaries but No Promotions?


##########  Turnover & Employee Retention  ############

######## Employee Turnover Rate

SELECT COUNT(*) AS Total_Employees, 
SUM(
CASE WHEN 
Termination_Date IS NOT NULL 
THEN 1 ELSE 0 END) AS Terminated_Employees,
(SUM(
CASE WHEN 
Termination_Date IS NOT NULL 
THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Turnover_Rate
FROM hrdatabase;

-- Total Employees; 90
-- Terminated Employees; 26
-- Turnover Rate; 28,8889

######## Reasons for Leaving ###########

SELECT Termination_Reason, COUNT(*) AS Count 
FROM hrdatabase 
WHERE Termination_Reason IS NOT NULL 
GROUP BY Termination_Reason 
ORDER BY Count DESC;

-- Top reason for leaving; Resignation


################ Overdue Vacation Analysis #############

SELECT e.ID, h.Employee AS Employee_Name, e.City, e.Salary, e.Overdue_Vacation
FROM employeeinformation e
JOIN hrdatabase h ON e.ID = h.ID
WHERE e.Overdue_Vacation IS NOT NULL AND e.Overdue_Vacation != '';

SELECT COUNT(*) AS Overdue_Vacation_Count
FROM employeeinformation
WHERE Overdue_Vacation = 'Yes';

SELECT e.ID, h.Employee, e.City, e.Salary, e.Overdue_Vacation  
FROM employeeinformation e  
JOIN hrdatabase h ON e.ID = h.ID  
WHERE LOWER(TRIM(e.Overdue_Vacation)) = 'Yes';



