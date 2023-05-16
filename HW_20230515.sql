-- 1. Выведите данные о билетах разной ценовой категории. Среди билетов экономкласса
-- (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно.
-- Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000
-- включительно. Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000.
-- В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price.

select
    id,
    case
        when price between 10000 and 11000
            then 'Economy'
        when price between 20000 and 30000
            then 'PremiumEconomy'
        when price > 100000
            then 'Business'
        end as service_class,
    price
from tickets;


-- Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года,
-- то отнесите его к классу 'Old'. Если самолет произведен между 2000 и 2010 годами включительно,
-- то отнесите его к классу 'Mid'. Более новые самолеты отнесите к классу 'New'.
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета
-- больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.

select side_number,
       case
           when production_year < 2000
               then 'Old'
           when production_year <= 2010
               then 'Mid'
           else 'New'
           end as age
from airliners;


-- Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и
-- JQF04Q8I9G. Скидка на билет экономкласса (Economy) составила 15%, на билет
-- бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%.
-- Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, tripid, newprice.

select
    id,
    trip_id,
    case
        when service_class = 'Economy' then price * 0.85
        when service_class = 'Business' then price * 0.9
        when service_class = 'PremiumEconomy' then price * 0.8
        end as new_price
from tickets
where trip_id in ('LL4S1G8PQW','0SE4S0HRRU','JQF04Q8I9G');

