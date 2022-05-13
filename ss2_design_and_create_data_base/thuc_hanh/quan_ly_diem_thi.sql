create database if not exists quan_ly_diem_thi;
use quan_ly_diem_thi;
create table HocSinh (
MaHS varchar(20) primary key,
TenHS varchar(50),
NgaySinh date,
Lop varchar(20),
GT varchar(20)
);

insert into HocSinh values('A1',' Tran Manh Cuong', '1997-01-28','c022g1','nam');
insert into HocSinh values('A2',' Tran Manh Tuan', '1999-02-01','c022g1','nam');
select * from HocSinh;

create table MonHoc(
MaMH varchar(20) primary key,
TenMH varchar(50)
);

create table BangDiem (
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT date,
primary key(MaHS,MaMH),
foreign key(MaHS) references HocSinh(MaHS),
foreign key(MaMH) references MonHoc(MaMH)
);

create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);

insert into GiaoVien values('GV1','Nguyen Van A','0929383');
select * from GiaoVien;
