SELECT DISTINCT district
FROM address
WHERE
  LEFT (district,1) = 'K' AND
  RIGHT (district,1) = 'a' AND
  district NOT LIKE '% %'
;

SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM payment
WHERE
  date(payment_date) >= "2005-06-15" AND
  date(payment_date) <= "2005-06-18" AND
  amount > 10.00
;

SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM payment
WHERE
  date(payment_date) BETWEEN "2005-06-15" AND "2005-06-18"
;

SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental
WHERE rental_date IN (SELECT MAX(`rental_date`) FROM rental)
ORDER BY rental_id DESC
LIMIT 0, 5
;

SELECT 
  REPLACE (LOWER(first_name),'ll','pp') AS new_first_name, 
  REPLACE (LOWER(last_name),'ll','pp') AS new_last_name,
  first_name, last_name
FROM customer
WHERE
  active = 1 AND 
  first_name IN ('Kelly', 'Willie')
;

SELECT
  CONCAT(stF.last_name, ' ', stF.first_name) AS 'Staff Name', c.city AS 'Store City', COUNT(ctR.customer_id) AS 'Customer Amount'
FROM customer ctR
JOIN store stR ON ctR.store_id  = stR.store_id  
JOIN staff stF ON stR.manager_staff_id = stF.staff_id 
JOIN address a ON stR.address_id = a.address_id 
JOIN city c ON a.city_id = c.city_id  
GROUP BY ctR.store_id 
HAVING COUNT(ctR.customer_id) > 300
;







