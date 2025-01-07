use retail_sale;
show databases;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
# check null value
SELECT * FROM retail_sales
WHERE transactions_id IS NULL

SELECT * FROM retail_sales
WHERE sale_date IS NULL

SELECT * FROM retail_sales
WHERE sale_time IS NULL

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
# check null & delete values
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
show tables;
show databases;
select * from retail_sale limit 10;

SELECT 
    COUNT(*) 
FROM retail_sales

-- Data Cleaning

    
    select count(quantity)from retail_sale;
    
    # Data Exploration 
    # How many sales we have ?
    
    select count(*) as total_sale from retail_sale;  #Alias 
    
	# check how many unique category we have ?
    select count( category) as total_sale from retail_sale;
     select count(  Distinct category) as total_sale from retail_sale; #3
     
     ## check how many unique  customer_id we have ?
     select count(  Distinct customer_id) as total_sale from retail_sale; #155
     
     # check category name 
     select   Distinct category from retail_sale; #3
     
     # Data Analysis and Business key problem and answers 
     
     -- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



# 1 question ans --->
# Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sale where sale_date='2022-11-05';

 # Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022  
 select * from retail_sale where category='Clothing' AND quantity > 10;
 select * from retail_sale where category='Clothing' AND quantity > 10 AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';
 
 # Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 select 
 category,
 sum(total_sale) as net_sale,
 count(*) as total_orders
 from retail_sale
 group by 1; 
 
 #Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 select avg(age) from retail_sale where category='beauty';
 
# Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select transactions_id,total_sale from retail_sale where total_sale>1000;

# Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
#select gender, category,count(transactions_id)  as total_tran from retail_sale group by gender, category;
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM retail_sale
GROUP BY gender, category;

# Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, AVG(total_sale) AS average_sale
FROM retail_sale
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;

-# Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sale
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

# Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sale
GROUP BY category;

#Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT 
  CASE 
    WHEN HOUR(sale_time) <= 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(customer_id) AS number_of_orders
FROM retail_sale
GROUP BY shift;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------#


 


 
     
      
     
    
    
    
    
    
    
    

