-- 1.List the number of films per category.
select category_id,name,count(film_id) number_of_films from sakila.film_category
join sakila.category  using (category_id)
group by category_id



-- 2.Display the first and the last names, as well as the address, of each staff member.
select first_name,last_name, address from sakila.staff
join sakila.address  using (address_id)


-- 3.Display the total amount rung up by each staff member in August 2005.
select  staff_id,sum(amount), date_format(payment_date,'%Y-%m')as date from sakila.payment
join sakila.staff  using (staff_id)
where date_format(payment_date,'%Y-%m') ='2005-08'
group by staff_id,date_format(payment_date,'%Y-%m')


-- 4.List all films and the number of actors who are listed for each film.
select film_id,title ,count(actor_id) as nb_of_actors from sakila.film
join sakila.film_actor  using (film_id)
group by film_id


-- 5.Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select  customer_id,last_name,sum(amount)from sakila.payment
join sakila.customer  using (customer_id)
group by customer_id,last_name
order by last_name asc
