Create table If Not Exists Follow (followee varchar(255), follower varchar(255));
Truncate table Follow;
insert into Follow (followee, follower) values ('Alice', 'Bob');
insert into Follow (followee, follower) values ('Bob', 'Cena');
insert into Follow (followee, follower) values ('Bob', 'Donald');
insert into Follow (followee, follower) values ('Donald', 'Edward');

--output:
| follower | num |
| -------- | --- |
| Bob      | 2   |
| Donald   | 1   |

-- solution:

SELECT
    F.user_id follower,
    COUNT(1) num
FROM
    (SELECT followee user_id FROM Follow UNION SELECT follower FROM Follow) F
LEFT JOIN
    Follow FF ON FF.followee = F.user_id
WHERE
    EXISTS (
        SELECT 1 FROM Follow F1 WHERE F1.follower = F.user_id
    )
AND
    EXISTS (
        SELECT 1 FROM Follow F1 WHERE F1.followee = F.user_id
    )
GROUP BY F.user_id ORDER BY follower
	