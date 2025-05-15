# WALMART SALES DATA ANALYSIS WITH SQL- GROUP BY MASTERY  

## 📚 Project Overview  
This project demonstrates the power and versatility of the GROUP BY clause in SQL using a hypothetical Walmart sales dataset. The project covers various business problems, ranging from basic to advanced levels, providing a comprehensive understanding of data aggregation, filtering, and summarization.  

## 📁 Project Structure  
* Data Setup: Table creation for Walmart sales data.
* Basic Level Analysis: Simple grouping tasks like total sales per branch and average customer rating per city.
* Medium Level Analysis: More complex grouping like sales by gender and product line.
* Advanced Level Analysis: Time-based grouping and multi-condition filtering

## 📊 Dataset Schema  
```sql
CREATE TABLE walmart_sales (
    invoice_id VARCHAR(15),
    branch CHAR(1),
    city VARCHAR(25),
    customer_type VARCHAR(25),
    gender VARCHAR(15),
    product_line VARCHAR(55),
    unit_price FLOAT,
    quantity INT,
    VAT FLOAT,
    total FLOAT,
    date DATE,
    time TIME,
    payment_method VARCHAR(15),
    rating FLOAT
);
```
## 🚀 Business Problems  
**Basic Level**  
1.   Find the total sales amount for each branch.
2.  Calculate the average customer rating for each city.
3.  Count the number of sales transactions for each customer type.

**Medium Level** 
4.  Find the total sales amount and average customer rating for each branch.
5.  Calculate the total sale amount for each city and gender combination.
6.  Find the average quantity of products sold for each product line to male customers.
7.  Find the total sales amount for each day (return day name and order by amount).  

**Advanced Level**  
8. Calculate the total sales amount for each hour of the day.
9. Find the total sales amount for each month.  
10. Calculate the total sales amount for each branch where the average customer rating is greater than 7. 
11. Calculate total orders amount for morning (6 AM to 12 PM), afternoon (12 PM to 6 PM), and evening (6 PM to 12 AM) periods, excluding branch 'A'.  

## 💡 Key SQL Concepts Used  
* **GROUP BY** for data aggregation.
* **HAVING** for filtering grouped data.   
* **CASE** for creating custom group conditions.
* **ORDER BY** for sorting results.  
* **SUBQUERIES** for advanced grouping.  



