--drop table if exists order_items;
--drop table if exists orders;
--drop table if exists customers;
--drop table if exists products;
--drop table if exists suppliers;

CREATE TABLE customers (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(50) NOT NULL,
  address  VARCHAR(120),
  city     VARCHAR(30),
  country  VARCHAR(20)
);

CREATE TABLE suppliers (
    id              SERIAL PRIMARY KEY,
    supplier_name   VARCHAR(100) NOT NULL,
    country         VARCHAR(20) NOT NULL
);

CREATE TABLE products (
    id             SERIAL PRIMARY KEY,
    product_name   VARCHAR(100) NOT NULL,
    unit_price     INT NOT NULL,
    supplier_id    INT REFERENCES suppliers(id)
);

CREATE TABLE orders (
    id              SERIAL PRIMARY KEY,
    order_date      DATE NOT NULL,
    order_reference VARCHAR(10) NOT NULL,
    customer_id     INT REFERENCES customers(id)
);

CREATE TABLE order_items (
    id          SERIAL PRIMARY KEY,
    order_id    INT REFERENCES orders(id),
    product_id  INT REFERENCES products(id),
    quantity    INT NOT NULL
);

INSERT INTO customers (name, address, city, country) VALUES ('Guy Crawford','770-2839 Ligula Road','Paris','France');
INSERT INTO customers (name, address, city, country) VALUES ('Hope Crosby','P.O. Box 276, 4976 Sit Rd.','Steyr','United Kingdom');
INSERT INTO customers (name, address, city, country) VALUES ('Britanney Kirkland','P.O. Box 577, 5601 Sem, St.','Little Rock','United Kingdom');
INSERT INTO customers (name, address, city, country) VALUES ('Amber Tran','6967 Ac Road','Villafranca Asti','United States');
INSERT INTO customers (name, address, city, country) VALUES ('Edan Higgins','Ap #840-3255 Tincidunt St.','Arles','United States');
INSERT INTO customers (name, address, city, country) VALUES ('Quintessa Austin','597-2737 Nunc Rd.','Saint-Marc','United Kingdom');

INSERT INTO suppliers (supplier_name, country) VALUES ('Amazon', 'United States');
INSERT INTO suppliers (supplier_name, country) VALUES ('Taobao', 'China');
INSERT INTO suppliers (supplier_name, country) VALUES ('Argos', 'United Kingdom');
INSERT INTO suppliers (supplier_name, country) VALUES ('Sainsburys', 'United Kingdom');

INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Tee Shirt Olympic Games', 20, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Tee Shirt Olympic Games', 18, 2);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Tee Shirt Olympic Games', 21, 3);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Mobile Phone X', 299, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Mobile Phone X', 249, 4);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Super warm socks', 10, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Super warm socks', 5, 2);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Super warm socks', 8, 3);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Super warm socks', 10, 4);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Le Petit Prince', 10, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Le Petit Prince', 10, 4);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Ball', 14, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Ball', 15, 4);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Ball', 20, 2);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Javascript Book', 40, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Javascript Book', 39, 3);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Javascript Book', 41, 2);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Coffee Cup', 3, 1);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Coffee Cup', 4, 2);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Coffee Cup', 4, 3);
INSERT INTO products (product_name, unit_price, supplier_id) VALUES ('Coffee Cup', 5, 4);

INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-06-01', 'ORD001', 1);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-07-15', 'ORD002', 1);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-07-11', 'ORD003', 1);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-05-24', 'ORD004', 2);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-05-30', 'ORD005', 3);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-07-05', 'ORD006', 4);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-04-05', 'ORD007', 4);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-07-23', 'ORD008', 5);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-07-24', 'ORD009', 5);
INSERT INTO orders (order_date, order_reference, customer_id) VALUES ('2019-05-10', 'ORD010', 5);

INSERT INTO order_items (order_id, product_id, quantity) VALUES(1, 2, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(1, 7, 5);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(2, 8, 4);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(2, 11, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(3, 20, 10);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(3, 14, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(4, 4, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(5, 16, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(5, 10, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(6, 19, 3);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(6, 17, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(6, 11, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(6, 9, 3);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(7, 8, 15);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(8, 1, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(8, 5, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(9, 13, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(10, 14, 1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES(10, 6, 5);
SELECT * from customers;
SELECT * from suppliers;
SELECT * from products;
SELECT * from orders;
SELECT * from order_items;
--1.Retrieve all the customers names and addresses who lives in United States
select name, address from customers where country = 'United States';

--2.Retrieve all the customers ordered by ascending name
select * from customers order by name ASC;

--3. Retrieve all the products which cost more than 100
Select * from products where unit_price > 100;

--4.Retrieve all the products whose name contains the word `socks`
select * from products where product_name LIKE '%socks';

--5.Retrieve the 5 most expensive products
Select * from products where unit_price >= 39;

--6.Retrieve all the products with their corresponding suppliers. The result should 
--only contain the columns `product_name`, `unit_price` and `supplier_name` 
Select p.product_name, s.supplier_name, p.unit_price  from products p INNER JOIN suppliers s on p.supplier_id = s.id;

--7.Retrieve all the products sold by suppliers based in the United Kingdom. The result should
--only contain the columns `product_name` and `supplier_name`.
Select p.product_name, s.supplier_name  from products p INNER JOIN suppliers s on p.supplier_id = s.id where s.country = 'United Kingdom';


--8.Retrieve all orders from customer ID `1`
SELECT * from orders where customer_id = '1';

--9.Retrieve all orders from customer named `Hope Crosby`
SELECT o.* FROM orders o INNER JOIN customers c on o.customer_id = c.id where c.name = 'Hope Crosby';

select * from orders
select * from customers

--10.Retrieve all the products in the order `ORD006`. The 
--result should only contain the columns `product_name`, `unit_price` and `quantity`.
select p.product_name, p. unit_price, ot.quantity from order_items ot INNER JOIN products p on p.id = ot.product_id
INNER JOIN orders o on ot.order_id = o.id where order_reference = 'ORD006';
select * from products;  
select * from orders;
select * from order_items;


-- 11.Retrieve all the products with their supplier for all orders of all customers. The 
--result should only contain the columns `name` (from customer), `order_reference` `order_date`,
--`product_name`, `supplier_name` and `quantity`.
Select ot.quantity, p.product_name, o.order_reference, o.order_date, c.name, s.supplier_name from order_items ot INNER JOIN 
products p on ot.product_id = p.id INNER JOIN suppliers s on p.supplier_id = s.id 
INNER JOIN orders o on ot.order_id = o.id INNER JOIN customers c on o.customer_id = c.id;


-- 12.Retrieve the names of all customers who bought a product from a supplier from China.
//Select p.* from products p Inner join suppliers s on p.supplier_id = s.id where s.country = 'China';
Select c.name from  order_items ot Inner join orders o on ot.order_id = o.id 
INNER JOIN customers c  on o.customer_id = c.id
Inner join products p on ot.product_id = p.id 
INNER JOIN suppliers s on p.supplier_id = s.id Where s.country = 'China';
select * from products; 
select * from customers;
select * from suppliers;
select * from order_items;
SELECT * from orders;