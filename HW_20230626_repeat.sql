create database temp;

-- 1. Создать коллекцию users и заполнить документами со следующими свойствами:
-- id, firstname, lastname, age, gender. Используйте следующие данные:
create table users
(
    id        int primary key auto_increment,
    firstname varchar(128),
    lastname  varchar(128),
    age       int,
    gender    char(1) check (gender in ('f', 'm'))
);

insert into users (firstname, lastname, age, gender)
VALUES ('Анатолий', 'Ушанов', 28, 'm'),
       ('Светлана', 'Демидова', 25, 'f'),
       ('Никита', 'Иванов', 33, 'm'),
       ('Ольга', 'Петрова', 22, 'f');

-- Создать коллекцию workers и заполнить документами со следующими свойствами:
-- id, firstname, lastname, position, salary. Используйте следующие данные:
create table workers
(
    id        int primary key auto_increment,
    firstname varchar(128),
    lastname  varchar(128),
    position  varchar(128),
    salary    integer
);

insert into workers (firstname, lastname, position, salary)
VALUES ('Петр', 'Сергеев', 'CEO', 7000),
       ('Виктор', 'Семенов', 'Web-developer', 5000),
       ('Никита', 'Петров', 'Assistant', 3500),
       ('Инна', 'Орлова', 'Accountant', 4500);

-- Создать коллекцию fruits и заполнить документами со следующими свойствами:
-- id, title, price, count. Используйте следующие данные:
create table fruits
(
    id    int primary key auto_increment,
    title varchar(64),
    price integer,
    count int
);

insert into fruits (title, price, count)
VALUES ('Apple', 280, 4),
       ('Lemon', 300, 8),
       ('Lime', 500, 3),
       ('Orange', 200, 8);

-- Создать коллекцию vegetables и заполнить документами со следующими свойствами:
-- id, title, price, count, country. Используйте следующие данные:
create table vegetables
(
    id      int primary key auto_increment,
    title   varchar(64),
    price   integer,
    count   int,
    country varchar(64)
);

insert into vegetables (title, price, count, country)
VALUES ('Potato', 370, 5, 'Germany'),
       ('Onion', 320, 3, 'Poland'),
       ('Tomato', 210, 9, 'Spain'),
       ('Carrot', 280, 4, 'France');