Create table If Not Exists Candidates (employee_id int, experience ENUM('Senior', 'Junior'), salary int);
Truncate table Candidates;
insert into Candidates (employee_id, experience, salary) values ('1', 'Junior', '10000');
insert into Candidates (employee_id, experience, salary) values ('9', 'Junior', '10000');
insert into Candidates (employee_id, experience, salary) values ('2', 'Senior', '20000');
insert into Candidates (employee_id, experience, salary) values ('11', 'Senior', '20000');
insert into Candidates (employee_id, experience, salary) values ('13', 'Senior', '50000');
insert into Candidates (employee_id, experience, salary) values ('4', 'Junior', '40000');

--output:

+------------+---------------------+
| experience | accepted_candidates |
+------------+---------------------+
| Senior     | 2                   |
| Junior     | 2                   |
+------------+---------------------+

-- test case 2 -- begin
+-------------+------------+--------+
| employee_id | experience | salary |
+-------------+------------+--------+
| 1           | Junior     | 10000  |
| 9           | Junior     | 10000  |
| 2           | Senior     | 80000  |
| 11          | Senior     | 80000  |
| 13          | Senior     | 80000  |
| 4           | Junior     | 40000  |
+-------------+------------+--------+

--output:

+------------+---------------------+
| experience | accepted_candidates |
+------------+---------------------+
| Senior     | 0                   |
| Junior     | 3                   |
+------------+---------------------+

-- test case 3 -- end

--solution:


WITH getTotalSenior AS(
SELECT
	*,
	MIN(amount_remain) OVER(ORDER BY (SELECT NULL)) amount_remain_senior
FROM
	(SELECT
		employee_id,
		SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) totalAmount_Senior,
		70000 - SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) amount_remain
	FROM
		Candidates
	WHERE
		experience = 'Senior')sub
WHERE
		amount_remain >= 0
)
,getTotalJunior AS(
SELECT
	employee_id,
	COALESCE((SELECT DISTINCT amount_remain_senior FROM getTotalSenior), 70000) - 
	SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) totalAmount_Junior
FROM
	Candidates
WHERE
	experience = 'Junior'
)
SELECT 'Senior' experience ,COUNT(1) accepted_candidates FROM getTotalSenior
UNION ALL
SELECT 'Junior' ,COUNT(1) accepted_candidates FROM getTotalJunior WHERE totalAmount_Junior >= 0