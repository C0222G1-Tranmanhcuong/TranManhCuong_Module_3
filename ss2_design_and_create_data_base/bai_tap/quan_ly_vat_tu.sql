create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

insert into phieu_xuat values(1,'2022-04-12');
insert into phieu_xuat values(2,'2022-04-15');
select* from phieu_xuat;

create table vat_tu(
ma_vt int primary key,
ten_vt varchar(50)
);

insert into vat_tu values(1, 'sắt');
insert into vat_tu values(2, 'cát');
select * from vat_tu;

create table chi_tiet_phieu_xuat(
so_px int,
ma_vt int,
don_gia_sx double,
so_luong_sx int,
primary key(so_px, ma_vt),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vt) references vat_tu(ma_vt)
);

insert into chi_tiet_phieu_xuat values(1,1,1200.0,5);
insert into chi_tiet_phieu_xuat values(2,2,1100.0,4);
select * from chi_tiet_phieu_xuat;

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

insert into phieu_nhap values(1,'2022-04-10');
insert into phieu_nhap values(2,'2022-04-08');
select * from phieu_nhap;

create table chi_tiet_phieu_nhap(
ma_vt int,
so_pn int,
don_gia_nhap double,
so_luong_nhap int,
primary key(ma_vt,so_pn),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_pn) references phieu_nhap(so_pn)
);

insert into chi_tiet_phieu_nhap values(1,1,1000.0,10);
insert into chi_tiet_phieu_nhap values(2,2,1000.0,11);
select * from chi_tiet_phieu_nhap;

create table nha_cung_cap(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50)
);

insert into nha_cung_cap values(101,'Sông gianh','Qb');
insert into nha_cung_cap values(102,'Sông gianh','Qb');
select * from nha_cung_cap;

create table don_dat_hang(
so_dh int primary key,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
);

insert into don_dat_hang values(1,'2022-05-09', 101);
insert into don_dat_hang values(2,'2022-05-09', 102);
select * from don_dat_hang;

create table chi_tiet_don_dat_hang(
ma_vt int,
so_dh int,
primary key(ma_vt,so_dh),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_dh) references don_dat_hang(so_dh)
);

insert into chi_tiet_don_dat_hang values(1,1);
insert into chi_tiet_don_dat_hang values(2,2);
select * from chi_tiet_don_dat_hang;

create table sdt(
sdt varchar(20),
ma_ncc int primary key,
foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
);

insert into sdt values('09772879',101);
insert into sdt values('09772879',102);
select * from sdt;

-- drop database quan_ly_vat_tu;--



