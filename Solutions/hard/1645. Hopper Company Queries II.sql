Create table If Not Exists Drivers (driver_id int, join_date date);
Create table If Not Exists Rides (ride_id int, user_id int, requested_at date);
Create table If Not Exists AcceptedRides (ride_id int, driver_id int, ride_distance int, ride_duration int);
Truncate table Drivers;
insert into Drivers (driver_id, join_date) values ('10', '2019-12-10');
insert into Drivers (driver_id, join_date) values ('8', '2020-1-13');
insert into Drivers (driver_id, join_date) values ('5', '2020-2-16');
insert into Drivers (driver_id, join_date) values ('7', '2020-3-8');
insert into Drivers (driver_id, join_date) values ('4', '2020-5-17');
insert into Drivers (driver_id, join_date) values ('1', '2020-10-24');
insert into Drivers (driver_id, join_date) values ('6', '2021-1-5');
Truncate table Rides;
insert into Rides (ride_id, user_id, requested_at) values ('6', '75', '2019-12-9');
insert into Rides (ride_id, user_id, requested_at) values ('1', '54', '2020-2-9');
insert into Rides (ride_id, user_id, requested_at) values ('10', '63', '2020-3-4');
insert into Rides (ride_id, user_id, requested_at) values ('19', '39', '2020-4-6');
insert into Rides (ride_id, user_id, requested_at) values ('3', '41', '2020-6-3');
insert into Rides (ride_id, user_id, requested_at) values ('13', '52', '2020-6-22');
insert into Rides (ride_id, user_id, requested_at) values ('7', '69', '2020-7-16');
insert into Rides (ride_id, user_id, requested_at) values ('17', '70', '2020-8-25');
insert into Rides (ride_id, user_id, requested_at) values ('20', '81', '2020-11-2');
insert into Rides (ride_id, user_id, requested_at) values ('5', '57', '2020-11-9');
insert into Rides (ride_id, user_id, requested_at) values ('2', '42', '2020-12-9');
insert into Rides (ride_id, user_id, requested_at) values ('11', '68', '2021-1-11');
insert into Rides (ride_id, user_id, requested_at) values ('15', '32', '2021-1-17');
insert into Rides (ride_id, user_id, requested_at) values ('12', '11', '2021-1-19');
insert into Rides (ride_id, user_id, requested_at) values ('14', '18', '2021-1-27');
Truncate table AcceptedRides;
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('10', '10', '63', '38');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('13', '10', '73', '96');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('7', '8', '100', '28');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('17', '7', '119', '68');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('20', '1', '121', '92');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('5', '7', '42', '101');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('2', '4', '6', '38');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('11', '8', '37', '43');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('15', '8', '108', '82');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('12', '8', '38', '34');
insert into AcceptedRides (ride_id, driver_id, ride_distance, ride_duration) values ('14', '1', '90', '74');

--ouput:

| month | working_percentage |
| ----- | ------------------ |
| 1     | 0                  |
| 2     | 0                  |
| 3     | 25                 |
| 4     | 0                  |
| 5     | 0                  |
| 6     | 20                 |
| 7     | 20                 |
| 8     | 20                 |
| 9     | 0                  |
| 10    | 0                  |
| 11    | 33.33              |
| 12    | 16.67              |

-- test case 2 -- begin 

| driver_id | join_date  |
| --------- | ---------- |
| 594       | 2020-3-3   |
| 671       | 2020-8-29  |
| 785       | 2020-2-11  |
| 540       | 2020-12-14 |
| 83        | 2020-5-30  |
| 714       | 2020-6-13  |
| 742       | 2020-8-18  |
| 857       | 2020-4-23  |
| 743       | 2020-6-11  |
| 835       | 2020-5-11  |

| ride_id | user_id | requested_at |
| ------- | ------- | ------------ |
| 290     | 137     | 2020-11-17   |
| 940     | 85      | 2020-12-21   |
| 611     | 40      | 2020-12-29   |
| 119     | 126     | 2020-10-6    |
| 934     | 76      | 2020-9-16    |
| 844     | 117     | 2020-7-17    |
| 629     | 42      | 2020-8-24    |
| 914     | 104     | 2020-9-28    |
| 312     | 136     | 2020-5-30    |
| 630     | 60      | 2020-12-19   |
| 170     | 188     | 2020-6-26    |
| 486     | 145     | 2020-12-10   |
| 852     | 157     | 2020-12-13   |
| 830     | 6       | 2020-5-4     |
| 17      | 99      | 2020-2-14    |
| 749     | 36      | 2020-9-27    |
| 279     | 133     | 2020-8-28    |
| 135     | 161     | 2020-12-18   |
| 154     | 181     | 2020-10-7    |
| 467     | 3       | 2020-10-21   |
| 905     | 58      | 2020-11-3    |
| 430     | 9       | 2020-12-22   |
| 654     | 11      | 2020-8-20    |

