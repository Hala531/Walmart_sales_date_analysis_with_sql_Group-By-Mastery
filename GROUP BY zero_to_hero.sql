--GROUP BY in sql 

DROP TABLE IF EXISTS walmart_sales; 
CREATE TABLE walmart_sales(
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

SELECT*FROM walmart_sales 


-----Business problems 

--basic level 
--1. find the total sales amount for each branch 
SELECT 
branch, 
SUM(total)
FROM walmart_sales
GROUP BY 1 

--2 . calculate the average customer rating for each city 

SELECT 
city, 
ROUND(AVG(rating), 2)
FROM 
walmart_sales
GROUP BY city
ORDER BY ratings 

--3. count the number of sales transactions for each customer type 
SELECT 
customer_type, 
COUNT(invoice_id) as number_of_sale_transactions
FROM 
walmart_sales 
GROUP BY customer_type  

---Medium level  
--4. Find the total sales amount  and average customer rating for each branch 

SELECT 
branch, 
SUM(total) AS total_sales, 
ROUND(AVG(rating), 2) AS avg_rating
FROM 
walmart_sales 
GROUP BY branch  

--5. calculate the total sale amount for each city and gender combination 
SELECT 
city, 
gender, 
SUM(total) AS total_sales 
FROM walmart_sales 
GROUP BY 1,2
ORDER BY 1 
--6. find the average quantity of products sold for each product line to female customers 
SELECT 
product_line, 
ROUND(AVG(quantity), 2)
FROM walmart_sales 
WHERE gender = 'Male'
GROUP BY  product_line
--7. find the total sales amout for each day(return day name and their total sales order DESC by amout)
SELECT 
TO_CHAR(date, 'Day') as day_name
SUM(amount)
FROM 
walmart_sales 
GROUP BY 1 
ORDER BY amount DESC 


---advanced
--8. Calculate the total sales amount for each hour of the day 

SELECT 
EXTRACT(HOUR FROM time) as hours
SUM(amount) as total_sale
FROM walmart_sales 
GROUP BY 1 
ORDER BY 2 
--9. find the total_sales amount for each month 
SELECT
TO_CHAR(date, 'Mont') as month_name
SUM(amount) as total_sales 
FROM walmart_sales 
GROUP BY 1, 
ORDER BY total_sales DESC  
--10. calculate the total sales amount for each branch where the average customer rating is greater than 7 
SELECT 
branch, 
ROUND(AVG(rating), 2)
SUM(amount)
FROM walmart_sales 
HAVING ROUND(AVG(rating), 2)> 7
--11. calculate total orders amount for morning(6 AM to 12 pm), afternoon(12 pm to 6 pm) and evening (6 pm to 12 pm) periods using the times conditions 
WITH new_table 
AS
(
SELECT*, 
    CASE
	    WHEN EXTRACT(HOUR FROM time) BETWEEN 6 AND 12 THEN 'morning'
		WHEN EXTRACT(HOUR FROM time) > 12 AND EXTRACT(HOUR FROM time)<=18 THEN 'afternoon'
		ELSE 'evening'
	END as shift
FROM walmart_sales	--table dont les colonnes sont les colonnes de walmart + la colonne shift
)
SELECT 
   shift,  
   SUM(total) AS total_sales,
   COUNT(invoice_id) as total_orders
   FROM new_table
   WHERE branch <> 'A' --sélectionner toutes les lignes où la colonne branch n'est pas égale à 'A'
   GROUP BY shift
   HAVING COUNT(invoice_id) < 5000 
   
   

