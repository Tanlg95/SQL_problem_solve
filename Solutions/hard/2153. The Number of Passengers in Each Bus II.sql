Create table If Not Exists Buses (bus_id int, arrival_time int, capacity int);
Create table If Not Exists Passengers (passenger_id int, arrival_time int);
Truncate table Buses;
insert into Buses (bus_id, arrival_time, capacity) values ('1', '2', '1');
insert into Buses (bus_id, arrival_time, capacity) values ('2', '4', '10');
insert into Buses (bus_id, arrival_time, capacity) values ('3', '7', '2');
Truncate table Passengers;
insert into Passengers (passenger_id, arrival_time) values ('11', '1');
insert into Passengers (passenger_id, arrival_time) values ('12', '1');
insert into Passengers (passenger_id, arrival_time) values ('13', '5');
insert into Passengers (passenger_id, arrival_time) values ('14', '6');
insert into Passengers (passenger_id, arrival_time) values ('15', '7');

-- output

| bus_id | passengers_cnt |
| ------ | -------------- |
| 1      | 1              |
| 2      | 1              |
| 3      | 2              |

-- test case 2 -- begin

| bus_id | arrival_time | capacity |
| ------ | ------------ | -------- |
| 326    | 412          | 3        |
| 394    | 656          | 3        |
| 430    | 701          | 1        |
| 514    | 742          | 4        |
| 765    | 867          | 9        |
| 259    | 968          | 3        |

| passenger_id | arrival_time |
| ------------ | ------------ |
| 1145         | 84           |
| 1466         | 146          |
| 1446         | 317          |
| 1092         | 420          |
| 678          | 486          |
| 1643         | 520          |
| 253          | 615          |
| 1106         | 656          |
| 1309         | 699          |
| 142          | 832          |
| 431          | 880          |
| 1405         | 963          |

--output:
| bus_id | passengers_cnt |
| ------ | -------------- |
| 259    | 2              |
| 326    | 3              |
| 394    | 3              |
| 430    | 1              |
| 514    | 2              |
| 765    | 1              |

-- test case 2 -- end

-- test case 3 -- begin

| bus_id | arrival_time | capacity |
| ------ | ------------ | -------- |
| 88     | 168          | 7        |
| 674    | 231          | 10       |
| 257    | 248          | 8        |
| 77     | 272          | 4        |
| 414    | 546          | 7        |
| 708    | 557          | 5        |
| 556    | 590          | 9        |
| 320    | 652          | 1        |
| 492    | 981          | 8        |

| passenger_id | arrival_time |
| ------------ | ------------ |
| 912          | 55           |
| 990          | 174          |
| 1184         | 177          |
| 746          | 237          |
| 59           | 321          |
| 1540         | 337          |
| 1525         | 377          |
| 1284         | 433          |
| 1057         | 532          |
| 387          | 570          |
| 470          | 593          |
| 1226         | 628          |
| 941          | 853          |
| 159          | 915          |
| 652          | 953          |
| 1679         | 988          |
| 448          | 988          |
| 1164         | 996          |

--output:

| bus_id | passengers_cnt |
| ------ | -------------- |
| 77     | 0              |
| 88     | 1              |
| 257    | 1              |
| 320    | 1              |
| 414    | 5              |
| 492    | 4              |
| 556    | 1              |
| 674    | 2              |
| 708    | 0              |

-- test case 3 -- end

--solution 1:


WITH RECURSIVE loop_bus AS(
	SELECT
		bus_id,
		CASE WHEN capacity - total_pass >= 0 THEN 0 ELSE ABS(capacity - total_pass) END total_pre_remain,
		CASE WHEN total_pass > capacity THEN total_pass + (capacity - total_pass) ELSE capacity - (capacity - total_pass) END passengers_cnt,
		CASE WHEN total_pass > capacity THEN total_pass + (capacity - total_pass) ELSE capacity - (capacity - total_pass) END passengers_cnt_running,
		1 AS key_gb_running
	FROM
		mark_keyid
	WHERE	key_gb = 1
	UNION ALL
	SELECT
		M.bus_id,
		CASE WHEN capacity - (total_pass - passengers_cnt_running) >= 0 THEN 0 ELSE ABS(capacity - (total_pass - passengers_cnt_running) ) END total_pre_remain,
		CASE WHEN (total_pass - passengers_cnt_running) > capacity THEN (total_pass - passengers_cnt_running) + (capacity - (total_pass - passengers_cnt_running)) ELSE capacity - (capacity - (total_pass - passengers_cnt_running)) END passengers_cnt,
		passengers_cnt_running + CASE WHEN (total_pass - passengers_cnt_running) > capacity THEN (total_pass - passengers_cnt_running) + (capacity - (total_pass - passengers_cnt_running)) ELSE capacity - (capacity - (total_pass - passengers_cnt_running)) END passengers_cnt_running,
		key_gb_running + 1 AS key_gb_running
	FROM
		mark_keyid M,
		loop_bus L
	WHERE
		key_gb = key_gb_running + 1
)
, bus_pass AS(
	SELECT
		B.bus_id,
		B.capacity,
		B.arrival_time,
		COUNT(1) total_pass
	FROM
		buses B
	INNER JOIN
		passengers P ON P.arrival_time <= B.arrival_time
	GROUP BY 
		B.bus_id, B.capacity, B.arrival_time
)
, mark_keyid AS(
	SELECT
		*, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) key_gb
	FROM
		(
            SELECT bus_id, capacity, arrival_time, total_pass FROM bus_pass
            UNION 
            SELECT bus_id, capacity, arrival_time,  0 FROM buses B WHERE NOT EXISTS (SELECT 1 FROM bus_pass BS WHERE B.bus_id = BS.bus_id)
            ORDER BY arrival_time
        )sub         
) --SELECT * FROM mark_keyid
SELECT bus_id, passengers_cnt FROM loop_bus ORDER BY bus_id

-- solution 2 (for mysql developers)


WITH total_pass_for_each_bus AS(
	SELECT
		B.bus_id,
        B.arrival_time,
        B.capacity,
        COUNT(1) totalPass
	FROM
		Buses B
	LEFT JOIN
		Passengers P ON P.arrival_time <= B.arrival_time
	GROUP BY B.bus_id, B.arrival_time, B.capacity
),
CTE2 AS(
	SELECT
		bus_id,
		-- capacity,
-- 		totalPass,
		@total_pass_boarded := LEAST(capacity, totalpass - @total_pass_boarded_running) passengers_cnt,
		@total_pass_boarded_running := @total_pass_boarded_running + @total_pass_boarded
	FROM
		total_pass_for_each_bus,
		( SELECT
			@total_pass_boarded := 0,
			@total_pass_boarded_running := 0
		)init_value
)
SELECT bus_id, passengers_cnt FROM CTE2 ORDER BY bus_id





