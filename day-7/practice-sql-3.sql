-- Drop the database if it exists (outside the transaction block)
DROP DATABASE IF EXISTS users;

-- Create the database (outside the transaction block)
CREATE DATABASE users;

-- (Now manually connect to the 'users' database)

-- After connecting to 'users', begin a transaction
BEGIN;

-- Create tables
CREATE TABLE IF NOT EXISTS users_2021 (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS users_2022 (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS users_2023 (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Insert data into the tables
INSERT INTO users_2021 (UserID, Name) VALUES
    (1, 'Ashish'), (2, 'Laura'), (7, 'Prakash');

INSERT INTO users_2022 (UserID, Name) VALUES
    (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace');

INSERT INTO users_2023 (UserID, Name) VALUES
    (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace'), (5, 'Henry');

-- Commit the transaction
COMMIT;

-- Select data from all tables to verify
SELECT * FROM users_2021;
SELECT * FROM users_2022;
SELECT * FROM users_2023;

-- if selected all three selected then all common entries wil be seen 

-- inner join (connect both tables having common entries)

SELECT * FROM users_2021 as t2021
INNER JOIN 
users_2022 as t2022
on t2021.userid = t2022.userid;

-- left join(connect both tables having left all  entries)
SELECT * FROM users_2021 as t2021
LEFT JOIN 
users_2022 as t2022
on t2021.userid = t2022.userid;

-- right join(connect both tables having right all  entries)
SELECT * FROM users_2021 as t2021
RIGHT JOIN 
users_2022 as t2022
on t2021.userid = t2022.userid;


-- Cross join(connect both tables having  all  PNC entries rows)
SELECT * FROM users_2021 as t2021
LEFT JOIN 
users_2022 as t2022
on t2021.userid = t2022.userid
	 
UNION ALL  
SELECT * FROM users_2021 as t2021
RIGHT JOIN 
users_2022 as t2022
on t2021.userid = t2022.userid;














