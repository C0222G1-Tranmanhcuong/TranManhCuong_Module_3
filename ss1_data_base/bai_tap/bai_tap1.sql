create database if not exists student_management;
use student_management;
create table class (
id int,
`name` varchar(50)
);
create table teacher(
id int,
`name` varchar(50),
age int,
country varchar(100)
);
insert into class values(1,'Tran Manh Cuong');
insert into class values(2,'Nguyen Ha Phuong');
insert into class values(3,'Mai The Hung');
select * from class;
alter table teacher modify age date;
insert into teacher values(1, 'Truong Tan Hai','1990-05-06','DN');
insert into teacher values(2, 'Tran van Chanh','1984-06-05','Hue');
insert into teacher values(3, 'Tran Minh Chien','1997-04-03','QB');
select * from teacher;
update class set `name` = 'c022g1' where id = 1;
update class set `name` = 'c022g2' where id = 2;
update class set `name` = 'c022g3' where id = 3;


