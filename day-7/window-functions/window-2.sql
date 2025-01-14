select * from restaurants ;
-- ranks in sql 


-- 1. Rank every restaurant from most expensive to least expensive
select *,rank() over(order by cost desc) as rankspercost from restaurants; 
-- if multiple rows have same value then rank same but next value will start from 
-- next value 

--eg if 2 values repeated then assume rank 1 both then 3rd value will be rank3 not 2



-- 2. Rank every restaurant from most visited to least visited
 select *,rank() over(order by cost desc) as rankspercost from restaurants;
-- 3. Rank every restaurant from most expensive to least expensive as per their city
select *,rank() over(partition by city order by cost desc ) as rankspercost from restaurants; 
-- 4. Dense-rank every restaurant from most expensive to least expensive as per their city
select *,dense_rank() over( order by cost desc ) as rankspercost from restaurants; 
-- if multiple rows have same value then rank same but next value will start from 
-- same next  value 
-- comparison 
select * ,
	rank() over(order by cost desc) as rank ,
	dense_rank() over(order by cost desc) as dense_rank 
from restaurants;
--eg if 2 values repeated then assume rank 1 both then 3rd value will be rank2 not 3
-- in case of dense-rank 


-- 5. Row-number every restaurant from most expensive to least expensive as per their city
select * ,
	rank() over(order by cost desc) as rank ,
	dense_rank() over(order by cost desc) as dense_rank,
    row_number() over(order by cost desc) as row_number 
from restaurants;

-- 6. Rank every restaurant from most expensive to least expensive as per their city along with its city [Adilabad - 1, Adilabad - 2]
select * ,
	concat(city,'-' , row_number() over(partition by city order by cost desc)) as rank
from restaurants;

-- 7. Find top 5 restaurants of every city as per their revenue
select *  from (
	select * ,cost*rating_count as revenues,
row_number() over(partition by city order by (cost*rating_count) desc) as rank
from restaurants 
) t where t.rank < 6;

-- 8. Find top 5 restaurants of every cuisine as per their revenue
select *  from (
	select * ,cost*rating_count as revenues,
row_number() over(partition by city order by (cost*rating_count) desc) as rank
from restaurants 
) t where t.rank < 6;



