### Limits
/* Try using LIMIT yourself below by writing a query that displays all the data
in the occurred_at, account_id, and channel columns of the web_events table, and
 limits the output to only the first 15 rows.*/

SELECT	occurred_at, account_id, channel
FROM web_events
LIMIT 15;

### Order By
/* the default of ORDER is ascending, so DESC can be used to override */

/*Write a query to return the 10 earliest orders in the orders table. Include
the id, occurred_at, and total_amt_usd. */
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 	10;

/* Write a query to return the top 5 orders in terms of largest total_amt_usd.
Include the id, account_id, and total_amt_usd. */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY  total_amt_usd DESC
LIMIT 	5;

/* Write a query that displays the order ID, account ID, and total dollar amount
 for all the orders, sorted first by the account ID (in ascending order), and
 then by the total dollar amount (in descending order). */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

### WHERE
/* Pulls the first 5 rows and all columns from the orders table that have a
dollar amount of gloss_amt_usd greater than or equal to 1000. */

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/* Filter the accounts table to include the company name, website, and the
primary point of contact (primary_poc) just for the Exxon Mobil company in the
accounts table.*/

SELECT name, website, primary_poc
FROM accounts
where name = 'Exxon Mobil';

### ARITHMETIC OPERATORS
/* Create a column that divides the standard_amt_usd by the standard_qty to find
 the unit price for standard paper for each order. Limit the results to the
 first 10 orders, and include the id and account_id fields. */

SELECT id, account_id,
standard_amt_usd / standard_qty AS unit_price
FROM orders
LIMIT 10;

### LIKE

/* All the companies whose names start with 'C'. */
SELECT name
FROM accounts
WHERE name LIKE 'C%';

/* All companies whose names contain the string 'one' somewhere in the name*/
SELECT name
FROM accounts
WHERE name LIKE '%one%';

/* All companies whose names end with 's'. */
SELECT name
FROM accounts
WHERE name LIKE '%s';

### NOT

/*Use the accounts table to find the account name, primary poc, and sales rep
id for all stores except Walmart, Target, and Nordstrom. */

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE account name NOT IN ('Target', 'Walmart', 'Nordstrom');

/* Use the web_events table to find all information regarding individuals who
were contacted via any method except using organic or adwords methods */

SELECT *
FROM web_events
WHERE method NOT IN ('organic', 'adwords');

/*All the companies whose names do not start with 'C'*/

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

/* All companies whose names do not contain the string 'one' somewhere in the
name */

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

/* All companies whose names do not end with 's' */

SELECT name
FROM accounts
WHERE name NOT LIKE '%s';

### AND & BETWEEN

/*Write a query that returns all the orders where the standard_qty is over 1000,
 the poster_qty is 0, and the gloss_qty is 0. */

 SELECT *
 FROM orders
 WHERE standard_qty > 1000
 AND poster_qty = 0 gloss_qty = 0;

 /* Using the accounts table, find all the companies whose names do not start
 with 'C' and end with 's'. */

 SELECT name
 FROM accounts
 WHERE name NOT LIKE 'C%'
 AND name LIKE '%s';

 ### OR

 /* Find list of orders ids where either gloss_qty or poster_qty is greater than
  4000. Only include the id field in the resulting table. */

SELECT id
FROM orders
WHERE gloss_qty > 4000
OR poster_qty > 4000;

/* Write a query that returns a list of orders where the standard_qty is zero
and either the gloss_qty or poster_qty is over 1000. */

SELECT *
FROM orders
WHERE standard_qty = 0
AND (gloss_qty > 1000 OR poster_qty > 1000);

/* Find all the company names that start with a 'C' or 'W', and the primary
 contact contains 'ana' or 'Ana', but it doesn't contain 'eana'. */

 SELECT *
 FROM accounts
 WHERE (name LIKE 'C%'
   OR name LIKE 'W%')
   AND ((primary_poc LIKE '%ana%' or '%Ana%')
   AND primary_poc NOT LIKE 'eana');
