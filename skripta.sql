SELECT 
	customers.last_name, 
    customers.first_name, 
    customers.points, 
    customers.(points + 10) * 100 AS discount_factor
FROM 
	sql_store.customers;

SELECT DISTINCT 
	customers.state
FROM
	sql_store.customers;
    
SELECT
	products.name,
    products.unit_price,
    products.unit_price * 1.1 AS new_price
FROM
	sql_store.products;

SELECT 
	*
FROM 
	customers
WHERE 
	birth_date > '1990-01-01' 
    OR points > 1000 
    AND state = 'VA';
    
SELECT 
	*
FROM 
	customers
WHERE NOT
	(birth_date > '1990-01-01' 
    OR points > 1000); -- NOT negira i operator OR u AND

-- Zadatak/Vježba sa WHERE
SELECT 
	*
FROM 
	sql_store.order_items
WHERE 
order_id = 6 AND (unit_price * quantity) > 30;

-- IN operator:
 SELECT 
	*
FROM 
	customers
WHERE customers.state NOT IN 
	('VA','FL','GA');

-- Zadatak/Vježba sa IN:

SELECT 
	*
FROM 
	products
WHERE 
	quantity_in_stock IN 
    (49, 38, 72);
    
-- BETWEEN operator

SELECT 
	*
FROM 
	customers
WHERE
	points BETWEEN 1000 AND 3000; -- ekvivalento da uporedjujemo sa AND operatorom

-- Zadatak/Vježba sa BETWEEN operatorom

SELECT
	*
FROM 
	customers
WHERE 
	birth_date BETWEEN '1990-01-01' AND '2000-01-01';
    
-- LIKE operator

SELECT 
	* 
FROM 
	customers
WHERE 
	last_name LIKE 'b____y'; -- % bilo koji broj karaktera, _ jedan karakter

-- Zadatak/Vjezba iz LIKE:

SELECT 
	*
FROM 
	customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

SELECT 
	*
FROM 
	customers
WHERE phone LIKE '%9';

-- REGEXP operator (regular expresions):
-- radi isto sto i like operator sa %
-- ako koristimo ^ prije stringa, znaci da trazeni string mora pocinjati sa proslijedjenim
-- $ reprezentira kraj stringa, trazeni string mora zavrsiti sa proslijedjenim
SELECT 
	*
FROM 
	customers
WHERE 
	last_name REGEXP 'field$';


    
    
    
    
    
    
    
    