USE sql_hr;

SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id; 
    
-- spajanje vise tabela:

USE sql_store;

SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON os.order_status_id = o.status
ORDER BY o.order_id;

-- Zadatak:

USE sql_invoicing;
SELECT p.client_id, c.name AS client_name, p.invoice_id, p.date, p.amount, pm.name AS payment_method_name
FROM payments p
JOIN clients c
	ON c.client_id = p.client_id
JOIN payment_methods pm
	ON pm.payment_method_id = p.payment_method;

-- Compound Join Conditions

USE sql_store;
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;

-- Implicit Join Syntax
-- nije preporucljivo, analogno INNER JOIN-U
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

-- OUTER JOIN
-- left/right join, ako je left, svi rekordi iz lijeve (FROM) tabele
-- su vraceni ako je uslov tacan ili nije tacan

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Zadatak:

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- OUTER JOINS BETWEEN MULTIPLE TABLES

SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id;
 
 -- Zadatak:
 
SELECT o.order_date, o.order_id, c.first_name, sh.name AS shiper, os.name AS status
FROM orders o
LEFT JOIN customers c
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON sh.shipper_id = o.shipper_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY os.order_status_id;

-- Self outer joins

USE sql_hr;

SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;

-- The USING Clause:
-- mijenja ON clause ukoliko je isti naziv kolone
-- samo ako je ime kolone istog imena u drugim tabelama
USE sql_store;
SELECT 
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
	USING (customer_id)
LEFT JOIN shippers sh 
	USING (shipper_id);
    
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id, product_id);
    
-- Zadatak:

USE sql_invoicing;

SELECT p.date, c.name AS name, p.amount, pm.name AS name
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

-- Natural Joins
-- nije preporucljiv jer se prepusta sql jeziku i programu u pozdadini da odradi join
USE sql_store;
SELECT 
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c;

-- Cross JOINS
-- kombiniramo sve rekorde prve tabel i sve rekore druge tabela

SELECT 
	c.first_name AS customer,
    p.name AS product 
FROM customers c
CROSS JOIN products p;

-- Zadatak 

SELECT *
FROM shippers sh, products p;

SELECT *
FROM shippers sh
CROSS JOIN products p;








