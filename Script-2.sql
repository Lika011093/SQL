create table salary(
    id serial primary key,
    monthly_salsry int not null
);

create table roles(
    id serial primary key,
    role_title varchar (50) unique not null
);

create table roles_salary(
    id serial primary key,
    id_role int not null,
    id_salary int not null,
    foreign key (id_role)
        references roles(id),
    foreign key (id_salary)
        references salary(id)
);

insert into salary(monthly_salsry)
values (1200),
       (700),
       (500),
       (1500),
       (1800),
       (1900),
       (2800),
       (5000),
       (200),
       (3200),
       (1350),
       (2400);
      
insert into roles(role_title)
values ('QA_manual_junior'),
       ('QA_manual_middle'),
       ('QA_manual_senior'),
       ('QA_automation_junior'),
       ('QA_automation_middle'),
       ('QA_automation_senior'),
       ('Java_developer_junior'),
       ('Java_developer_middle'),
       ('Java_developer_senior');
       
insert into roles_salary(id_role, id_salary)
values (44, 1),
       (46, 2),
       (47, 4),
       (48, 8),
       (49, 3),
       (44, 5),
       (50, 12),
       (51, 10),
       (43, 9),
       (45, 6);
      
alter table roles 
add column parking int;

update roles
set parking = 1
where id in (45, 48, 51);

alter table roles
rename column parking to taxi;

alter table roles 
drop column taxi;

      
select * from roles order by id;
select * from salary;
