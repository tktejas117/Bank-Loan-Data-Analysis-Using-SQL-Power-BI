# BANK LOAN DATA ANALYSIS USING SQL AND POWER BI

# SnapShots
# 1. Summary Loan Portfolio Performance Dashboard
![](https://github.com/tktejas117/Bank-Loan-Data-Analysis-Using-SQL-Power-BI/blob/main/Snapshots/Summary.png)

# 2. Loan Trends & Borrower Insights
![](https://github.com/tktejas117/Bank-Loan-Data-Analysis-Using-SQL-Power-BI/blob/main/Snapshots/Overview.png)

# 3. Detailed Loan Performance Analysis
![](https://github.com/tktejas117/Bank-Loan-Data-Analysis-Using-SQL-Power-BI/blob/main/Snapshots/Details.png) 

## Overview
This project involves a comprehensive analysis of Blinkit’s grocery sales dataset using SQL.The goal is to extract valuable insights and answer various business questions based on sales, items, outlets, and customer ratings.The following README provides the project’s objectives, business problems, SQL solutions, findings, and conclusions.
## Objectives

-- Analyze overall sales performance across items and outlets.

-- Identify top-performing categories, brands, and outlet types.

-- Compare sales contribution by fat content, outlet size, and outlet location.

-- Measure customer satisfaction through ratings and visibility.

-- Categorize items based on product descriptions.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Grocery Dataset](https://www.kaggle.com/datasets/arunkumaroraon/blinkit-grocery-dataset)

## Project Structure
The project repository follows a standard structure for organizing the code and related files:

**BI Project**: This directory includes Power BI project Dashboards.

**Data**: This directory contains the dataset files used for the analysis.

**README.md**: This file provides an overview of the project, its objectives, and the project structure.

**SNAPSHOTS**: This directory contains Dashboards Snapshots.


## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    DROP TABLE IF EXISTS blinkit_data;
CREATE TABLE blinkit_data
(
    Item_Identifier       VARCHAR(50),
    Item_Weight           DECIMAL(10,2),
    Item_Fat_Content      VARCHAR(50),
    Item_Visibility       DECIMAL(10,4),
    Item_Type             VARCHAR(100),
    Outlet_Identifier     VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Size           VARCHAR(20),
    Outlet_Location_Type  VARCHAR(50),
    Outlet_Type           VARCHAR(50),
    Total_Sales           DECIMAL(10,2),
    Rating                INT,
);

);
```

## Business Problems and Solutions

## DATA CLEANING
Cleaning the Item_Fat_Content field ensures data consistency and accuracy in analysis. The presence of multiple variations of the same category (e.g., LF, low fat vs. Low Fat) can cause issues in reporting, aggregations, and filtering. By standardizing these values, we improve data quality, making it easier to generate insights and maintain uniformity in our datasets.

```sql
UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;
```
After executing this query check the data has been cleaned or not using below query

```sql
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;
```

### 1. Total Sales

```sql
SELECT CAST(SUM(Total_Sales) / 1000000.0 AS DECIMAL(10,2)) AS Total_Sales_Million
FROM blinkit_data;
```

**Objective:** The overall revenue generated from all items sold.

### 2. Average Sales

```sql
SELECT CAST(AVG(Total_Sales) AS INT) AS Avg_Sales
FROM blinkit_data;

```

**Objective:** The average revenue per sale.

### 3. Number of Items

```sql
SELECT COUNT(*) AS No_of_Items
FROM blinkit_data;

```

**Objective:** Count the total number of items sold.

### 4. Average Rating

```sql
SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data;

```

**Objective:** Find the average customer rating items sold

### 5. Total Sales by Fat Content

```sql
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Fat_Content;

```

**Objective:** Analyze the impact of fat content on total sales.

### 6. Total Sales by Item Type

```sql
SELECT Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

```

**Objective:** Identify the performance of different item types in terms of total sales.

### 7. Fat Content by Outlet for Total Sales:

```sql
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM (
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT (
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


```

**Objective:** Compare total sales across different outlets segmented by fat content.

### 8. Total Sales by Outlet Establishment:

```sql
SELECT Outlet_Establishment_Year, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

```

**Objective:** Evaluate how the age or type of outlet establishment influences total sales.

### 9. Count Percentage of Sales by Outlet Size:

```sql
SELECT Outlet_Size, 
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

```

**Objective:** Analyze the correlation between outlet size and total sales.

### 10.Sales by Outlet Location
return top 5 year with highest avg content release!

```sql
SELECT Outlet_Location_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

```

**Objective:** Assess the geographic distribution of sales across different locations.

### 11. All Metrics by Outlet Type

```sql
SELECT Outlet_Type, 
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
       COUNT(*) AS No_Of_Items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
       CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

```

**Objective:**  Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of 	Items, Average Rating) broken down by different outlet types.


## Findings and Conclusion

- **Sales performace:** Larger outlets contribute the highest percentage of sales.
- **Customer Preferance:** Regular items perform better than Low Fat products.
- **Category Insights:** Categories like Dairy, Snacks, and Beverages dominate sales.
- **Outlet Insights:** Older outlets and those in higher-tier locations generate more revenue.
- **Cutomer Feedback:** Ratings remain steady across outlets, but item visibility impacts performance.

This analysis provides a comprehensive view of Blinkit’s sales data, helping optimize inventory planning, outlet expansion, and marketing strategies.


### Stay Updated and Join the Community

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:


- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/tejas-kumar-s)

Thank you for your support, and I look forward to connecting with you!
