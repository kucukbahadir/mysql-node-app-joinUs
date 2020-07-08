USE join_us;

-- To find the earliest date a user joined

SELECT DATE_FORMAT(created_at, "%M %D %Y") AS earliest_date FROM users ORDER BY created_at ASC LIMIT 1;

# +---------------+
# | earliest_date |
# +---------------+
# | July 2nd 2019 |
# +---------------+

-- To find e-mail of the earliest date a user joined

SELECT * FROM users WHERE  created_at = (SELECT created_at FROM users ORDER BY created_at ASC LIMIT 1);

# +-----------------------------+---------------------+
# | email                       | created_at          |
# +-----------------------------+---------------------+
# | Kendall.Farrell@hotmail.com | 2019-07-02 12:55:30 |
# +-----------------------------+---------------------+

-- To find the users according to the month they joined
SELECT DATE_FORMAT(created_at, "%M") AS month, COUNT(*) AS "count" FROM users
GROUP BY month 
ORDER BY count DESC;

# +-----------+-------+
# | month     | count |
# +-----------+-------+
# | July      |    58 |
# | January   |    50 |
# | February  |    49 |
# | December  |    47 |
# | August    |    46 |
# | June      |    46 |
# | May       |    42 |
# | November  |    38 |
# | October   |    37 |
# | September |    36 |
# | April     |    34 |
# | March     |    27 |
# +-----------+-------+


-- To count the number of the users with Yahoo Emails
SELECT COUNT(*) AS yahoo_users FROM users WHERE email LIKE "%@yahoo.com";

# +-------------+
# | yahoo_users |
# +-------------+
# |         171 |
# +-------------+


-- To count the number of the users with each email provider
SELECT 
CASE 
         WHEN email LIKE '%@gmail.com' THEN 'gmail' 
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo' 
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail' 
         ELSE 'other' 
       end      AS provider, 
       Count(*) AS total_users 
FROM   users 
GROUP  BY provider 
ORDER  BY total_users DESC;

# +----------+-------------+
# | provider | total_users |
# +----------+-------------+
# | yahoo    |         171 |
# | hotmail  |         171 |
# | gmail    |         168 |
# +----------+-------------+














