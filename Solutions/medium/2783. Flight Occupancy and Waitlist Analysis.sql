-- Drop table if exists Flights;
-- Drop table if exists Passengers;
-- Create table if not exists Flights(flight_id int,capacity int);
-- Create table if not exists Passengers (passenger_id int,flight_id int);
-- Truncate table Flights;
-- insert into Flights (flight_id, capacity) values ('1', '2');
-- insert into Flights (flight_id, capacity) values ('2', '2');
-- insert into Flights (flight_id, capacity) values ('3', '1');
-- Truncate table Passengers;
-- insert into Passengers (passenger_id, flight_id) values ('101', '1');
-- insert into Passengers (passenger_id, flight_id) values ('102', '1');
-- insert into Passengers (passenger_id, flight_id) values ('103', '1');
-- insert into Passengers (passenger_id, flight_id) values ('104', '2');
-- insert into Passengers (passenger_id, flight_id) values ('105', '2');
-- insert into Passengers (passenger_id, flight_id) values ('106', '3');
-- insert into Passengers (passenger_id, flight_id) values ('107', '3');

--output:
| flight_id | booked_cnt | waitlist_cnt |
| --------- | ---------- | ------------ |
| 1         | 2          | 1            |
| 2         | 2          | 0            |
| 3         | 1          | 1            |

-- test case 2 ---

--Flights =
| flight_id | capacity |
| --------- | -------- |
| 53        | 1        |
| 4         | 3        |

--Passengers =
| passenger_id | flight_id |
| ------------ | --------- |
| 53           | 1         |
| 24           | 50        |

--output:
| flight_id | booked_cnt | waitlist_cnt |
| --------- | ---------- | ------------ |
| 4         | 0          | 0            |
| 53        | 0          | 0            |

-- test case 2 ---


-- solution 1:

WITH CTE AS(
	SELECT
		F.flight_id,
		F.capacity,
        passenger_id,
		ROW_NUMBER() OVER(PARTITION BY F.flight_id ORDER BY (SELECT NULL)) pass
	FROM
		Flights F
	LEFT JOIN
		Passengers P ON P.flight_id = F.flight_id
)
SELECT DISTINCT
	flight_id,
	COUNT( CASE WHEN capacity - pass >= 0 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) OVER (PARTITION  BY flight_id) booked_cnt,
	COUNT( CASE WHEN capacity - pass < 0 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) OVER (PARTITION  BY flight_id) waitlist_cnt
FROM 
	CTE
ORDER BY flight_id


-- solution 2: 

WITH CTE AS(
SELECT
	P.flight_id,
	SUM(1) OVER(PARTITION BY P.flight_id ORDER BY (SELECT NULL) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) total_Flight,
	capacity -	SUM(1) OVER(PARTITION BY P.flight_id  ORDER BY (SELECT NULL) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) total_Flight_remain
FROM
	Passengers P
LEFT JOIN
	Flights F ON P.flight_id = F.flight_id
)
, CTE2 AS(
	SELECT DISTINCT 
		flight_id,
		SUM(CASE WHEN total_flight_remain >= 0 THEN 1 ELSE 0 END) OVER(PARTITION BY flight_id) totalAccpt,
		SUM(CASE WHEN total_flight_remain < 0 THEN 1 ELSE 0 END) OVER(PARTITION BY flight_id) totalWait
	FROM
		CTE
)
SELECT
	F.flight_Id,
	COALESCE(C.totalAccpt,0) booked_cnt,
	COALESCE(C.totalWait,0) waitlist_cnt
FROM
	Flights F
LEFT JOIN
	CTE2 C ON F.flight_id = C.flight_id
ORDER BY F.flight_id
