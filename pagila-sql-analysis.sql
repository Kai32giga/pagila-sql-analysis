
-- 🎥 Top 10 Most Rented Movies
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

-- 💰 Top 5 Revenue-Generating Customers
SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 📅 Monthly Revenue Trend
SELECT DATE_TRUNC('month', p.payment_date) AS month, SUM(p.amount) AS monthly_revenue
FROM payment p
GROUP BY month
ORDER BY month;

-- 🏬 Store-wise Rental Comparison
SELECT s.store_id, COUNT(r.rental_id) AS total_rentals
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN rental r ON st.staff_id = r.staff_id
GROUP BY s.store_id
ORDER BY total_rentals DESC;

-- 🎭 Most Popular Film Categories
SELECT c.name AS category, COUNT(r.rental_id) AS rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY rentals DESC;

-- ⏱️ Average Rental Duration by Film
SELECT f.title, ROUND(AVG(r.return_date - r.rental_date), 2) AS avg_rental_days
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY avg_rental_days DESC
LIMIT 10;

-- 🚫 Customers Who Haven’t Rented in 6+ Months
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE c.customer_id NOT IN (
  SELECT DISTINCT r.customer_id
  FROM rental r
  WHERE r.rental_date > CURRENT_DATE - INTERVAL '6 months'
);

-- 🎥 Movies Never Rented
SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
  SELECT i.film_id
  FROM inventory i
  JOIN rental r ON i.inventory_id = r.inventory_id
);

-- 🌆 Top Cities by Rentals
SELECT ci.city, COUNT(r.rental_id) AS rentals
FROM city ci
JOIN address a ON ci.city_id = a.city_id
JOIN customer c ON c.address_id = a.address_id
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY ci.city
ORDER BY rentals DESC
LIMIT 10;

-- 🛠️ Inventory Availability by Store
SELECT s.store_id, COUNT(i.inventory_id) AS total_inventory
FROM store s
JOIN inventory i ON s.store_id = i.store_id
GROUP BY s.store_id;
