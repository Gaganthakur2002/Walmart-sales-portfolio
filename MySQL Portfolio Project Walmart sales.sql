-- Create database
CREATE DATABASE walmartSales;

-- Create table
CREATE TABLE sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
-- show details of the table--
select*from sales;
-- in which city is each branch?--
select branch, city from sales;
 -- or --
 select * from sales group by city;
 
 -- How many unique product lines does the data have?--
 select distinct product_line from sales;
 
-- what is the most selling product_line?--
select sum(quantity) as qty, product_line from sales group by product_line order by qty desc ;

-- What is the total revenue by month
select month_name AS month,
SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;

 -- adding the column monthname in the table since the column doesn't exist *
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

-- What is the most common payment method?--
select*from sales ;
select count(*) ,payment from sales group by payment  ;

-- What is the total revenue by date?
select sum(total), total, date from sales group by date;

alter table sales add column month varchar(25);
select * from sales;
update sales set month_name= monthname(date);

-- what month had the largest cogs?--
select month_name as month , sum(cogs) as cogs 
from sales group by month order by cogs ;

-- which product line has the highest revenue ?-- 
select sum(total) as revenue , product_line from sales 
group by product_line order by revenue ;

-- What product line had the largest VAT? --
select product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

select avg(quantity) as avg_quantity from sales ;
select product_line , case when avg(quantity)> 6 then "good"
 else 
 "bad" end as remark from sales group by product_line ;
  
 -- Which branch sold more products than average product sold?

 select sum(quantity) as total_qty ,avg(quantity) , branch from sales group by branch;
 
 -- What is the most common product line by gender
select count(*), product_line, gender from sales group by gender ;

-- What is the average rating of each product line
select avg(rating), product_line 
from 
sales group by product_line ;

-- How many unique customer_types does the data have?
select  distinct customer_type from sales;

-- How many unique payment methods does the data have?
select  distinct payment from sales;

-- What is the most common customer type?
select count(*) , customer_type from sales group by customer_type;
-- Which customer type buys the most?
select sum(quantity) , customer_type from sales 
group by customer_type ;

-- What is the gender of most of the customers?
select count(*), gender from sales group by gender;

-- What is the gender distribution per branch?
select count(gender) ,gender , branch from sales group by gender ;

-- Which time of the day do customers give most ratings?
select count(*) as numer_of_employees, 
time from sales group by time order by count(*) desc ;

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_sales
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_sales DESC;

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax;

        -- END--