-- Hello world
-- This is a comment

-- sql version of Hello World
SELECT *  -- what?
FROM actor; -- from where?

SELECT *
FROM address; 


-- lets grab the first and last name

SELECT first_name, last_name
FROM actor;

-- WHERE clause
-- this is how we filter out the results of our conditionals

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Single quotes for strings, literals vs Double for Database identifers


-- We can use LIKE instead of just - for strings
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- wildcards for use with like: _   and    % 
-- % is a true wildcard - any character AND number of characters
-- _ in one character wildcard

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';


-- 3 underscores means starts with 3 and 3 letters. . .
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J__%hy';

-- comparison operators:
-- = and like example above
-- Greater/less>      <       <=       >=       all valid as usual
-- NOT equal is   <>


SELECT * FROM address;

SELECT *
FROM  address
WHERE district like 'Texas';

SELECT * FROM payment;


-- lets find customers who paid more than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2;

-- quary for customers who paid less than 7.99

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- we can use OR AND with the WHERE clause


SELECT customer_id, amount
FROM payment
WHERE amount < 7.99 AND amount > 0;

SELECT customer_id, amount
FROM payment
WHERE amount > 2 AND amount > 7.99;

--we can also use BETWEEN, works the same as <=  >=


SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99;

-- ORDER BY 


SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99;
ORDER BY amount DESC; -- switch back and forth with ASC, DESC, DESC is default


-- not equal 
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00;
ORDER BY amount ASC;


SELECT customer_id, amount
FROM payment
WHERE amount > 10;



SELECT * FROM customer; -- checking out customer table

SELECT first_name, last_name
FROM customer
WHERE customer_id = 341;

-- Peter mernard is our big baller! 

-- sql aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- query to show the sum of amounts greater than 5.99

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- same but with averages!
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- count
SELECT COUNT(amount)
FROM payment

SELECT * FROM payment;

-- what about individual amount? unique. . .


SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- QUERY TO DISPLAY MIN amount greater than 6.99
SELECT Min(amount)
FROM payment
WHERE amount > 6.99;


-- QUERY TO DISPLAY MAX amount greater than 6.99
SELECT MAX(amount) AS Biggest_over_7
FROM payment
WHERE amount > 6.99;

-- GROUP BY
-- any column not in aggregate must be in group by in conjuction
-- with aggregates to modify behavior or aggregate group rows

SELECT amount, count(amount), sum(amount)
FROM payment
GROUP BY amount 
ORDER BY sum(amount) DESC;




-- bring it back to more straight - forward examples
SELECT amount
FROM payment
WHERE amount -6.99

SELECT amount, count(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- lets look at customer id's with summed amounts for those id's
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;


SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;



-- query display cus_ids that show up more than 5 times

SELECT COUNT(customer_id), email
FROM customer
WHERE email like 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;


-- general rules. . .


SELECT customer_id, SUM(amount) -- what you want to see 
FROM payment  -- from where? 
-- these are our basic building blocks!
WHERE customer_id BETWEEN 70 AND 80 -- how?
GROUP BY customer_id   -- using aggregets
HAVING SUM(amount) > 150      -- this is the how for aggregets 
ORDER BY customer_id
LIMIT 3                                -- always at /towards end 
OFFSET 1;

SELECT *
FROM payment
WHERE amount < -427.01
LIMIT 50
OFFSET 5


-- clauses we've talked about so far:
-- select <columns> <aggregates>
-- from<table>
-- where <contitional>
--group by <columns>
-- Having <conditional>
-- order by <columns>



