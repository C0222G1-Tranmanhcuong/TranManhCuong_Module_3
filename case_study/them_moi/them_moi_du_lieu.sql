use furama_management;

insert into vi_tri values(1,'lễ tân');
insert into vi_tri values(2,'phục vụ');
insert into vi_tri values(3,'chuyên viên');
insert into vi_tri values(4,'giám sát');
insert into vi_tri values(5,'quản lý');
insert into vi_tri values(6,'giám đốc');

------------------------------------------

insert into trinh_do values(1,'trung cấp');
insert into trinh_do values(2,'cao đẳng');
insert into trinh_do values(3,'đại học');
insert into trinh_do values(4,'sau đại học');

-----------------------------------------

insert into bo_phan values(1,'sale-marketing');
insert into bo_phan values(2,'hành chính');
insert into bo_phan values(3,'phục vụ');
insert into bo_phan values(4,'quản lý');

------------------------------------------

insert into loai_khach values(1,'diamond');
insert into loai_khach values(2,'platinium');
insert into loai_khach values(3,'gold');
insert into loai_khach values(4,'silver');
insert into loai_khach values(5,'member');

-----------------------------------------

insert into kieu_thue values(1,'long term');
insert into kieu_thue values(2,'short term');

-----------------------------------------

insert into loai_dich_vu values(1,'villa');
insert into loai_dich_vu values(2,'house');
insert into loai_dich_vu values(3,'room');

-------------------------------------------

insert into dich_vu_di_kem values(1,'massage', 3000.0,'abc','open');
insert into dich_vu_di_kem values(2,'karaoke',4000.0, 'bca','open');
insert into dich_vu_di_kem values(3,'thức ăn',2000.0,'cba','close');
insert into dich_vu_di_kem values(4,'nước uống',1000.0,'aaa','open');
insert into dich_vu_di_kem values(5,'thuê xe',5000.0,'qaz','open');

------------------------------------------

insert into nhan_vien values(1,'Trần Mạnh Cường','1997-01-28',
'9272636',10000.0,'0332920629',
'cuongpro@.com','Quảng Bình',2,3,3);

insert into nhan_vien values(2,'Hoàng Ngọc Kiên','1999-05-15',
'3747238',20000.0,'0332920627',
'nampro@.com','Đà Nẵng',1,2,2);

insert into nhan_vien values(3,'Nguyễn Hà Phương','1995-09-04',
'3462772',30000.0,'0332920635',
'phuongpro@.com','Nghệ An',3,2,1);
insert into nhan_vien values(4,'Cao Xuân Hải','2000-01-11',
'5324342',40000.0,'0332946753',
'minhgpro@.com','Thanh Hoá',1,3,4);

--------------------------------------------------

insert into khach_hang values(1,2,'Nguyễn Văn An','1997-03-30',
1,'2331123','0123123123','anpro@.vn','Đà Nẵng');

insert into khach_hang values(2,3,'Lê Anh Dũng','2000-09-05',
1,'233112323','0123123456','dungpro@.vn','Vinh');

insert into khach_hang values(3,5,'Trần Kiều Vi','1971-03-30',
1,'233112563','0123123123','vipro@.vn','Vinh');

insert into khach_hang values(4,1,'Trương Đình Hoàng','2012-11-21',
1,'233113223','0123123789','anpro@.vn','Quảng Ngãi');

insert into khach_hang values(5,1,'Kiều Minh Tuấn','2002-10-10',
1,'233113223','0123123789','tuanpro@.vn','Quảng Trị');

insert into khach_hang values(6,4,'Nguyễn Văn An','1997-03-30',
1,'2331123','0123123123','anpro@.vn','Đà Nẵng');
----------------------------------------------------

insert into dich_vu values(1,'villa beach fort',32,11000.0,4,1,1,'vip','good',33.0,5);
insert into dich_vu values(2,'room twin01',40,11000.0,5,2,3,null,null,null,null);
insert into dich_vu values(3,'House Princess 02',25,11000.0,6,1,2,'vip','good',null,6);
-----------------------------------------------------

insert into hop_dong values(1,'2020-11-08 00:00:00','2020-12-08 00:00:00',0,1,2,1);
insert into hop_dong values(2,'2020-07-04 00:00:00','2020-07-04 00:00:00',10000.0,2,3,2);
insert into hop_dong values(3,'2021-02-12 00:00:00','2020-04-12 00:00:00',11000.0,3,4,3);
insert into hop_dong values(4,'2021-09-15 00:00:00','2020-12-08 00:00:00',0,1,2,3);
insert into hop_dong values(5,'2021-10-08 00:00:00','2021-12-08 00:00:00',0,1,2,1);

-------------------------------------------------------

insert into hop_dong_chi_tiet values(1,2,2,10);
insert into hop_dong_chi_tiet values(2,1,2,10);
insert into hop_dong_chi_tiet values(3,4,2,10);
insert into hop_dong_chi_tiet values(4,3,3,10);
insert into hop_dong_chi_tiet values(5,5,3,10);
insert into hop_dong_chi_tiet values(6,4,1,10);

 -- drop database furama_management;