use mavenmovies;-- use this db --

SELECT * FROM rental;-- use select statement to fetch rental table -- 

SELECT * FROM inventory;

SELECT * FROM customer;


SELECT 
    customer_id, rental_date
FROM
    rental;-- fetch specific column from table --


SELECT 
    first_name, last_name, email
FROM
    customer;-- select specific column from the table -- 


SELECT 
    rating
FROM
    film;-- select the column from the table --


SELECT DISTINCT
    rating
FROM
    film;-- select the unique values from the specific column of a table -- 


SELECT DISTINCT
    rental_duration
FROM
    film; 


SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment; 


SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    amount = 0.99; -- select specific columns from table and filter by amount 0.99 --


SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment;


SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    payment_date > '2006-01-01'; -- filter the date > than mentioned -- 


-- Method 1 --
SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    customer_id < 101;


-- Method 2 --
SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    customer_id <= 100;


-- Method 3 --
SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    customer_id BETWEEN 1 AND 100;


select
    customer_id, rental_id, amount, payment_date
from 
    payment
where
    amount = 0.99
and 
    payment_date > '2006-01-01'; -- filtering with multiple conditions -- 


select
    customer_id, rental_id, amount, payment_date
from 
    payment
where
    customer_id < 101
and
    amount > 5.00
and 
    payment_date > '2006-01-01'; -- filtering with multiple conditions -- 
    

select
    customer_id, rental_id, amount, payment_date
from 
    payment
where
    customer_id = 5
or
    customer_id = 11
or 
    customer_id = 29; -- filtering with flexible to result any of them / all of them -- 
    


select customer_id, rental_id, amount, payment_date
from  payment
where amount > 5
or customer_id = 42
or customer_id = 53
or customer_id = 60
or customer_id = 75; -- filtering with flexible to result any of them / all of them -- 


select customer_id, rental_id, amount, payment_date
from  payment
where amount > 5
or customer_id in (42,53,60,75); -- instead of using multiple or use IN --


select title, description
from film;


select title, description
from film
where description like '%Epic%';


select title, description
from film
where description like 'Epic%';


select title, description
from film
where description like '%Epic';


select title, description
from film
where description like '%China';


select title, description
from film
where description like '_China';


select title, description
from film
where title = 'ALADDIN CALENDAR';


select title, description
from film
where title like '_LADDIN CALENDAR'; 


select title, description
from film
where title not like '_LADDIN CALENDAR'; 


select title, special_features
from film
where special_features like '%Behind the Scenes%';


select rating, count(film_id)
from film
group by rating;

-- this is single line comment
/*
select rating, 
count(film_id) AS films_with_this_rating
from film
group by rating;
*/

select rental_duration, 
count(film_id) AS films_with_this_rental_duration
from film
group by rental_duration;


select rating, rental_duration,
count(film_id) as count_of_films
from film
group by rating, rental_duration;


select rental_duration, rating,
count(film_id) AS films_with_this_rental_duration
from film
group by rental_duration, rating;


select rental_duration, rating, replacement_cost,
count(film_id) AS films_with_this_rental_duration
from film
group by rental_duration, rating, replacement_cost;


select rating,
count(film_id) as count_of_films,
min(length) as shortest_film,
max(length) as longest_film,
avg(length) as average_length_of_film,
-- sum(length) as total_minutes
avg(rental_duration) as average_rental_duration
from film
group by rating;


select replacement_cost,
count(film_id) as number_of_films,
min(rental_rate) as cheapest_rental,
max(rental_rate) as most_expensive_rental,
avg(rental_rate) as average_rental
from film
group by replacement_cost;


select customer_id,
count(rental_id) as total_rentals
from rental
group by customer_id
having count(rental_id) = 25;

/*
select customer_id,
count(*) as total_rental
from rental
group by customer_id
having count(*) >= 30;
*/


select customer_id,
count(rental_id) as total_rentals
from rental
group by customer_id
having count(rental_id) < 15;


select customer_id, rental_id, amount, payment_date
from payment
order by amount desc;


select customer_id, rental_id, amount, payment_date
from payment
order by amount desc, customer_id;


select customer_id, rental_id, amount, payment_date
from payment
order by amount, customer_id desc;


select customer_id,
sum(amount) as total_payment_amount
from payment
group by customer_id
order by 
sum(amount) desc;


select title, length, rental_rate
from film
order by length desc;


select distinct length,
case
    when length < 60 then 'under 1 hr'
    when length between 60 and 90 then '1-1.5 hrs'
    when length > 90 then 'over 1.5 hrs'
    else 'uh oh.... check logic!'
end as length_bucket
from film;


select distinct length,
case
    when length < 60 then 'under 1 hr'
    when length < 90 then '1-1.5 hrs'
    when length > 120 then 'over 2 hrs'
    else 'uh oh.... check logic!'
end as length_bucket
from film;


select distinct title,
case
    when rental_duration <= 4 then 'rental_too_expensive'
    when rental_rate >= 3.99 then 'too_expensive'
    when rating in ('NC-17', 'R') then 'too_adult'
    when length not between 60 and 90 then 'too_short_or_too_long'
    when description like '%Shark%' then 'nope_has_sharks'
    else 'great_reco_for_my_niece'
    end as fit_for_recommendation
from film;


select distinct title,
case
    when rental_duration <= 4 then 'rental_too_expensive'
    when rental_rate >= 3.99 then 'too_expensive'
    when rating in ('NC-17', 'R') then 'too_adult'
    when length not between 60 and 90 then 'too_short_or_too_long'
    when description like '%Shark%' then 'nope_has_sharks'
    else 'great_reco_for_my_niece'
end as fit_for_recommendation,
case
    when description like '%Shark%' then 'nope_has_sharks'
    when length not between 60 and 90 then 'too_short_or_too_long'
    when rating in ('NC-17', 'R') then 'too_adult'
    when rental_rate >= 3.99 then 'too_expensive'
    when rental_duration <= 4 then 'rental_too_expensive'
    else 'great_reco_for_my_niece'
end as reordered_reco
from film;


select first_name, last_name,
case 
    when store_id = 1 and active = 1 then 'store 1 active'
    when store_id = 1 and active = 0 then 'store 1 inactive'
    when store_id = 2 and active = 1 then 'store 2 active'
    when store_id = 2 and active = 0 then 'store 2 inactive'
    else 'uh oh.... check logic!'
end as store_and_status
from customer;


select inventory_id,
case when store_id = 1 then inventory_id else null end as store_1_inventory,
case when store_id = 2 then inventory_id else null end as store_2_inventory
from inventory
order by inventory_id;


select film_id,
count(case when store_id = 1 then inventory_id else null end) as store_1_copies,
count(case when store_id = 2 then inventory_id else null end) as store_2_copies,
count(inventory_id) as total_copies
from inventory
group by film_id
order by film_id;


select store_id,
count(case when active = 1 then customer_id else null end) as active,
count(case when active = 0 then customer_id else null end) as inactive
from customer
group by store_id;


    