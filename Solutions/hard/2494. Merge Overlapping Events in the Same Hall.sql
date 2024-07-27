Create table If Not Exists HallEvents (hall_id int, start_day date, end_day date);
Truncate table HallEvents;
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-13', '2023-01-14');
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-14', '2023-01-17');
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-18', '2023-01-25');
insert into HallEvents (hall_id, start_day, end_day) values ('2', '2022-12-09', '2022-12-23');
insert into HallEvents (hall_id, start_day, end_day) values ('2', '2022-12-13', '2022-12-17');
insert into HallEvents (hall_id, start_day, end_day) values ('3', '2022-12-01', '2023-01-30');

---test case 2---- begin

| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 2       | 2022-12-09 | 2023-01-02 |
| 5       | 2022-12-01 | 2022-12-02 |
| 2       | 2023-01-12 | 2023-01-14 |
| 3       | 2022-12-01 | 2022-12-19 |
| 4       | 2022-12-29 | 2022-12-31 |
| 5       | 2022-12-22 | 2023-01-18 |
| 5       | 2022-12-04 | 2022-12-18 |
| 2       | 2022-12-29 | 2023-01-24 |
| 2       | 2022-12-20 | 2023-01-09 |
| 6       | 2022-12-08 | 2022-12-31 |
| 1       | 2022-12-14 | 2022-12-22 |
| 5       | 2023-01-15 | 2023-01-27 |
| 1       | 2022-12-07 | 2023-01-03 |
| 1       | 2022-12-30 | 2023-01-27 |
| 5       | 2022-12-01 | 2023-01-22 |
| 3       | 2022-12-29 | 2022-12-30 |
| 3       | 2023-01-04 | 2023-01-05 |
| 4       | 2022-12-12 | 2022-12-17 |

--output
| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 1       | 2022-12-07 | 2023-01-27 |
| 2       | 2022-12-09 | 2023-01-24 |
| 3       | 2022-12-01 | 2022-12-19 |
| 3       | 2022-12-29 | 2022-12-30 |
| 3       | 2023-01-04 | 2023-01-05 |
| 4       | 2022-12-12 | 2022-12-17 |
| 4       | 2022-12-29 | 2022-12-31 |
| 5       | 2022-12-01 | 2023-01-27 |
| 6       | 2022-12-08 | 2022-12-31 |

---test case 2---- end

