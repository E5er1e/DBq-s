use sakila;

-- List all actors.
select first_name, last_name 
from actor;

-- Find the surname of the actor with the forename 'John'.
select last_name
from actor 
where first_name = 'John';

-- Find all actors with surname 'Neeson'. 
select first_name, last_name 
from actor 
where last_name = 'Neeson';

-- Find all actors with ID numbers divisible by 10. 
select first_name, last_name 
from actor 
where actor_id % 10 = 0;

-- What is the description of the movie with an ID of 100?
select description
from film
where film_id = 100;

-- Find every R-rated movie.
select title
from film
where rating ='R';

-- Find every non-R-rated movie.
select title
from film
where rating !='R';

-- Find the ten shortest movies.
select title, length
from film
order by length
limit 10;

-- Find the movies with the longest runtime, without using LIMIT.
select title, length
from film
order by length desc;

-- Find all movies that have deleted scenes.
select title, special_features
from film
where special_features like '%Deleted Scenes';

-- Using HAVING, reverse-alphabetically list the last names that are not repeated.
select last_name, count(*) from actor
group by last_name
having count(*)=1
order by last_name desc;

-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
select last_name, count(*) from actor
group by last_name
having count(*)>1
order by count(*) desc;

-- Which actor has appeared in the most films?
select actor_id, count(*) from film_actor
group by actor_id
order by count(*) desc
limit 1;

select first_name, last_name from actor
where actor_id = 107;

-- Which actor has appeared in the most films? ATTEMPT 2
select first_name, last_name ,count(actor.actor_id)
from actor
inner join film_actor on film_actor.actor_id = actor.actor_id
inner join film on film.film_id = film_actor.film_id
group by actor.actor_id
order by count(actor.actor_id) desc
limit 1 ;

-- When is 'Academy Dinosaur' due?
select release_year from film
where title = 'Academy Dinosaur';

-- What is the average runtime of all films?
select avg(length) from film;

-- List the average runtime for every film category.
select category_id, avg(length)
from film 
inner join film_category on film.film_id = film_category.film_id
group by category_id;

-- List all movies featuring a robot.
select title, description
from film
where description like "%robot%";

-- How many movies were released in 2010?
select count(*) 
from film
where release_year = 2010;

-- Find the titles of all the horror movies.
select  film.title, category.name
from category
inner join film_category on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
where name = 'Horror';

-- List the full name of the staff member with the ID of 2.
select first_name, last_name
from staff
where staff_id=2;

-- List all the movies that Fred Costner has appeared in.
select film.title, actor.first_name, actor.last_name
from film_actor
inner join actor on film_actor.actor_id = actor.actor_id 
inner join film on film.film_id = film_actor.film_id
where first_name="Fred" and last_name="Costner";

-- How many distinct countries are there?
select count(*)
from country;

-- List the name of every language in reverse-alphabetical order.
select name
from language
order by name desc;

-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
select first_name,last_name 
from actor
where last_name like "%son"
order by first_name;

-- Which category contains the most films?
select name,count(name)
from category
inner join film_category on category.category_id = film_category.category_id
group by name
order by count(name) desc
limit 1;