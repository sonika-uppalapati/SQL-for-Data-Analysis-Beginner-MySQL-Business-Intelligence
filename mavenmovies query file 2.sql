use mavenmovies;

select * from rental
inner join customer on rental.customer_id = customer.customer_id;

select distinct inventory.inventory_id
from inventory
inner join rental on inventory.inventory_id = rental.inventory_id;

select distinct inventory.inventory_id, inventory.store_id, film.title, film.description
from film
inner join inventory on film.film_id = inventory.film_id;

select distinct inventory.inventory_id, rental.inventory_id
from inventory
inner join rental on inventory.inventory_id = rental.inventory_id;

select film.title,
count(film_actor.actor_id) as count_of_actors
from film
left join film_actor on film_actor.film_id = film.film_id
group by film.title;

select film.film_id, film.title, category.name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id; 

select 
    actor.first_name as actor_first_name, 
    actor.last_name as actor_last_name,
    film.title as film_title
from actor
inner join film_actor on film_actor.actor_id = actor.actor_id
inner film.film_id = film_actor.film_id;

select distinct film.title, film.description
from film 
inner join inventory on inventory.film_id = film.film_id
and inventory.store_id = 2;

select 'advisor' as type,
first_name, last_name
from advisor
union
select 'investor' as type,
first_name, last_name
from investor;

select 'advisor' as type,
first_name, last_name
from advisor
union
select 'staff' as type,
first_name, last_name
from staff;
