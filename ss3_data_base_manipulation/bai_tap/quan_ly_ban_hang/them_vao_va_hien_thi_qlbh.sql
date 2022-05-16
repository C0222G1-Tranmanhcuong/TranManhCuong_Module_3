USE quan_ly_ban_hang1;

INSERT INTO customer 
values (1, 'Minh Quan', 10);

INSERT INTO customer 
values (2, 'Ngoc Oanh', 20);

INSERT INTO customer 
values (3, 'Hong Ha', 50);

INSERT INTO `order`
values (1,1, '2006-03-21', null), 
(2,2, '2006-03-23', null),
(3,1, '2006-03-16', null);



INSERT INTO product 
values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
 (3, 'Dieu Hoa', 7),
 (4, 'Quat', 1),
 (5, 'Bep Dien', 2);

INSERT INTO order_detail 
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

SELECT `order`.o_id, `order`.o_date, `order`.o_total_price FROM `order`;
----------------------

SELECT `order`.o_id, customer.c_id, customer.c_name,product.p_id, product.p_name  FROM order_detail
JOIN  `order` on `order`.o_id = order_detail.o_id
JOIN  customer on customer.c_id = `order`.c_id 
JOIN product on product.p_id = order_detail.p_id;

----------------------------------------

SELECT customer.c_id, customer.c_name from customer 
WHERE customer.c_id not in (SELECT c_id FROM `order`);

----------------------------------------

SELECT `order`.o_id, `order`.o_date, sum( order_detail.od_qty * product.p_price) as so_lan_dat_hang  FROM  `order` 
INNER JOIN order_detail on  order_detail.o_id = `order`.o_id
INNER JOIN product on product.p_id = order_detail.p_id
GROUP BY `order`.o_id; 


