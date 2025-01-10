-- DROP TABLE IF EXISTS restaurants ;
-- CREATE TABLE restaurants (
--     id INT PRIMARY KEY,
--     name VARCHAR(255),
--     city VARCHAR(100),
--     rating DECIMAL(2, 1),
--     rating_count INT,
--     cuisine VARCHAR(100),
--     cost INT,
--     link VARCHAR(255)
-- );


-- COPY public.restaurants (id, name, city, rating, rating_count, cuisine, cost, link)
-- FROM 'C:/Users/aspha/Desktop/restaurants.CSV'
-- DELIMITER ','
-- CSV
-- HEADER
-- ENCODING 'UTF8'
-- QUOTE '"'
-- ESCAPE '''';


select * from restaurants ;
-- 1. Which restaurant of city abohar is visied by least number of people?
select * from restaurants where  city = 'Abohar' 
and rating_count =(select min(rating_count) from restaurants where city='Abohar');

-- 2. Which restaurant has generated maximum revenue all over india?
select * from  restaurants where cost*rating_count =
(select  max(cost*rating_count) from restaurants);
-- 3. How many restaurants are having rating more than the average rating?
select * from  restaurants where rating >
(select  avg(rating) from restaurants);
-- 4. Which restaurant of Delhi has generated most revenue?
select * from restaurants where city='Delhi' and cost*rating_count =
(select max(cost*rating_count) from restaurants where city = 'Delhi');
-- 5. Which restaurant chain has maximum number of restaurants?
select name,count(name) as numbe from restaurants 
group by name order by  numbe desc limit 10 ; 
-- 6. Which restaurant chain has generated maximum revenue?
select name,sum(rating_count * cost) as revenuetotal from restaurants 
group by name order by  revenuetotal desc limit 10 ; 
-- 7. Which city has maximum number of restaurants?
select city,count(name) from restaurants 
group by city order by count(name) desc limit 10 ;
-- 8. Which city has generated maximum revenue all over india?
select city , sum(rating_count * cost) as revenue from restaurants
group by city order by sum(rating_count*cost) desc limit 10;
-- 9. List 10 least expensive cuisines?
select cuisine , count(cuisine) as favourites 
from restaurants  group by cuisine  order by favourites desc limit 10;
-- 10. List 10 most expensive cuisines?
select cuisine , count(cuisine) as favourites 
from restaurants  group by cuisine  order by favourites desc limit 10;
-- 11. What is the city is having Biryani as most popular cuisine
select city, avg(cost), count(*) as restraus from restaurants
where cuisine = 'Biryani'
group by city order by avg(cost) desc limit 10 ;
-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select name, sum(cost * rating_count) as revenue from restaurants 
group by name having count(name) = 1
order by revenue desc limit 10;






