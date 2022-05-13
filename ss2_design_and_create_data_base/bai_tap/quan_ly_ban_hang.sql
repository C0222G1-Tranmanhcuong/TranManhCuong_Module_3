create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key,
c_name varchar(60),
c_age int
);
 insert into customer values(1,'Tran Manh Cuong',25);
 insert into customer values(2,'Nguyen Ha Phuong',27);
 select * from customer;
create table `order`(
o_id int primary key,
c_id int,
o_date date,
o_total_price double,
foreign key (c_id) references customer (c_id)
);
insert into `order` values(1,1,'2022-05-12',20000.0);
insert into `order` values(2,2,'2022-05-12',20000.0);
select * from `order`;


create table product(
p_id int primary key,
p_name varchar(60),
p_price double
);
insert into product values(1, 'cafe',12000.0);
insert into product values(2, 'sting',10000.0);
select* from product;

create table order_detail(
o_id int,
p_id int,
od_qty int,
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);
insert into order_detail values(1,1,5);
insert into order_detail values(2,2,6);
select* from order_detail;