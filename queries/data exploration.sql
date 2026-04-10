-- Data Exploration
-- Sales are in millions 
/*  
1. Top Performing Games by Region
Write a query to find the top 5 games with the highest total sales in North America (na_sales).

Requirements:
Show: title, console, na_sales
Order from highest to lowest
Limit to 5 results 
*/

SELECT * FROM sales_cleaned LIMIT 1000;

SELECT 
	title, 
    console, 
    na_sales
FROM sales_cleaned
ORDER BY na_sales
DESC
LIMIT 5;

/* 
2. Genre Popularity by Total Sales

Which genre has generated the most total global sales?

Requirements:

Show: genre, total sum of total_sales
Sort descending
Return only the top genre
*/

SELECT 
	genre, 
	ROUND(SUM(total_sales) ,2) AS total_global_sales
FROM sales_cleaned 
GROUP BY genre
ORDER BY total_global_sales
DESC
LIMIT 1;

/* 3. Publisher Performance (with Filtering)

Find publishers that have:

Released at least 10 games
AND have average total sales > 1 million

Requirements:

Show: publisher, number of games, average total_sales
Sort by average sales descending
*/

SELECT 
	publisher, 
    COUNT(title) as total_games, 
    ROUND(AVG(total_sales), 2) as avg_total_sales
FROM sales_cleaned
GROUP BY publisher
HAVING avg(total_sales) > 1.0
ORDER by avg_total_sales
DESC;

/*
4. Yearly Sales Trend

Analyze how the industry performed over time.

Task:
Find the total global sales per year.

Requirements:

Extract year from release_date
Show: year, total total_sales
Sort by year ascending
*/

SELECT 
	RIGHT(release_date, 4) AS release_year,
    ROUND(SUM(total_sales), 2) AS global_total_sales
FROM sales_cleaned
GROUP BY release_year
ORDER BY release_year
ASC;

/*
5. High-Quality vs High-Sales Games

Identify games that are both:

Critically well-received AND commercially successful

Task:
Find games where:

critic_score is above the average critic score
AND total_sales is above the average total sales

Show: title, critic_score, total_sales
Use subqueries or CTEs
Sort by total_sales descending
*/

WITH avg_values AS(
SELECT
	AVG(critic_score) AS avg_score,
    AVG(total_sales) AS avg_sales
FROM sales_cleaned
)
SELECT title, critic_score, total_sales
FROM sales_cleaned s
CROSS JOIN avg_values a
WHERE s.critic_score > a.avg_score 
AND s.total_sales > a.avg_sales
ORDER BY total_sales DESC;
