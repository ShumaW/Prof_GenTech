-- Из таблицы employees найти всех сотрудников, работающих в департаменте с id 90.
select * from employees
where department_id = 90;

-- Из таблицы employees найти всех сотрудников, зарабатывающих больше 5000.
select * from employees
where salary > 5000;



-- Из таблицы employees найти всех сотрудников, чья фамилия начинается на букву L.
select * from employees
where last_name like 'L_%';

-- Из таблицы departments найти все департаменты, у которых location_id 1700.
select * from departments
where location_id = 1700;

-- Из таблицы locations найти все города с country_id US.
select * from locations
where country_id = 'US';