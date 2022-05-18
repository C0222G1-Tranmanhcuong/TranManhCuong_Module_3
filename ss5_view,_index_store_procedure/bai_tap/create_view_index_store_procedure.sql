CREATE DATABASE demo;
USE demo; 

CREATE TABLE products(
id int not null PRIMARY key,
product_code VARCHAR(25),
product_name VARCHAR(45),
product_price DOUBLE,
product_amount int,
product_description VARCHAR(45),
product_status VARCHAR(45)
);

----------------------------------
 INSERT INTO products VALUES(1,'A01','nokia',10000.0,5,'bàn phím','ok');
 INSERT INTO products VALUES(2,'A02','iphone',20000.0,4,'cảm ứng','ok');
 INSERT INTO products VALUES(3,'A03','sam sung',15000.0,3,'bàn phím','ok');
 INSERT INTO products VALUES(4,'A04','xiaomi',30000.0,2,'cảm ứng','not ok');
 
 --------------------------------
  -- Task 1: Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
  
  CREATE UNIQUE INDEX i_product_code on products(product_code);
  
  -- Task 2: Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
  
  CREATE INDEX i_products on products(product_name, product_price);
  
  -- Task 3: Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
  
  EXPLAIN SELECT * FROM products WHERE product_name = 'iphone';
  
  -- Task 4: Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
  
  CREATE VIEW w_product as
  SELECT product_code, product_name, product_price, product_status FROM products ;
  SELECT * FROM w_product;
  
  SELECT * FROM w_product;
  
  -- Task 5: Tiến hành sửa đổi view, Tiến hành xoá view.
  
  UPDATE w_product 
  SET product_price = 15000.0
  WHERE product_code = 'A01';
  
  DELETE FROM w_product
  WHERE product_code = 'A04';
  
  -- Task 6: Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
  
  delimiter \\
  CREATE PROCEDURE sp_get_all_product()
  BEGIN
  SELECT * FROM products;
  END \\
  delimiter ;
  
  CALL sp_get_all_product;
  
  -- Task 7: Tạo store procedure thêm một sản phẩm mới, Tạo store procedure sửa thông tin sản phẩm theo id, Tạo store procedure xoá sản phẩm theo id:
  
  delimiter \\
  CREATE PROCEDURE sp_add_product()
  BEGIN
  INSERT INTO products VALUES(5, 'A07', 'sony', 18000.0, 10,'cảm ứng','ok');
  END \\
  delimiter ;
  CALL sp_add_product;
  
  delimiter \\
  CREATE PROCEDURE sp_update_product(In p_id int,  p_price double)
  BEGIN
  UPDATE products
  set product_price = p_price
  WHERE id = p_id;
  END \\
  delimiter ;
  
  CALL sp_update_product(2, 400000.0);
  
   delimiter \\
  CREATE PROCEDURE sp_delete_product( in p_id int)
  BEGIN
  DELETE FROM products
  WHERE id = p_id;
  END \\
  delimiter ;
  CALL sp_delete_product(1);
  
  
	
  
  