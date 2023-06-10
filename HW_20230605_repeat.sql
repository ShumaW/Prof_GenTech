-- 1. Создание таблиц

create database university;

-- 1) Создать таблицу Students
create table students
(
    id integer primary key auto_increment,
    name varchar(128) not null ,
    age integer
);


-- 2) Создать таблицу Teachers
create table teacher
(
    id integer primary key auto_increment,
    name varchar(128) not null ,
    age integer
);

-- 3) Создать таблицу Competencies
create table competencies
(
    id    integer primary key auto_increment,
    title varchar(128) not null
);


-- 4) Создать таблицу Teachers2Competencies
create table teachers2competencies
(
    id              integer primary key auto_increment,
    teacher_id      integer,
    competencies_id integer
);

-- 5) Создать таблицу Courses
create table courses
(
    id         integer primary key auto_increment,
    teacher_id integer,
    title      varchar(128) not null,
    headman_id integer
);

-- 6) Создать таблицу Students2Courses
create table students2courses
(
    id         integer primary key auto_increment,
    student_id integer,
    course_id  integer
);

-- Добавить 6 записей в таблицу Students
insert into students(name,age) values ('Анатолий', 29),
                                      ('Олег', 25),
                                      ('Семен', 27),
                                      ('Олеся', 28),
                                      ('Ольга', 31),
                                      ('Иван', 22);

-- Добавить 6 записей в таблицу Teachers
insert into teacher(name,age) values ('Петр', 39),
                                      ('Максим', 35),
                                      ('Антон', 37),
                                      ('Всеволод', 38),
                                      ('Егор', 41),
                                      ('Светлана', 32);

-- Добавить 4 записей в таблицу Competencies
insert into competencies(title) values ('Математика'),
                                       ('Информатика'),
                                       ('Программирование'),
                                       ('Графика');

-- Добавьте 6 записей в таблицу Teachers2Competencies
insert into teachers2competencies(teacher_id,competencies_id) values (1,1),
                                                                     (2,1),
                                                                     (2,3),
                                                                     (3,2),
                                                                     (4,1),
                                                                     (5,3);

-- Добавьте 5 записей в таблицу Courses
insert into courses (teacher_id,title,headman_id) values (1,'Алгебра логики',2),
                                                         (2,'Математическая статистика',3),
                                                         (4,'Высшая математика',5),
                                                         (5,'Javascript',1),
                                                         (5,'Базовый Python',1);

-- Добавьте 5 записей в таблицу Students2Courses
insert into students2courses (student_id,course_id) values (1,1),
                                                           (2,1),
                                                           (3,2),
                                                           (3,3),
                                                           (4,5);

-- Задачи
-- 1) Вывести имена студентов и курсы, которые они проходят
select
    t1.name,
    t3.title
    from students t1
    left join students2courses t2 on t1.id = t2.student_id
    left join courses t3 on t2.course_id = t3.id;
-- 2) Вывести имена всех преподавателей с их компетенциями
select
    t1.name,
    title
    from teacher t1
    left join teachers2competencies t2 on t1.id = t2.teacher_id
    left join competencies t3 on t2.competencies_id = t3.id;

-- 3) Найти преподавателя, у которого нет компетенций
select
    t1.name,
    t3.title
from teacher t1
         left join teachers2competencies t2 on t1.id = t2.teacher_id
         left join competencies t3 on t2.competencies_id = t3.id
where t3.title is null ;

-- 4) Найти имена студентов, которые не проходят ни один курс
select
    t1.name,
    t3.title
from students t1
         left join students2courses t2 on t1.id = t2.student_id
         left join courses t3 on t2.course_id = t3.id
where t3.title is null;

-- 5) Найти курсы, которые не посещает ни один студент
select
    t1.title
from courses t1
left join students2courses t2 on t1.id = t2.course_id
where student_id is null ;

-- 6) Найти компетенции, которых нет ни у одного преподавателя
select
    t1.title
from competencies t1
left join teachers2competencies t2c on t1.id = t2c.competencies_id
where teacher_id is null;

-- 7) Вывести название курса и имя старосты
select
    t1.title,
    t2.name
from courses t1
join students t2 on t1.headman_id = t2.id;

-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
select
    t1.name as student_name,
    t4.name as head_name
from students t1
         left join students2courses t2 on t1.id = t2.student_id
         left join courses t3 on t2.course_id = t3.id
left join students t4 on t3.headman_id = t4.id;