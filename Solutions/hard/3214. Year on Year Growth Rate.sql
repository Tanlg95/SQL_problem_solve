-- Create Table if not exists user_transactions( transaction_id int, product_id int, spend decimal(10,2), 
-- transaction_date TIMESTAMP);
-- Truncate table user_transactions;
-- insert into user_transactions (transaction_id, product_id, spend, transaction_date) values ('1341', '123424', '1500.6', '2019-12-31 12:00:00');
-- insert into user_transactions (transaction_id, product_id, spend, transaction_date) values ('1423', '123424', '1000.2', '2020-12-31 12:00:00');
-- insert into user_transactions (transaction_id, product_id, spend, transaction_date) values ('1623', '123424', '1246.44', '2021-12-31 12:00:00');
-- insert into user_transactions (transaction_id, product_id, spend, transaction_date) values ('1322', '123424', '2145.32', '2022-12-31 12:00:00');

WITH CTE AS(
	SELECT 
		product_id,
		SUM(spend) spend,
		EXTRACT('year' FROM transaction_date) "year"
	FROM 
		user_transactions
	GROUP BY product_id, EXTRACT('year' FROM transaction_date)
)
SELECT
	year,
	product_id,
	spend curr_year_spend,
	LAG(spend) OVER(PARTITION BY product_id ORDER BY year) prev_year_spend,
	ROUND(((spend - LAG(spend) OVER(PARTITION BY product_id ORDER BY year)) / LAG(spend) OVER(PARTITION BY product_id ORDER BY year)) * 100 ,2) yoy_rate
FROM
	CTE
ORDER BY product_id, year
