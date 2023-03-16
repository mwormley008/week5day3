--1. List all customers who live in Texas (use JOINs)
SELECT c.customer_id, c.first_name, c.last_name, a.district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE a.district = 'Texas';



--2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.customer_id, c.first_name, c.last_name, p.amount
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
WHERE p.amount > 7;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) as total_payments
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 175;


--4. List all customers that live in Argentina (use the city table)
SELECT co.country_id, co.country, ci.city_id, ci.country_id, c.first_name, c.last_name, c.address_id, a.address
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Argentina'
;


--5. Show all the film categories with their count in descending order
SELECT category_id, count(*)
FROM film_category
GROUP BY category_id
ORDER BY count(*) DESC;
;

--6. What film had the most actors in it (show film info)?
--SELECT fa.actor_id, fa.film_id, f.film_id, f.title
--FROM film_actor fa
--JOIN film f ON fa.film_id = f.film_id
--ORDER BY 
SELECT f.film_id, f.title, COUNT(*) AS actor_count
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
GROUP BY f.film_id
ORDER BY actor_count DESC
LIMIT 1;

--7. Which actor has been in the least movies?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY film_count ASC
LIMIT 1;

--8. Which country has the most cities?
SELECT co.country_id, co.country, COUNT(*) AS city_count
FROM country co
JOIN city ci ON co.country_id = ci.country_id
GROUP BY co.country_id
ORDER BY city_count desc
LIMIT 1;



--List the actors who have been in between 20 and 25 films.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
HAVING COUNT(*) BETWEEN 20 AND 25
ORDER BY COUNT(*) ASC;