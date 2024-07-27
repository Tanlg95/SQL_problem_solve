Create table If Not Exists Calls (caller_id int, recipient_id int, call_time datetime);
Truncate table Calls;
insert into Calls (caller_id, recipient_id, call_time) values ('8', '4', '2021-08-24 17:46:07');
insert into Calls (caller_id, recipient_id, call_time) values ('4', '8', '2021-08-24 19:57:13');
insert into Calls (caller_id, recipient_id, call_time) values ('5', '1', '2021-08-11 05:28:44');
insert into Calls (caller_id, recipient_id, call_time) values ('8', '3', '2021-08-17 04:04:15');
insert into Calls (caller_id, recipient_id, call_time) values ('11', '3', '2021-08-17 13:07:00');
insert into Calls (caller_id, recipient_id, call_time) values ('8', '11', '2021-08-17 22:22:22');

-- output
+---------+
| user_id |
+---------+
| 1       |
| 4       |
| 5       |
| 8       |
+---------+

-- test case 2 -- begin

| caller_id | recipient_id | call_time           |
| --------- | ------------ | ------------------- |
| 8         | 4            | 2021-08-24 17:46:07 |
| 4         | 8            | 2021-08-24 19:57:13 |
| 5         | 1            | 2021-08-11 05:28:44 |
| 8         | 3            | 2021-08-17 04:04:15 |
| 11        | 3            | 2021-08-17 13:07:00 |
| 8         | 11           | 2021-08-17 22:22:22 |
| 8         | 3            | 2021-08-17 23:22:22 |

-- output:

| user_id |
| ------- |
| 1       |
| 3       |
| 4       |
| 5       |
| 8       |

-- test case 2 -- end

-- test case 3 -- begin

| caller_id | recipient_id | call_time           |
| --------- | ------------ | ------------------- |
| 10        | 35           | 2021-09-11 23:05:50 |
| 27        | 15           | 2021-09-12 22:55:17 |
| 23        | 34           | 2021-09-13 21:47:08 |
| 5         | 28           | 2021-09-12 02:10:44 |
| 36        | 30           | 2021-09-12 16:14:24 |
| 24        | 30           | 2021-09-11 10:33:54 |
| 33        | 1            | 2021-09-09 10:32:49 |
| 11        | 12           | 2021-09-10 09:50:28 |
| 33        | 24           | 2021-09-12 12:15:38 |
| 28        | 30           | 2021-09-13 11:35:12 |
| 8         | 7            | 2021-09-12 05:07:39 |

-- output:

| user_id |
| ------- |
| 1       |
| 5       |
| 7       |
| 8       |
| 10      |
| 11      |
| 12      |
| 15      |
| 23      |
| 24      |
| 27      |
| 28      |
| 30      |
| 33      |
| 34      |
| 35      |
| 36      |


-- test case 3 -- end

-- test case 4 -- begin

| caller_id | recipient_id | call_time           |
| --------- | ------------ | ------------------- |
| 2         | 8            | 2021-09-10 04:12:59 |
| 21        | 33           | 2021-09-11 17:06:10 |
| 22        | 6            | 2021-09-13 08:41:47 |
| 4         | 10           | 2021-09-13 19:58:50 |
| 15        | 21           | 2021-09-10 14:25:58 |
| 37        | 4            | 2021-09-09 07:47:46 |
| 35        | 15           | 2021-09-09 02:35:49 |
| 23        | 6            | 2021-09-11 02:47:07 |
| 29        | 36           | 2021-09-13 12:56:52 |
| 11        | 21           | 2021-09-11 08:37:01 |
| 8         | 2            | 2021-09-10 14:25:08 |
| 13        | 9            | 2021-09-13 15:00:11 |
| 17        | 26           | 2021-09-13 19:13:05 |
| 9         | 5            | 2021-09-11 20:25:34 |
| 4         | 26           | 2021-09-09 17:55:26 |
| 15        | 9            | 2021-09-13 19:57:07 |

-- output:

| user_id |
| ------- |
| 2       |
| 4       |
| 5       |
| 6       |
| 8       |
| 9       |
| 10      |
| 11      |
| 13      |
| 15      |
| 17      |
| 21      |
| 22      |
| 23      |
| 26      |
| 29      |
| 33      |
| 35      |
| 36      |
| 37      |

-- test case 4 -- end



-- solution:

WITH CTE AS(
	SELECT
		caller_id,
		recipient_id,
		date_format(call_time,'%Y-%m-%d') call_day,
        call_time
	FROM
		Calls
	UNION ALL
	SELECT
		recipient_id,
		caller_id,
		date_format(call_time,'%Y-%m-%d') call_day,
        call_time
	FROM
		Calls
)
,CTE2 AS (
	SELECT 
		*,
		DENSE_RANK() OVER(PARTITION BY caller_id, call_day ORDER BY call_time) rank_min,
			DENSE_RANK() OVER(PARTITION BY caller_id, call_day ORDER BY call_time DESC) rank_max
	FROM CTE
)
SELECT
	caller_id,
    COUNT(DISTINCT recipient_id) totalRecep
FROM
	CTE2
WHERE
	rank_max = 1 OR rank_min = 1
GROUP BY caller_id, call_day
HAVING  COUNT(DISTINCT recipient_id) = 1
ORDER BY caller_id