---test case 3---- end
| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 6       | 2023-01-03 | 2023-01-19 |
| 1       | 2022-12-27 | 2023-01-06 |
| 18      | 2023-01-23 | 2023-01-25 |
| 14      | 2023-01-29 | 2023-01-31 |
| 10      | 2022-12-25 | 2023-01-15 |
| 11      | 2022-12-02 | 2022-12-18 |
| 7       | 2022-12-14 | 2023-01-12 |
| 9       | 2022-12-18 | 2023-01-23 |
| 7       | 2023-01-02 | 2023-01-14 |
| 9       | 2023-01-02 | 2023-01-28 |
| 20      | 2022-12-12 | 2022-12-13 |
| 18      | 2022-12-22 | 2023-01-07 |
| 19      | 2022-12-11 | 2022-12-20 |
| 19      | 2022-12-05 | 2023-01-29 |
| 21      | 2022-12-31 | 2023-01-27 |
| 2       | 2023-01-06 | 2023-01-20 |
| 19      | 2022-12-13 | 2023-01-27 |
| 12      | 2023-01-13 | 2023-01-26 |
| 17      | 2022-12-27 | 2023-01-05 |
| 12      | 2022-12-24 | 2023-01-04 |
| 20      | 2022-12-16 | 2023-01-30 |
| 9       | 2022-12-11 | 2023-01-13 |
| 7       | 2022-12-24 | 2022-12-26 |
| 8       | 2022-12-26 | 2023-01-03 |
| 20      | 2022-12-22 | 2023-01-04 |
| 6       | 2022-12-13 | 2023-01-08 |
| 3       | 2022-12-23 | 2023-01-13 |
| 15      | 2022-12-26 | 2023-01-10 |
| 12      | 2022-12-18 | 2023-01-10 |
| 2       | 2022-12-29 | 2023-01-07 |
| 10      | 2022-12-03 | 2022-12-14 |
| 18      | 2022-12-27 | 2023-01-30 |
| 21      | 2022-12-07 | 2023-01-11 |
| 17      | 2022-12-13 | 2022-12-17 |
| 13      | 2023-01-29 | 2023-01-30 |
| 10      | 2022-12-02 | 2023-01-19 |
| 18      | 2022-12-28 | 2023-01-04 |
| 20      | 2023-01-20 | 2023-01-22 |
| 17      | 2022-12-08 | 2023-01-17 |
| 8       | 2022-12-01 | 2023-01-03 |
| 19      | 2022-12-20 | 2023-01-27 |
| 19      | 2023-01-03 | 2023-01-14 |
| 2       | 2023-01-25 | 2023-01-26 |
| 7       | 2022-12-19 | 2022-12-30 |
| 4       | 2022-12-13 | 2022-12-22 |
| 2       | 2022-12-25 | 2023-01-30 |
| 17      | 2022-12-11 | 2023-01-27 |
| 1       | 2022-12-09 | 2023-01-31 |
| 9       | 2022-12-06 | 2023-01-10 |
| 1       | 2022-12-26 | 2023-01-01 |
| 12      | 2022-12-22 | 2023-01-18 |
| 2       | 2022-12-02 | 2022-12-08 |
| 5       | 2022-12-16 | 2022-12-20 |
| 15      | 2023-01-21 | 2023-01-29 |
| 5       | 2022-12-13 | 2023-01-09 |
| 16      | 2022-12-17 | 2023-01-09 |
| 1       | 2023-01-14 | 2023-01-15 |
| 4       | 2022-12-10 | 2023-01-12 |
| 21      | 2022-12-15 | 2022-12-18 |
| 18      | 2022-12-20 | 2023-01-10 |
| 7       | 2022-12-13 | 2023-01-08 |
| 18      | 2022-12-27 | 2022-12-30 |
| 3       | 2022-12-21 | 2023-01-09 |
| 10      | 2022-12-18 | 2023-01-31 |

--output
| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 1       | 2022-12-09 | 2023-01-31 |
| 2       | 2022-12-02 | 2022-12-08 |
| 2       | 2022-12-25 | 2023-01-30 |
| 3       | 2022-12-21 | 2023-01-13 |
| 4       | 2022-12-10 | 2023-01-12 |
| 5       | 2022-12-13 | 2023-01-09 |
| 6       | 2022-12-13 | 2023-01-19 |
| 7       | 2022-12-13 | 2023-01-14 |
| 8       | 2022-12-01 | 2023-01-03 |
| 9       | 2022-12-06 | 2023-01-28 |
| 10      | 2022-12-02 | 2023-01-31 |
| 11      | 2022-12-02 | 2022-12-18 |
| 12      | 2022-12-18 | 2023-01-26 |
| 13      | 2023-01-29 | 2023-01-30 |
| 14      | 2023-01-29 | 2023-01-31 |
| 15      | 2022-12-26 | 2023-01-10 |
| 15      | 2023-01-21 | 2023-01-29 |
| 16      | 2022-12-17 | 2023-01-09 |
| 17      | 2022-12-08 | 2023-01-27 |
| 18      | 2022-12-20 | 2023-01-30 |
| 19      | 2022-12-05 | 2023-01-29 |
| 20      | 2022-12-12 | 2022-12-13 |
| 20      | 2022-12-16 | 2023-01-30 |
| 21      | 2022-12-07 | 2023-01-27 |
---test case 3---- end

