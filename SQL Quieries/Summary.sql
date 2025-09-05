-- Key Performance Indicators (KPIs) Requirements:
-- Solutions KPI's business problems


--DASHBOARD 1: SUMMARY


-- 1. Total Loan Applications: 
-- Calculate the total number of loan applications received during a specified period. 
-- Monitor the Month-to-Date (MTD) Loan Applications 
-- Track changes Month-over-Month (MoM).

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
 
-- MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 
-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11
 

-- 2.Total Funded Amount: 
-- Total amount of funds disbursed as loans is crucial. 
-- MTD Total Funded Amount
--Analyse the Month-over-Month (MoM) changes in this metric.

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
 
-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 
-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11
 

-- Total Amount Received: 
-- Total amount received from borrowers
-- Analyse the Month-to-Date (MTD) Total Amount Received 
-- observe the Month-over-Month (MoM) changes.

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
 
-- MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 
-- PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11
 
-- Average Interest Rate: 
-- Calculating the average interest rate across all loans MTD
-- Monitoring the Month-over-Month (MoM) 

Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data
 
MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 
PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11
 

-- Average Debt-to-Income Ratio (DTI): 
-- Evaluating the average DTI for our borrowers 
-- compute the average DTI for all loans, MTD
-- Track Month-over-Month (MoM) fluctuations.

Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data
 
MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 
PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11


-- Good Loan v Bad Loan KPI’s
-- Good Loan:


-- 1.Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data
 
-- 2.Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 
-- 3.Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 

-- 4.Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 

-- BAD LOAN ISSUED

-- 1.Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data
 
-- 2.Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 
-- 3.Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 
-- 4.Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 


-- LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status
 

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


