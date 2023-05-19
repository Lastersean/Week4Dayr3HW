-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, district
FROM customer
FULL OUTER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- I don't know where else to go on this one??

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
Select amount, first_name, last_name 
From payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
-- SELECT customer_id, SUM(amount)
-- FROM payment
-- GROUP BY customer_id
-- HAVING SUM(amount) > 175;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175

);



-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Nepal';
-- Does no-one live in Nepal?
-- 5. Which staff member had the most
-- transactions?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
-- 
SELECT customer_id, amount
-- FROM payment
-- WHERE amount > 6.99;
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
SELECT customer_id
FROM payment
WHERE amount > 6.99

);





-- 8. How many free rentals did our stores give away
SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0
GROUP BY rental_id; 
