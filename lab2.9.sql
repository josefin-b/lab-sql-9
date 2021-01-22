-- LAB 2.9 --

USE sakila;

/* In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis. */
-- 1 Create a table rentals_may to store the data from rental table with information for the month of May.

SELECT * FROM rental;
DROP TABLE IF EXISTS rentals_may;
CREATE TABLE rentals_may(
rental_id int(11) UNIQUE NOT NULL,
rental_date datetime DEFAULT NULL,
inventory_id int(11) DEFAULT NULL,
customer_id int(11) DEFAULT NULL,
return_date datetime DEFAULT NULL,
staff_id int(11) DEFAULT NULL,
last_update timestamp DEFAULT NULL,
day_type varchar(20) default null,
CONSTRAINT PRIMARY KEY(rental_id)
);


-- 2 Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

INSERT INTO rentals_may (SELECT * FROM rental WHERE month(rental_date) = 5);
SELECT * FROM rentals_may;


-- 3 Create a table rentals_june to store the data from rental table with information for the month of June.

DROP TABLE IF EXISTS rentals_june;
CREATE TABLE rentals_june(
rental_id int(11) UNIQUE NOT NULL,
rental_date datetime DEFAULT NULL,
inventory_id int(11) DEFAULT NULL,
customer_id int(11) DEFAULT NULL,
return_date datetime DEFAULT NULL,
staff_id int(11) DEFAULT NULL,
last_update timestamp DEFAULT NULL,
day_type varchar(20) default null,
CONSTRAINT PRIMARY KEY(rental_id)
);


-- 4 Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

INSERT INTO rentals_june (SELECT * FROM rental WHERE month(rental_date) = 6);
SELECT * FROM rentals_june;


-- 5 Check the number of rentals for each customer for May.

SELECT customer_id, count(inventory_id) AS nr_of_rentals_may FROM rentals_may group by customer_id;


-- 6 Check the number of rentals for each customer for June.

SELECT customer_id, count(inventory_id) AS nr_of_rentals_june FROM rentals_june group by customer_id;
