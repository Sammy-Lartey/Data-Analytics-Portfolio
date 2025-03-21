##### Retrieve All Data from the Table

SELECT *
FROM mini_store_0;

##### Describe Table Structure

DESCRIBE mini_store_0;

#### DATA CLEANING AND VALIDATION #######

##### Modify the Data Type of the Date Column

ALTER TABLE mini_store_0
MODIFY COLUMN Date Date;

##### Convert Date Format

UPDATE mini_store_0
SET Date = str_to_date(Date, '%d/%m/%Y');

##### Rename the Unit Price Column to be able to query column name without issues

ALTER TABLE mini_store_0
CHANGE COLUMN `Unit Price` Unit_Price TEXT;

##### Removing currency symbol in order to change datatype from Text to DECIMAL without issues

UPDATE mini_store_0
SET Unit_Price = REPLACE(Unit_Price, '$', '');

### Changing Datatype from TEXT to DECIMAL

ALTER TABLE mini_store_0
MODIFY COLUMN Unit_Price DECIMAL(10,2);

#####SOLUTIONS

#####  Write a query to retrieve all sales data on that January 1st 2019 #######

SELECT *
FROM mini_store_0
WHERE Date = 2019-01-01 ;

#### Find all transaction where the unit price exceeds the limit

SELECT *
FROM mini_store_0
WHERE Unit_Price > 10;

#### Find all the products that sells less than 5 units in the transaction

SELECT Product, Quantity
FROM mini_store_0
WHERE Quantity < 5;

#### Find all products with their category that made sales greater than $2000 sql

SELECT Product, Category, (Quantity * Unit_Price) AS Total_Sales
FROM mini_store_0
WHERE (Quantity * Unit_Price) > 2000;

######## Identify products that cost less than $500 but resulted in more than $30,000 in revenue

SELECT Product, SUM(Quantity * Unit_Price) AS Total_Revenue
FROM mini_store_0 
WHERE Unit_Price < 500
GROUP BY Product
HAVING Total_Revenue > 30000;

######## Which country recorded the highest total revenue

SELECT Country, SUM(Quantity * Unit_Price) AS Total_Revenue
FROM mini_store_0 
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 1;

######### What were the last five transactions made in the time period

SELECT * 
FROM mini_store_0 
ORDER BY Date DESC
LIMIT 5;

#########  Which country recorded the lowest total revenue

SELECT Country, SUM(Quantity * Unit_Price) AS Total_Revenue
FROM mini_store_0 
GROUP BY Country
ORDER BY Total_Revenue ASC
LIMIT 1;

########## Find products that cost $15 and recorded less than 5 items sold

SELECT * 
FROM mini_store_0 
WHERE Unit_Price = 15 AND Quantity < 5;

########## Which product is sold the most?

SELECT Product, SUM(Quantity) AS Total_Quantity_Sold
FROM mini_store_0 
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 1;

########### Which products are sold the most in each country?

SELECT Country, Product, SUM(Quantity) AS Total_Quantity_Sold
FROM mini_store_0 
GROUP BY Country, Product
ORDER BY Country, Total_Quantity_Sold DESC;




















