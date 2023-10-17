use world;

SELECT * FROM world.city;

-- Using COUNT, get the number of cities in the USA.
select count(*)
from city
where CountryCode="USA";

-- Find out the population and life expectancy for people in Argentina.
select name,Population,LifeExpectancy
from country
where name='Argentina';

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
select name,LifeExpectancy
from country
where LifeExpectancy is not null
order by LifeExpectancy desc
limit 1;