| ride_id | driver_id | ride_distance | ride_duration |
| ------- | --------- | ------------- | ------------- |
| 279     | 743       | 82            | 99            |
| 934     | 785       | 81            | 6             |
| 749     | 835       | 22            | 74            |
| 654     | 742       | 8             | 17            |
| 914     | 671       | 97            | 93            |
| 170     | 594       | 82            | 41            |
| 629     | 83        | 39            | 79            |
| 154     | 83        | 60            | 57            |
| 630     | 540       | 20            | 38            |
| 467     | 742       | 34            | 63            |
| 486     | 83        | 60            | 76            |
| 830     | 785       | 59            | 60            |
| 312     | 83        | 17            | 46            |
| 611     | 671       | 119           | 24            |
| 135     | 540       | 73            | 109           |
| 430     | 857       | 110           | 12            |
| 17      | 785       | 62            | 77            |
| 905     | 835       | 129           | 28            |
| 852     | 594       | 3             | 76            |
| 940     | 714       | 20            | 24            |
| 119     | 742       | 16            | 39            |

--output:

| month | working_percentage |
| ----- | ------------------ |
| 1     | 0                  |
| 2     | 100                |
| 3     | 0                  |
| 4     | 0                  |
| 5     | 40                 |
| 6     | 14.29              |
| 7     | 0                  |
| 8     | 33.33              |
| 9     | 33.33              |
| 10    | 22.22              |
| 11    | 11.11              |
| 12    | 60                 |

-- test case 2 -- end


--solution:


WITH RECURSIVE gen_month AS(
	SELECT '2020-01-01'::DATE AS date_g
	UNION ALL
	SELECT (date_g + INTERVAL '1 MONTH')::DATE AS date_g FROM gen_month WHERE date_g < '2020-11-30'::DATE
) 
, total_active_each_month AS(
	SELECT
		1 AS active_user,
		to_char(join_date , 'yyyy-mm-01') Month_year_join	
	FROM
		Drivers
	WHERE
		join_date < '2021-01-01'
	UNION ALL
	SELECT 0 AS active_user, to_char(date_g , 'yyyy-mm-01') Month_year_join FROM gen_month G WHERE NOT EXISTS (SELECT 1 FROM Drivers D WHERE to_char(D.join_date , 'yyyy-mm-01') = to_char(date_g , 'yyyy-mm-01'))
)
, total_active_each_month2 AS (
SELECT
	Month_year_join,total_active
FROM
	(
	SELECT
		Month_year_join,
		SUM(active_user) OVER( ORDER BY (SELECT NULL)  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) total_active
	FROM 
		( SELECT Month_year_join::DATE , SUM(active_user) active_user FROM total_active_each_month GROUP BY Month_year_join ORDER BY  Month_year_join::DATE) sub
	)sub WHERE Month_year_join > '2019-12-31' --AND (Month_year_join || '-01')::DATE < '2021-01-01'
) 
, total_requested AS (
	SELECT
		to_char(R.requested_at , 'yyyy-mm-01')::DATE Month_year_requested,
		COUNT( DISTINCT A.driver_id) total_req_acpt
	FROM
		Rides R
	INNER JOIN
		AcceptedRides A ON R.ride_id = A.ride_id AND R.requested_at BETWEEN '2020-01-01' AND '2020-12-31'
	GROUP BY to_char(R.requested_at , 'yyyy-mm-01')::DATE
)
SELECT 
	EXTRACT('month' FROM A.Month_year_join::DATE) "month",
	CASE WHEN A.total_active = 0 THEN 0 ELSE  COALESCE( ROUND( (B.total_req_acpt / CAST( A.total_active AS DECIMAL(10,3))) * 100 , 2) , 0.00) END working_percentage
FROM
	total_active_each_month2 A
LEFT JOIN
	total_requested B ON A.Month_year_join = B.Month_year_requested
ORDER BY month