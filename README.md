# Customer Purchase Behaviour Analysis

## 📌 Project Overview
This project analyzes customer purchasing behavior using  retail transaction data.
The goal is to identify sales trends, customer activity patterns, top-performing products,
and return behavior to support data-driven business decisions.

The analysis was performed using **Python, SQL, and Power BI**, and the final insights are
presented through an interactive dashboard.

---

## 🎯 Business Problem
Retail businesses often struggle to understand:
- Which customers generate the most revenue
- Which products drive sales and returns
- Seasonal and weekly sales patterns

This project helps uncover actionable insights to improve marketing strategies,
customer retention, and revenue growth.

---

## 🗂 Dataset Summary
- **Rows:** 401,605  
- **Columns:** 10  

### Columns:
- InvoiceNo  
- StockCode  
- Description  
- Quantity  
- InvoiceDate  
- UnitPrice  
- CustomerID  
- Country  
- IsReturn  
- Revenue  

---

## 🛠 Tools & Technologies Used
- **Python (Pandas)** – Data cleaning & feature engineering  
- **SQL (MySQL)** – Data analysis queries  
- **Power BI** – Interactive dashboard  
- **DAX** – Measures (Total Revenue, AOV, Total Customers)

---

## 🔍 Data Cleaning & EDA
Performed using Python:
- Loaded data using Pandas  
- Checked structure using `info()` and `describe()`  
- Handled missing values using `isnull()` and `fillna()`  
- Removed duplicate records  
- Created a new calculated column: **Revenue**  

---

## 🧮 SQL Data Analysis

### Table Creation
```sql
CREATE TABLE retail_analysis (
  InvoiceNo VARCHAR(40),
  StockCode VARCHAR(20),
  Description TEXT,
  Quantity INT,
  InvoiceDate DATE,
  UnitPrice FLOAT,
  CustomerID VARCHAR(40),
  Country VARCHAR(40),
  IsReturn INT,
  Revenue FLOAT
);
```
---

## Business Problems and Solutions

### 1. Total Revenue
```sql
SELECT SUM(revenue) AS totalrevenue
FROM retail_analysis;
```

 

### 2.Top customers
```sql
select Customerid,round(sum(revenue),2) as Totalsales 
from retail_analysis group by Customerid order by 
Totalsales  desc limit 10
```
 
### 3.Customer Purchase Frequency
```sql
SELECT customerid, COUNT(DISTINCT invoiceno) AS purchase_count
FROM retail_analysis
GROUP BY customerid
ORDER BY purchase_count DESC;
 ```

### 4.Sales Per Month
```sql
  select month(InvoiceDate) as month,sum(revenue) as Totalrevenue
 from retail_analysis
 group by  month(InvoiceDate) order by Totalrevenue desc 
```  
 
### 5.How many unique customers?
```sql
select count(distinct customerid) as uniqcustomers from retail_analysis
 ```

### 6.How many total orders?
```sql
select count(*) as torders from retail_analysis
``` 

### 7.Which customers purchase most recently?
```sql
select customerid from retail_analysis order by invoicedate desc limit 1
``` 

### 8.Top 10 selling products
```sql
select StockCode,sum(revenue) as TotalRevenue
 from retail_analysis
 group by StockCode 
 order by TotalRevenue desc limit 10
``` 
 
 ### 9.Products with high return rates
 ```
select stockcode,count(*) as totalreturns
 from retail_analysis
 where isreturn=1 
 group by stockcode
 order by totalreturns desc limit 1
```
 
 ### 10.Which products generate the most revenue?
 ```sql
 select StockCode,sum(revenue) as TotalRevenue
 from retail_analysis
 group by StockCode 
 order by TotalRevenue desc limit 1
 ```
 
 ### 11.Highest Sale Month 
 ```sql
  select month(InvoiceDate) as month,sum(revenue) as Totalrevenue
  from retail_analysis where year(InvoiceDate)=2011
  group by  month(InvoiceDate) order by Totalrevenue desc limit 1
```
 
### 12. What day of week customers buy the most?
```sql
select dayname(InvoiceDate) as month,sum(revenue) as Totalrevenue
 from retail_analysis where year(InvoiceDate)=2011
 group by  dayname(InvoiceDate) order by Totalrevenue desc limit 1
 ```

---

## 6.Dashboard

![Dashboard](Cus_Pur_Dashboard.png)

## 7..Key Insights 
-Thursday generated the highest weekly revenue.
-	November had the highest monthly orders (seasonality effect).
-	Top 10 customers contributed ~20% of revenue.
-	Returns were very low (~2.21%), showing stable customer behavior.
-	UK contributed the largest customer base.
- A few product codes dominate revenue
---

## 8.Final Business Recommendations
-	Promote top-selling products to increase sales.
-	Target inactive customers with email campaigns.
-	Offer special deals mid-week since Thursday performs best.
-	Analyze high-value customers for loyalty programs.
-	Reduce returns by analyzing reasons for negative invoices.

---

