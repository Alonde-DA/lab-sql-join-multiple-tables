-- Write a query to display for each store its store ID, city, and country.

select store_id, city, country
from store
join address
on store.address_id = address.address_id
join city 
on city.city_id = address.city_id
join country
on country.country_id = city.country_id;

-- Write a query to display how much business, in dollars, each store brought in

select concat(sum(amount),' USD') as total_business, store.store_id
from payment
join rental
on rental.rental_id = payment.rental_id
join inventory
on inventory.inventory_id = rental.inventory_id
join store
on store.store_id = inventory.store_id
group by store_id;

-- What is the average running time of films by category

select avg(length) as average_duration, category.category_id
from film
join film_category
on film_category.film_id = film.film_id
join category
on category.category_id = film_category.category_id
group by category_id;

-- Which film categories are longest?

select max(length) as longest_movies, category.category_id
from film
join film_category
on film_category.film_id = film.film_id
join category
on category.category_id = film_category.category_id
group by category_id
order by max(length) desc
limit 2;

-- Display the most frequently rented movies in descending order

select count(rental.rental_id) as total_rentals, title
from payment 
join rental
on payment.rental_id = rental.rental_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film
on film.film_id = inventory.film_id
group by title 
order by title desc;

-- List the top five genres in gross revenue in descending order

select sum(amount), category.name
from payment
join rental
on rental.rental_id = payment.rental_id
join inventory
on rental.inventory_id = inventory.inventory_id
join film
on inventory.film_id = film.film_id
join film_category
on film_category.film_id = film.film_id
join category
on film_category.category_id = category.category_id
group by category.name
order by category.name desc
limit 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

select title, store_id, return_date
from payment
join rental
on rental.rental_id = payment.rental_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film
on inventory.film_id = film.film_id
where title = 'Academy Dinosaur' and store_id = 1;

