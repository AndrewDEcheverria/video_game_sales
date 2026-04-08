-- Data Exploration

/*  
1. Top Performing Games by Region
Write a query to find the top 5 games with the highest total sales in North America (na_sales).

Requirements:
Show: title, console, na_sales
Order from highest to lowest
Limit to 5 results 
*/

SELECT * FROM sales_cleaned LIMIT 1000;

SELECT title, console, na_sales
FROM sales_cleaned
ORDER BY na_sales
DESC
LIMIT 5;
