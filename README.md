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




## Key Performance Indicators (KPIs) Requirements:

## DASHBOARD 1: SUMMARY 

### 1. Total Loan Applications

```sql
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
```

###  MTD Loan Applications

```sql

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12


```

###  PMTD Loan Applications

```sql

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11


```

### 2. Total Funded Amount

```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

```

### 5. MTD Total Funded Amount

```sql

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12


```

### 6. PMTD Total Funded Amount

```sql

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11

```

### 7. Total Amount Received

```sql

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data

```

### 8. MTD Total Amount Received

```sql

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12

```

### 9. PMTD Total Amount Received

```sql

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11

```

### 10.Average Interest Rate
return top 5 year with highest avg content release!

```sql
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data

```


### 11. MTD Average Interest

```sql

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12

```

### 11. MTD Average Interest

```sql

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12

```
### 12. PMTD Average Interest

```sql

SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11

```
### 13. Average DTI

```sql

SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data

```
### 14. MTD Avg DTI

```sql

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12
```

### 15. MTD Average Interest

```sql

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12

```
### 16. PMTD Avg DTI

```sql

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11

```

## 📂 Project Structure
```
/bank-loan-kpi-project
│
├── README.md
├── /Sql Queries/
│     ├── Dashboard1_Summary.sql
│     ├── Dashboard1_Overview.sql
│     └── Dashboard1_Detailed.sql

```

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
