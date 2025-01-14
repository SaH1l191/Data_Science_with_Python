select * from restaurants ;
-- views in sql 

DROP VIEW IF EXISTS rest;
CREATE VIEW rest AS (
    SELECT name, city, rating, rating_count AS orders, 
           cuisine, cost, cost * rating_count AS revenue 
    FROM restaurants
);
SELECT * FROM rest;



-- Next, we create a view user_view for end-users, which hides some columns like revenue.
DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (
    SELECT name, city, rating, rating_count AS orders, 
           cuisine, cost 
    FROM restaurants
);
SELECT * FROM user_view;

-- 4. Create a view of top 100 restaurants
drop view if exists top_100;
create view top_100 as (
		select * from restaurants order by rating_count desc limit 100);
select * from top_100;


-- 5. Create a view of restaurant atleast 100 people visited
drop view if exists least_100;
create view least_100 as (
		select * from restaurants where rating_count> 99
		order by rating_count asc limit 100
);
select * from least_100;

-- 6. Create a view of top 1000 most expensive restaurants
drop view if exists top_1000_exp;
create view top_1000_exp as (
		select * from restaurants order by cost desc limit 1000);
select * from top_1000_exp;


-- 7. Create a view for top-rated restaurants in each city
drop view if exists top_rated_rest_per_city;
create view top_rated_rest_per_city as (
	select * from (
	select *,row_number() over(partition by city order by rating*rating_count desc)
	 as rank  from restaurants 
	) as ranked_table 
	where ranked_table.rank=1 
);
select * from top_rated_rest_per_city;



-- creating a temporary table 
CREATE TEMPORARY TABLE temp_restaurants AS SELECT * FROM restaurants;
SELECT * FROM temp_restaurants;
















 