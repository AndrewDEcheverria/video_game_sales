# World Video Game Sales and Industry Data

This is a dataset from kaggle [here](https://www.kaggle.com/datasets/bhushandivekar/video-game-sales-and-industry-data-1980-2024).
Showing the video game industry's sales and progression from 1980-2024.

<br>

I have a few simple questions about the industry for analysing this data below as well as any cleaning to the data that was done.

Software used: <B>BigQuery<B>

## Question and answer

**1. Top Performing Games by Region<br>
Write a query to find the top 5 games with the highest total sales in North America (na_sales).**

Requirements:
Show: title, console, na_sales
Order from highest to lowest
Limit to 5 results 

```sql
SELECT * FROM sales_cleaned LIMIT 1000;

SELECT 
	title, 
    console, 
    na_sales
FROM sales_cleaned
ORDER BY na_sales
DESC
LIMIT 5;
```

### Results

<img width="584" height="159" alt="Q1Results" src="https://github.com/user-attachments/assets/9a3da6aa-decb-4ef3-a84c-0d7ca89a3241" />

***
**2. Genre Popularity by Total Sales<br><br>
Which genre has generated the most total global sales?**

Requirements:

Show: genre, total sum of total_sales
Sort descending
Return only the top genre

```sql
SELECT 
	genre, 
	ROUND(SUM(total_sales) ,2) AS total_global_sales
FROM sales_cleaned 
GROUP BY genre
ORDER BY total_global_sales
DESC
LIMIT 1;
```

### Results

<img width="383" height="52" alt="Q2" src="https://github.com/user-attachments/assets/51348a0b-c48c-46bd-bad9-6d7c7049e5cb" />

***
**3. Publisher Performance**

Find publishers that have:

Released at least 10 games
AND have average total sales > 1 million

Requirements:

Show: publisher, number of games, average total_sales
Sort by average sales descending

```sql
SELECT 
	publisher, 
    COUNT(title) as total_games, 
    ROUND(AVG(total_sales), 2) as avg_total_sales
FROM sales_cleaned
GROUP BY publisher
HAVING avg(total_sales) > 1.0
AND
total_games >= 10
ORDER by avg_total_sales
DESC;
```

### Results

<img width="508" height="348" alt="Q3publisherPerformance" src="https://github.com/user-attachments/assets/c10a76fa-78d9-4f5d-9df6-c6d0dd3deed0" />

***
**4. Yearly Sales Trend**

Analyze how the industry performed over time.

Task:
Find the total global sales per year.

Requirements:

Extract year from release_date
Show: year, total total_sales
Sort by year ascending

```sql
SELECT 
	RIGHT(release_date, 4) AS release_year,
    ROUND(SUM(total_sales), 2) AS global_total_sales
FROM sales_cleaned
GROUP BY release_year
ORDER BY release_year
ASC;
```
This one gave me issues with the release_date being a STRING date type instead of DATE, so if it is a date, use this query instead of the one above 
```sql
SELECT 
    EXTRACT(YEAR FROM release_date) AS release_year,
    ROUND(SUM(total_sales), 2) AS global_total_sales
FROM sales_cleaned
GROUP BY release_year
ORDER BY release_year
ASC;
```

### Results
Top 20
<img width="380" height="705" alt="GlobalSales" src="https://github.com/user-attachments/assets/c8b86b7b-f25b-403b-ad80-95a285fc517d" />


***

**5. High-Quality vs High-Sales Games**

Identify games that are both:

Critically well-received AND commercially successful

Task:
Find games where:

critic_score is above the average critic score
AND total_sales is above the average total sales

Show: title, critic_score, total_sales
Sort by total_sales descending

```sql
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
```
## Results
Top 20 rows
<img width="504" height="564" alt="Q5" src="https://github.com/user-attachments/assets/0a71aab5-42ce-424f-a1cd-8eafc26b6fbd" />














