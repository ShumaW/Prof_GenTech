/*
 Домашка:
-- Создайте таблицу goods:
id первичный ключ автоинкремент
title строка 128
quantity строка 128
price целое число
 */
create database my_first_db;
create table goods(
                      id int primary key auto_increment,
                      title varchar (128),
                      quantity varchar(128),
                      price int
);
-- Добавьте 10 строк
insert into goods(title,quantity, price) values ('Doll','super',250),
                                                ('Shoes', 'best',1500),
                                                ('Dress','normal',2500),
                                                ('Trousers','best',1250),
                                                ('Coat' , 'super',3254),
                                                ('T-shirt', 'best', 253),
                                                ('Bag','normal',560),
                                                ('Apple_Watch', 'super',8560),
                                                ('Sumsung_TV','super', 10856),
                                                ('I-Pad', 'super',250);

-- Проверьте содержимое таблицы
select * from goods;

-- Найдите товары дешевле 1000
select
    *
from goods
where price<1000;

-- Найдите товары, начинающиеся на А
select
    *
from goods
where title like ('A%');

-- Удалите товары дороже 1000
delete from goods
where price>1000;

-- Очистите таблицу так, чтобы при повторном заполнении автоинкремент добавлял айдишники с 1
truncate goods;
drop database my_first_db;


