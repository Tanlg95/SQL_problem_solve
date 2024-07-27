Create table If Not Exists Employee (id int, month int, salary int);
Truncate table Employee;
insert into Employee (id, month, salary) values ('1', '1', '20');
insert into Employee (id, month, salary) values ('2', '1', '20');
insert into Employee (id, month, salary) values ('1', '2', '30');
insert into Employee (id, month, salary) values ('2', '2', '30');
insert into Employee (id, month, salary) values ('3', '2', '40');
insert into Employee (id, month, salary) values ('1', '3', '40');
insert into Employee (id, month, salary) values ('3', '3', '60');
insert into Employee (id, month, salary) values ('1', '4', '60');
insert into Employee (id, month, salary) values ('3', '4', '70');
insert into Employee (id, month, salary) values ('1', '7', '90');
insert into Employee (id, month, salary) values ('1', '8', '90');

--output:
| id | month | Salary |
| -- | ----- | ------ |
| 1  | 7     | 90     |
| 1  | 4     | 130    |
| 1  | 3     | 90     |
| 1  | 2     | 50     |
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 3  | 3     | 100    |
| 3  | 2     | 40     |

-- solution:

WITH RECURSIVE genMonth AS(
	SELECT 1 AS mm
	UNION ALL
	SELECT mm + 1 AS mm FROM genMonth WHERE mm < (SELECT max_month FROM getMaxMonth)
),getMaxMonth AS(
	SELECT MAX(month) max_month FROM Employee
)
, get_min_max AS(
	SELECT
		id,
		month, salary,
		MIN(month) OVER(PARTITION BY id) min_month,
		MAX(month) OVER(PARTITION BY id) max_month
	FROM
		Employee
)
, get_min_max2 AS(
	SELECT
		DISTINCT G.id, G.min_month, G.max_month, sub.mm
	FROM
		get_min_max G
	LEFT JOIN LATERAL (
		SELECT mm FROM genMonth WHERE mm BETWEEN min_month AND max_month -1
	) sub ON TRUE
	ORDER BY G.id
)
SELECT
	id,
	month,
	COALESCE(salary,0) + COALESCE(pre_salary,0) + COALESCE(pre_salary_2,0)  Salary
FROM
	(SELECT
		A.id,
		A.mm AS "month",
		COALESCE(B.salary,0) salary,
		LAG(COALESCE(B.salary,0)) OVER(PARTITION BY A.id ORDER BY A.mm) pre_salary,
		LAG(COALESCE(B.salary,0),2) OVER(PARTITION BY A.id ORDER BY A.mm) pre_salary_2
	FROM
		get_min_max2  A
	LEFT JOIN
		Employee B ON A.id = B.id AND A.mm = B.month)sub
WHERE
	salary > 0
ORDER BY id, month DESC
