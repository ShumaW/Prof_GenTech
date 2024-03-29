create database homework_one;

drop table customers;
drop table orders;
drop table products;

CREATE TABLE customers
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(20),
    lastname VARCHAR(20),
    gender   char(1) check (gender in ('f', 'm')),
    age      integer
);


CREATE TABLE orders
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    customerid    integer,
    productid     integer,
    ordertype     varchar(128),
    product_count integer
);


CREATE TABLE products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(128),
    price numeric(8, 2)
);


INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (1, 3, 'online', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (1, 2, 'online', 5);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (3, 1, 'direct', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (3, 4, 'direct', 6);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (3, 3, 'direct', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (1, 3, 'online', 4);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (5, 7, 'online', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (5, 9, 'online', 7);
INSERT INTO orders (customerid, productid, ordertype, product_count)
VALUES (6, 5, 'direct', 4);


INSERT INTO customers (name, lastname, age, gender)
VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customers (name, lastname, age, gender)
VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customers (name, lastname, age, gender)
VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customers (name, lastname, age, gender)
VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customers (name, lastname, age, gender)
VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customers (name, lastname, age, gender)
VALUES ('Ольга', 'Степанова', 35, 'f');


INSERT INTO products (title, price)
VALUES ('молоко', 70);
INSERT INTO products (title, price)
VALUES ('колбаса', 230);
INSERT INTO products (title, price)
VALUES ('хлопья', 150);
INSERT INTO products (title, price)
VALUES ('хлеб', 30);
INSERT INTO products (title, price)
VALUES ('масло', 120);
INSERT INTO products (title, price)
VALUES ('чипсики', 60);
INSERT INTO products (title, price)
VALUES ('шоколад', 70);
INSERT INTO products (title, price)
VALUES ('кетчуп', 150);
INSERT INTO products (title, price)
VALUES ('яблоко', 70);

select *
from products;
select *
from customers;
select *
from orders;


-- 1) найдите имя и фамилию пользователей, у которых нет заказов
select name,
       lastname
from customers
where id not in (select customerid
                 from orders);

-- 2) найдите название товаров, которые ни разу не заказывали
select title
from products
where id not in (select productid
                 from orders);

-- 3) найдите название товаров, которые ни разу не заказывали онлайн
select title
from products
where id in (select productid
             from orders
             where ordertype = 'direct');

-- 4) найдите имя и фамилию покупателя, который сделал самый дорогой заказ
select t1.name,
       t1.lastname
from customers t1
         join orders t2
              on t1.id = t2.customerid
join products t3
on t2.productid = t3.id
where t3.price = (select max(price)
                   from products);
