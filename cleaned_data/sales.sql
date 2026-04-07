SELECT * FROM video_games_sales LIMIT 1000;

-- duplicate table 
CREATE TABLE sales_cleaned 
AS SELECT * FROM sales;

-- drop columns not needed
ALTER TABLE sales_cleaned
DROP COLUMN img, 
DROP COLUMN release_date,
DROP COLUMN last_update;

-- rename the columns
ALTER TABLE sales_cleaned
RENAME COLUMN release_date_cleaned TO release_date;

ALTER TABLE sales_cleaned
RENAME COLUMN last_update_cleaned TO last_update;

SELECT * FROM sales_cleaned LIMIT 1000;





