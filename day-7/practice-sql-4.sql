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

-- union to combine data wihtout duplicates 

SELECT * FROM users_2021 as t2021
UNION 
SELECT * FROM users_2022 as t2022
	
-- union all to combine data wiht duplicates 
SELECT * FROM users_2021 as t2021
UNION ALL
SELECT * FROM users_2022 as t2022


-- except  to get uniq entries from 2021 but not in common with 2022 
SELECT * FROM users_2021 as t2021
EXCEPT
SELECT * FROM users_2022 as t2022
	
-- 
SELECT * FROM users_2021 as t2021
INTERSECT
SELECT * FROM users_2022 as t2022

 











