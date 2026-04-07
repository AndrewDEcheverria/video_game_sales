-- duplicate table 
CREATE TABLE video_games_sales_cleaned 
AS SELECT * FROM video_games_sales;

-- drop columns not needed
ALTER TABLE video_games_sales_cleaned
DROP COLUMN img, 
DROP COLUMN release_date,
DROP COLUMN last_update;

-- rename the columns
ALTER TABLE video_games_sales_cleaned
RENAME COLUMN release_date_cleaned TO release_date;

ALTER TABLE video_games_sales_cleaned
RENAME COLUMN last_update_cleaned TO last_update;

SELECT * FROM video_games_sales_cleaned;