---test case 4---- end
| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 6       | 2023-01-01 | 2023-01-11 |
| 4       | 2023-01-10 | 2023-01-18 |
| 4       | 2022-12-05 | 2022-12-30 |
| 7       | 2023-01-19 | 2023-01-30 |
| 8       | 2022-12-23 | 2023-01-13 |
| 5       | 2022-12-29 | 2023-01-27 |
| 5       | 2022-12-13 | 2022-12-15 |
| 10      | 2022-12-14 | 2022-12-27 |
| 6       | 2022-12-04 | 2023-01-07 |
| 3       | 2022-12-24 | 2023-01-24 |
| 7       | 2023-01-17 | 2023-01-26 |
| 9       | 2022-12-13 | 2023-01-12 |
| 4       | 2022-12-25 | 2023-01-23 |
| 5       | 2023-01-06 | 2023-01-25 |
| 7       | 2022-12-06 | 2022-12-09 |
| 2       | 2022-12-01 | 2022-12-03 |
| 5       | 2022-12-31 | 2023-01-07 |
| 3       | 2022-12-26 | 2022-12-28 |
| 3       | 2022-12-17 | 2023-01-09 |
| 2       | 2022-12-29 | 2023-01-17 |
| 7       | 2022-12-09 | 2023-01-30 |
| 4       | 2022-12-16 | 2023-01-26 |
| 7       | 2023-01-02 | 2023-01-20 |
| 6       | 2022-12-11 | 2023-01-18 |
| 2       | 2023-01-15 | 2023-01-30 |
| 5       | 2023-01-11 | 2023-01-22 |
| 6       | 2022-12-28 | 2023-01-19 |
| 6       | 2022-12-23 | 2023-01-16 |
| 5       | 2022-12-20 | 2023-01-14 |
| 9       | 2022-12-13 | 2022-12-14 |

--output
| hall_id | start_day  | end_day    |
| ------- | ---------- | ---------- |
| 2       | 2022-12-01 | 2022-12-03 |
| 2       | 2022-12-29 | 2023-01-30 |
| 3       | 2022-12-17 | 2023-01-24 |
| 4       | 2022-12-05 | 2023-01-26 |
| 5       | 2022-12-13 | 2022-12-15 |
| 5       | 2022-12-20 | 2023-01-27 |
| 6       | 2022-12-04 | 2023-01-19 |
| 7       | 2022-12-06 | 2023-01-30 |
| 8       | 2022-12-23 | 2023-01-13 |
| 9       | 2022-12-13 | 2023-01-12 |
| 10      | 2022-12-14 | 2022-12-27 |

---test case 4---- end

-- solution 1:


WITH CTE AS(
	SELECT
		hall_id,
		start_day,
		end_day,
		LAG(start_day) OVER(PARTITION BY hall_id ORDER BY start_day) pre_start_day,
		LAG(end_day) OVER(PARTITION BY hall_id ORDER BY start_day) pre_end_day,
		MIN(start_day) OVER(PARTITION BY hall_id ORDER BY start_day ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING  ) min_day,
 		MAX(end_day) OVER(PARTITION BY hall_id ORDER BY start_day ROWS BETWEEN UNBOUNDED PRECEDING AND  1 PRECEDING  ) max_day
	FROM
		HallEvents
)
, CTE2 AS(
	SELECT 
		hall_id ,
		start_day,
		end_day,
		pre_start_day,
		pre_end_day,
		CASE WHEN start_day <= max_day THEN 1 ELSE 0 END check_cc
	FROM
		CTE 
	WHERE 
		pre_start_day IS NOT NULL
)
, CTE3 AS(
SELECT 
 	* 
FROM (
		SELECT DISTINCT hall_id FROM CTE2
	)sub
LEFT JOIN LATERAL(
	WITH CTESUB AS(
		SELECT
			hall_id ,
            start_day,
            end_day,
            pre_start_day,
            pre_end_day,
            check_cc,
            ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) keyid
		FROM(
			SELECT 99999999 hall_id, '1900-01-01' start_day, '1900-01-01' end_day, '1900-01-01' pre_start_day, '1900-01-01' pre_end_day , 0 check_cc
			UNION ALL
			SELECT
				hall_id, start_day, end_day, pre_start_day, pre_end_day, check_cc
			FROM
				CTE2 C 
			WHERE 	C.hall_id = sub.hall_id 
			UNION ALL
			SELECT 99999999 hall_id, '2500-01-01' start_day, '2500-01-01' end_day, '2500-01-01' pre_start_day, '2500-01-01' pre_end_day , 0 check_cc
		)sub1
	)
	,CTESUB1 AS(
		SELECT
			hall_id, start_day, end_day, pre_start_day, pre_end_day, check_cc, keyid,
			LEAD(keyid) OVER(ORDER BY (SELECT NULL)) next_keyid
		FROM
			CTESUB
		WHERE
			check_cc = 0
	)
	SELECT ctesub.keydiff ,
		MIN(CASE WHEN subs.start_day < subs.pre_start_day THEN subs.start_day ELSE subs.pre_start_day END ) min_start_day,
		MAX(CASE WHEN subs.end_day > subs.pre_end_day THEN subs.end_day ELSE subs.pre_end_day END ) max_end_day
	FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) keydiff FROM CTESUB1) ctesub
	LEFT JOIN LATERAL( SELECT * FROM CTESUB ccb WHERE ccb.keyid BETWEEN ctesub.keyid + 1 AND ctesub.next_keyid - 1) subs ON TRUE
	WHERE subs.hall_id IS NOT NULL
	GROUP BY subs.hall_id, ctesub.keydiff
) L ON TRUE
ORDER BY sub.hall_id
)
SELECT
	hall_id,
	start_day,
	end_day
