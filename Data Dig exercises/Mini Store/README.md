# Data Dig: SQL Data Analysis & Cleaning

## Overview

In this project, **Data Dig**, I focused on cleaning, transforming, and analyzing a retail dataset using SQL. The dataset contains transaction records from a mini store, covering product details, pricing, quantities sold, and country of sale. My SQL queries ensure data integrity and extract meaningful insights into business performance.

## What I Did

### 1. Data Retrieval & Structure Inspection
- Retrieved all records from the dataset.
- Examined the table structure to understand column definitions and data types.

### 2. Data Cleaning & Transformation
- Modified the **Date** column data type to ensure proper formatting.
- Converted the **Date** format to a standard SQL format.
- Renamed the **Unit Price** column to avoid querying issues.
- Removed currency symbols from **Unit Price** to facilitate numerical calculations.
- Converted **Unit Price** from `TEXT` to `DECIMAL` for accuracy.

### 3. Business Insights & Analysis

#### Sales Analysis:
- Retrieved all sales data from **January 1, 2019**.
- Identified transactions where the **unit price** exceeded **$10**.
- Found products that sold **fewer than 5 units** per transaction.
- Identified products that generated **over $2000 in sales**.
- Determined which products, priced under **$500**, generated **over $30,000 in revenue**.

#### Revenue Insights:
- Identified the **country with the highest total revenue**.
- Identified the **country with the lowest total revenue**.

#### Transaction Trends:
- Retrieved the **last five transactions** recorded in the dataset.
- Found products priced at **$15** that recorded **fewer than 5 units sold**.

#### Top-Selling Products:
- Identified the **most sold product** overall.
- Determined the **most sold products per country**.

## Tools & Technologies Used
- **Database Management System**: MySQL / PostgreSQL
- **Query Language**: SQL

## How to Use This Project
1. Clone this repository.
2. Load the dataset into an SQL database.
3. Run the SQL queries in the script.
4. Modify the queries to extract additional insights as needed.

## Next Steps & Enhancements
- Expand the dataset to include more time periods for trend analysis.
- Integrate visualization tools like **Power BI** or **Tableau**.
- Optimize SQL queries for performance improvements.
