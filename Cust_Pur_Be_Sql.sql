use ram
CREATE TABLE retail_analysis (
  InvoiceNO varchar(40),
  StockCode VARCHAR(20),
  Description text,
  Quantity int,
  InvoiceDate date,
  UnitPrice float,
  CustomerID varchar(40),
  Country varchar(40),
  Isreturn int,
  Revenue float

);

LOAD DATA INFILE 'E:/DA/projects/p1/1/Online_Retail_cleaned.csv'
INTO TABLE retail_analysis
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


select * from retail_analysis

1.Total Revenue
select sum(revenue) as totalrevenue from retail_analysis

2.Top customers
select Customerid,round(sum(revenue),2) as Totalsales 
from retail_analysis group by Customerid order by 
Totalsales  desc limit 10

3.Customer Purchase Frequency
SELECT customerid, COUNT(DISTINCT invoiceno) AS purchase_count
FROM retail_analysis
GROUP BY customerid
ORDER BY purchase_count DESC;

4.Sales Per Month
  select month(InvoiceDate) as month,sum(revenue) as Totalrevenue
 from retail_analysis
 group by  month(InvoiceDate) order by Totalrevenue desc limit 
 
5.How many unique customers?
select count(distinct customerid) as uniqcustomers from retail_analysis

6.How many total orders?
select count(*) as torders from retail_analysis

7.Which customers purchase most recently?
select customerid from retail_analysis order by invoicedate desc limit 1

8.Top 10 selling products
select StockCode,sum(revenue) as TotalRevenue
 from retail_analysis
 group by StockCode 
 order by TotalRevenue desc limit 10
 
 
 9.Products with high return rates
select stockcode,count(*) as totalreturns
 from retail_analysis
 where isreturn=1 
 group by stockcode
 order by totalreturns desc limit 1
 
 
 10.Which products generate the most revenue?
select StockCode,sum(revenue) as TotalRevenue
 from retail_analysis
 group by StockCode 
 order by TotalRevenue desc limit 1
 
  11.Highest Sale Month 
  select month(InvoiceDate) as month,sum(revenue) as Totalrevenue
 from retail_analysis where year(InvoiceDate)=2011
 group by  month(InvoiceDate) order by Totalrevenue desc limit 1
 
 
12. What day of week customers buy the most?
select dayname(InvoiceDate) as month,sum(revenue) as Totalrevenue
 from retail_analysis where year(InvoiceDate)=2011
 group by  dayname(InvoiceDate) order by Totalrevenue desc limit 1