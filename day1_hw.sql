-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT * FROM actor;

SELECT first_name, last_name 
FROM actor

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg'
-- THERE ARE 2 ACTORS WITH THE LAST NAME WAHLBERG. I WENT INTO THE ACTOR FOLDER AND PULLED THE LAST NAME FROM THERE.

-- 2. How many payments were made between $3.99 and $5.99?
SELECT * FROM payment

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- ORDER BY amount DESC;
-- I'M GETTING NO DATA FOUND I TRIED DOING THE 'ORDER BY' BUT IT WAS GIVING ME AN ERROR FOR 'ORDER'

-- 3. What film does the store have the most of? (search in inventory)
SELECT * FROM inventory

SELECT store_id
FROM inventory
WHERE 


SELECT MAX(amount) AS flim_over_10
FROM inventory
WHERE amount > 10;
-- CAN'T FIND AMOUNT TRIED BOTH OF THESE DIDN'T GET AN OUTPUT


-- 4. How many customers have the last name ‘William’?

SELECT * FROM customer

SELECT first_name, last_name
FROM customer

SELECT first_name, last_name
FROM customer
WHERE last_name = 'William'

SELECT COUNT(customer_id), last_name
FROM customer
WHERE last_name like 'W__m%'
GROUP BY last_name
HAVING COUNT(customer_id) > 0;

-- I TRIED THESE TWO DIFFERENT QUERIES AND THERE ARE NO CUSTOMERS WITH THE LAST NAME WILLIAM


-- 5. What store employee (get the id) sold the most rentals?

SELECT * FROM rental

SELECT MAX(amount) 
AS most_sold
FROM rental
WHERE amount > 10;

-- I'M GETTING AN ERROR THAT SAYS AMOUNT DOESN'T EXIST


-- 6. How many different district names are there?

SELECT * FROM address

SELECT district
FROM address

SELECT district
FROM address
WHERE 

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT * FROM film_actor

SELECT film_id, actor_id
FROM film_actor
WHERE  

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT * FROM customer

SELECT COUNT(store_id), last_name
FROM customer
WHERE last_name LIKE '___es%'
GROUP BY last_name
HAVING COUNT(store_id) > 0;

-- THERE ARE 10 CUSTOMERS WITH THE LAST NAME ENDING IS 'ES'. 
-- ALTHOUGH WHEN I RAN THE CODE I ALSO GOT A NAME 'Oglesby'
-- I'M NOT SURE HOW TO SEPERATE THAT ONE FROM THE REST.


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT * FROM payment

SELECT rental_id
FROM payment
WHERE amount BETWEEN 380 AND 430
GROUP BY rental_id
HAVING COUNT(rental_id) > 250;

-- I'M GETTING NO DATA WHEN I RUN THE QUIERY


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT * FROM film

SELECT rating
FROM film

-- THERE ARE 5 RATING CATEGORY

SELECT rating
FROM film
WHERE rating LIKE 'R__%'
GROUP BY rating
HAVING COUNT(rating) > 0;