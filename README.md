
# 📊 Pagila SQL Analysis Project

This project showcases SQL-based analysis performed on the **Pagila** movie rental database (a PostgreSQL adaptation of the Sakila sample DB).

It demonstrates real-world SQL skills such as multi-table joins, aggregation, filtering, subqueries, and time-based analysis. These are essential for data science, data analyst, and business intelligence roles.

---

## 🔍 Project Objective

To extract meaningful insights from a movie rental system using advanced SQL queries that answer key business questions, including:

- Which movies are most popular?
- Who are the top customers by revenue?
- What are the monthly revenue trends?
- Which store has the most rentals?
- Which films were never rented?

---

## 🧰 Tools Used

- **PostgreSQL** with **pgAdmin 4**
- Dataset: [Pagila Database](https://github.com/devrimgunduz/pagila)

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `pagila-sql-analysis.sql` | Contains all SQL queries with comments |
| `README.md` | This documentation file |

---

## 🧠 Key SQL Concepts Used

- `JOIN` (INNER, LEFT)
- `GROUP BY`, `ORDER BY`, `LIMIT`
- `DATE_TRUNC()` for time grouping
- Subqueries
- Filtering with `NOT IN`
- Aggregate functions like `COUNT()`, `SUM()`, `AVG()`

---

## ✅ Sample Queries

```sql
-- Top 5 Revenue-Generating Customers
SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
```

```sql
-- Movies Never Rented
SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
  SELECT i.film_id
  FROM inventory i
  JOIN rental r ON i.inventory_id = r.inventory_id
);
```

---

## 📌 How to Run

1. Import `pagila.schema` and `pagila.data` into PostgreSQL using pgAdmin
2. Open Query Tool and run `pagila-sql-analysis.sql`
3. Review output and explore modifying queries

---

## 📈 Potential Extensions

- Export results to CSV for visualization
- Integrate with a dashboard (Power BI / Tableau)
- Use Python + SQL (Jupyter Notebook) for report generation

---
## 📦 CSV Outputs

Download SQL result files here:

- [Top 10 Rented Movies](exports/top_10_rented_movies.csv)
- [Top 5 Customers by Revenue](exports/top_5_customers.csv)
- [Monthly Revenue Trend](exports/monthly_revenue.csv)
- [Store-wise Rentals](exports/rentals_by_store.csv)
- [Popular Categories](exports/popular_categories.csv)
- [Average Rental Duration](exports/avg_rental_duration.csv)
- [Inactive Customers (6+ Months)](exports/inactive_customers.csv)
- [Movies Never Rented](exports/never_rented_movies.csv)
- [Top Cities by Rentals](exports/top_cities_by_rentals.csv)
- [Inventory by Store](exports/inventory_by_store.csv)


## 📬 Contact

Created by a Master's in Data Science student as part of a co-op/job portfolio.

Feel free to connect on [linkedin.com/in/pratik-jadhav5343727](https://www.linkedin.com/in/pratik-jadhav5343727) or reach out for feedback and collaboration.
