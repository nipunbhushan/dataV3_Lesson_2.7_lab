USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name, COUNT(fc.film_id) AS count_films  FROM film_category AS fc INNER JOIN category AS c ON fc.category_id=c.category_id GROUP BY fc.category_id;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT staff_id, SUM(amount) FROM payment WHERE date_format(CONVERT(payment_date,DATE), '%Y-%M') = '2005-August' GROUP BY staff_id;

-- Which actor has appeared in the most films?

SELECT CONCAT(a.first_name,' ',a.last_name) AS actor_name, COUNT(film_id) AS num_films FROM film_actor fa INNER JOIN actor a USING(actor_id) GROUP BY actor_id ORDER BY COUNT(film_id) DESC LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)

SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name, COUNT(DISTINCT i.film_id) AS count_rent_films FROM rental r INNER JOIN inventory i USING(inventory_id) INNER JOIN customer c USING(customer_id) GROUP BY r.customer_id ORDER BY COUNT(i.film_id) DESC LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.

SELECT CONCAT(s.first_name,' ',s.last_name) AS staff_name, a.address FROM staff s INNER JOIN address a USING(address_id);

-- List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) AS num_actors FROM film_actor fa INNER JOIN film f USING(film_id) GROUP BY f.film_id;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.first_name AS first_name, c.last_name AS last_name, SUM(p.amount) AS total_paid FROM payment p INNER JOIN customer c USING(customer_id) GROUP BY p.customer_id ORDER BY c.last_name;

-- List number of films per category.

SELECT c.name AS film_category, COUNT(fc.film_id) AS num_films FROM film_category fc INNER JOIN category c USING(category_id) GROUP BY fc.category_id;