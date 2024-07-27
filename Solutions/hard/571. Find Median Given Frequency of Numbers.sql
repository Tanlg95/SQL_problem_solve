Create table If Not Exists Numbers (num int, frequency int);
Truncate table Numbers;
insert into Numbers (num, frequency) values ('0', '7');
insert into Numbers (num, frequency) values ('1', '1');
insert into Numbers (num, frequency) values ('2', '3');
insert into Numbers (num, frequency) values ('3', '1');

--output:
| median |
| ------ |
| 0      |

-- test case 2 -- begin

| num | frequency |
| --- | --------- |
| 1   | 3         |
| 2   | 3         |

--output:

| median |
| ------ |
| 1.5    |

-- test case 2 -- end

-- test case 3 -- begin

| num | frequency |
| --- | --------- |
| 0   | 1         |
| 1   | 1         |
| 2   | 1         |
| 3   | 1         |
| 4   | 1         |

--output:

| median |
| ------ |
| 2      |

-- test case 3 -- end

-- test case 4 -- begin

| num | frequency |
| --- | --------- |
| 2   | 1         |
| 0   | 1         |
| 1   | 1         |
| 3   | 1         |
| 4   | 1         |

--output:

| median |
| ------ |
| 2      |

-- test case 4 -- end

-- solution:

WITH CTE AS(
SELECT
	*,
	CAST( REPEAT(CAST(num AS VARCHAR(4000)) || ' ', frequency) AS VARCHAR(4000)) string
FROM
	Numbers
ORDER BY num
)
, CTE2 AS(
SELECT
	CAST(parts AS INT) parts,
	ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) keyid,
	COUNT(1) OVER() / 2 totalNumDV2,
	COUNT(1) OVER() % 2.0 totalNumDV,
    CASE WHEN COUNT(1) OVER() % 2.0  = 0 THEN 2.0 ELSE 1.0 END di
FROM
	(
	SELECT
	unnest(string_to_array(string, ' ')) AS parts
	FROM
		CTE) sub
    WHERE
        parts <> ''
)
SELECT
	ROUND(SUM(parts) / di ,1)  median 
FROM
	CTE2
WHERE
	(	totalNumDV  = 0.0 AND (keyid = totalNumDV2 + 1 OR keyid = totalNumDV2))
	OR
	(	totalNumDV  <> 0.0 AND keyid = FLOOR(totalNumDV2) + 1)
GROUP BY di