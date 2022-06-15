%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SQL_DDL
Первая часть.

Таблица employees

Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table employees(
    id serial primary key,
    employee_name varchar(50) not null
);

insert into employees(employee_name)
values ('Миша'),
       ('Настя'),
       ('Оля'),
       ('Света'),
       ('Таня'),
       ('Костя'),
       ('Вася'),
       ('Дима'),
       ('Петя'),
       ('Галя'),
       ('Леша'),
       ('Катя'),
       ('Маша'),
       ('Яна'),
       ('Юля'),
       ('Тоня'),
       ('Руслан'),
       ('Вадим'),
       ('Саша'),
       ('Фаддей'),
       ('Макар'),
       ('Вячеслав'),
       ('Евгений'),
       ('Лада'),
       ('Марфа'),
       ('Фёдор'),
       ('Максим'),
       ('Роман'),
       ('Даниил'),
       ('Егор'),
       ('Влас'),
       ('Георгий'),
       ('Фома'),
       ('Сергей'),
       ('Пров'),
       ('Иван'),
       ('Семён'),
       ('Елена'),
       ('Ирина'),
       ('Анна'),
       ('Павел'),
       ('Елизавета'),
       ('Валерия'),
       ('Фрол'),
       ('Агния'),
       ('Артур'),
       ('Кира'),
       ('Жанна'),
       ('Николай'),
       ('Лев'),
       ('Лилия'),
       ('Милица'),
       ('Тимур'),
       ('Зоя'),
       ('Ульяна'),
       ('Маргарита'),
       ('Олег'),
       ('Алина'),
       ('Варвара'),
       ('Ким'),
       ('Дарья'),
       ('Ксения'),
       ('Оксана'),
       ('Виктор'),
       ('Нина'),
       ('Снежана'),
       ('Раиса'),
       ('Назар'),
       ('Вера'),
       ('Алла');

select * from employees;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Таблица salary
Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table salary(
    id serial primary key,
    monthly_salary int not null
);

insert into salary(monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
      
select * from salary;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Таблица employee_salary

Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table employee_salary(
    id serial primary key,
    employee_id int unique not null,
    salary_id int not null
);
insert into employee_salary(employee_id, salary_id)
values (1, 9),
       (2, 8),
       (3, 7),
       (4, 6),
       (5, 2),
       (6, 11),
       (7, 13),
       (8, 17),
       (9, 1),
       (10, 3),
       (11, 10),
       (12, 4),
       (13, 6),
       (14, 19),
       (15, 17),
       (16, 8),
       (17, 11),
       (18, 9),
       (19, 5),
       (20, 14),
       (21, 11),
       (22, 12),
       (23, 7),
       (24, 9),
       (25, 8),
       (26, 3),
       (27, 2),
       (28, 8),
       (29, 19),
       (30, 22),
       (71, 16),
       (72, 15),
       (73, 18),
       (74, 23),
       (75, 25),
       (76, 8),
       (77, 1),
       (78, 21),
       (79, 6),
       (80, 20);
      
      
select * from employee_salary;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Таблица roles

Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table roles(
    id serial primary key,
    role_name int unique not null
);

alter table roles 
alter column role_name type varchar(30) using role_name::varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');

select * from roles;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Таблица roles_employee

Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table roles_employee(
    id serial primary key,
    employee_id int unique not null,
    role_id int not null,
    foreign key (employee_id)
        references employees(id),
    foreign key (role_id)
        references roles(id)
);

insert into roles_employee(employee_id, role_id)
values (7, 2),
       (20, 4),
       (3, 9),
       (5, 13),
       (23, 4),
       (11, 10),
       (10, 9),
       (22, 13),
       (21, 3),
       (48, 4),
       (6, 7),
       (4, 9),
       (32, 1),
       (55, 8),
       (43, 10),
       (13, 1),
       (54, 9),
       (34, 19),
       (33, 14),
       (9, 18),
       (12, 8),
       (14, 11),
       (56, 19),
       (1, 11),
       (35, 9),
       (41, 2),
       (44, 7),
       (66, 12),
       (8, 16),
       (15, 9),
       (65, 4),
       (39, 13),
       (19, 18),
       (37, 17),
       (67, 8),
       (70, 6),
       (60, 9),
       (61, 4),
       (53, 18),
       (59, 12);

select * from roles_employee;