FROM
	HallEvents H
WHERE
	NOT EXISTS (
		SELECT 
			1
		FROM 
			CTE3 C WHERE H.hall_id = C.hall_id AND (H.start_day BETWEEN C.min_start_day AND C.max_end_day
			OR H.end_day BETWEEN C.min_start_day AND C.max_end_day)
	)
UNION ALL
SELECT
	hall_id,
	min_start_day,
	max_end_day
FROM 
	CTE3
ORDER BY hall_id, start_day

-- solution 2:


WITH
    starts AS
    (
        SELECT
            h1.hall_id,
            h1.start_day,
            RANK() OVER (PARTITION BY hall_id ORDER BY h1.start_day) AS id
        FROM
            hallevents AS h1
        LEFT JOIN
            hallevents AS h2
        ON
            h1.hall_id = h2.hall_id AND
            h1.start_day > h2.start_day
        GROUP BY
            h1.hall_id,
            h1.start_day
        HAVING
            IFNULL(MAX(h2.end_day), '1900-01-01') < h1.start_day
    ),
    ends AS
    (
        SELECT
            h1.hall_id,
            h1.end_day,
            RANK() OVER (PARTITION BY hall_id ORDER BY h1.end_day) AS id
        FROM
            hallevents AS h1
        LEFT JOIN
            hallevents AS h2
        ON
            h1.hall_id = h2.hall_id AND
            h1.end_day < h2.end_day
        GROUP BY
            h1.hall_id,
            h1.end_day
        HAVING
            IFNULL(MIN(h2.start_day), '2100-01-01') > h1.end_day
    )
SELECT
    s.hall_id,
    start_day,
    end_day
FROM
    starts AS s
JOIN
    ends AS e
USING
    (hall_id, id)

-- solution 3:

SELECT 
       s1.start_day,
       MIN(t1.end_day) AS end_day,
       s1.hall_id
FROM HallEvents s1 
INNER JOIN HallEvents t1 ON s1.start_day <= t1.end_day AND s1.hall_id = t1.hall_id
  AND NOT EXISTS(SELECT * FROM HallEvents t2 
                 WHERE t1.end_day >= t2.start_day AND t1.end_day < t2.end_day AND s1.hall_id = t2.hall_id) 
WHERE NOT EXISTS(SELECT * FROM HallEvents s2 
                 WHERE s1.start_day > s2.start_day AND s1.start_day <= s2.end_day AND s1.hall_id = s2.hall_id) 
GROUP BY s1.start_day, s1.hall_id
ORDER BY s1.start_day, s1.hall_id