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
