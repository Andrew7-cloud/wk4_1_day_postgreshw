Select first_name, last_name
from actor
where first_name like 'K__%n'


--comparing operators

--1 explore
select * from actor;
select * from payment;

--  based on review of payment 
select customer_id, payment_id,rental_id
from payment 
where amount >2.00;

select customer_id, amount
from payment 
where amount <7.99;

select customer_id, amount
from payment
where amount <=7.99;

select customer_id, amount
from payment
where amount <=2.00 
order by amount ASC;

select customer_id, amount
from payment
where amount between 2.00 and 7.99; 


select customer_id, amount
from payment
where amount <> 2.00
order by amount DESC;




--  agregation functions within SQL SUM(), AVG(), COUNT(), MIN(),MAX()

-- query to display sum of amts paid, greater than 5.99

select customer_id, amount
from payment
where amount <> 2.00
order by amount DESC;






-- total number of instances where records meet the where clause criteria
select count(amount)
from payment
where amount >5.99;

-- distinct types of instances
SELECT COUNT(DISTINCT amount)
from payment
where amount > 5.99;


-- using an alias with MIN function
SELECT MIN(amount) as Min_Num_Payments 
from payment
where amount > 7.99;


-- using an alias with MAX function
SELECT MAX(amount) as Max_Num_Payments 
from payment
where amount > 7.99;

-- using an alias with MAX function
SELECT AVG(amount) as Avg_Num_Payments 
from payment
where amount > 7.99;




--  Using the Group by Clause
--1 query to display all rows with records >7.99
--2 display what the group by will do

select amount from payment
where amount =7.99;


select amount, COUNT(amount)
from payment
where amount =7.99
-- select amount which is 7.99
GROUP BY amount
Order By amount;

--  group by customer id, SUM(amount)

select customer_id, SUM(amount)
from payment
group by customer_id
order by customer_id desc;

-- group by customer id, totals by customer_id

select customer_id, amount
from payment
group by customer_id, amount 
order by customer_id desc;

select * from customer;

-- sql having clause


-- select columnname from tablename where columnname like condition
-- count number of records meeting a criteria
select email, count(customer_id)
from customer
where email like 'j__.w%'
GROUP by email
having COUNT(customer_id)>0;


--1. How many actors are there with the last name ‘Wahlberg’?

select COUNT(last_name) as last
from actor
where last_name = Wahlberg';


select * from actor;


-- 1 homework
select last_name, count(last_name)
from actor
where last_name = 'Wahlberg'
GROUP by last_name;

-- 2 

select count(*) as count_of_amount 
from payment
where amount between 3.99 and 7.99



--3 What film does the store have the most of? (search in inventory)

select * from inventory;

select film_id , count(film_id) as count_of_film_id
from inventory
group by film_id
order by count_of_film_id DESC;


-- 4. How many customers have the last name ‘William’?

select * from customer;

select last_name
from customer
where last_name like 'Ely';


-- 5 what store empliyee (employee_id) sold the most rentals
select * from payment;

select staff_id, COUNT(staff_id) as staff_if_count 
from payment
group by staff_id
order by staff_if_count;

-- 6. How many different district names are there?

select count(distinct district) as test
from address;

-- 7 What film has the most actors in it? (use film_actor table and get film_id)

select * from film_actor;

select film_id, count(actor_id) as actor_count 
from film_actor
group by film_id
order by actor_count desc;



8.From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 

select * from customer;

select count(store_id) 
from customer
where store_id = 1
and last_name like '%es';


--  various code below
-- select district, count(district)
-- from address
--  group by district  

--  SELECT COUNT (DISTINCT district)
--FROM address;

--  9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
with ids between 380 and 430? (use group by and having > 250)
select * from payment;

select amount
from payment
where customer_id between 380 and 430
Group by amount
having count(rental_id)>250;

--  same example as above
select amount
from payment
where customer_id between 380 and 430
Group by amount
having count(rental_id)>250;







-- 10 10. Within the film table, how many rating categories are there? And what rating has the most
- movies total?

select * from film; 

SELECT COUNT (DISTINCT rating)
FROM film;


-- select DISTINCT
select DISTINCT rating, count(rating) as rating_count  
from film
group by rating
order by rating_count desc;
-- 



