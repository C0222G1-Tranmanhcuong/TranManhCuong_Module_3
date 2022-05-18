USE furama_management;

-- Task 2:

SELECT *  FROM nhan_vien
WHERE (reverse( substring(reverse(ho_ten), 1, instr(reverse(ho_ten), ' '))) LIKE ' H%'
OR reverse( substring(reverse(ho_ten), 1, instr(reverse(ho_ten), ' '))) LIKE ' T%'
OR reverse( substring(reverse(ho_ten), 1, instr(reverse(ho_ten), ' '))) LIKE ' K%') AND char_length(nhan_vien.ho_ten)<= 15;

-- Task 3:

select * from khach_hang where ngay_sinh having (timestampdiff(year,ngay_sinh,current_date()) between 18 and 50) and (dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị');

-- Task4:

SELECT khach_hang.ho_ten, khach_hang.ma_khach_hang , loai_khach.ten_loai_khach, count(hop_dong.ma_khach_hang) AS so_lan_dat_phong FROM hop_dong
JOIN khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
JOIN loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
GROUP BY hop_dong.ma_khach_hang HAVING loai_khach.ten_loai_khach = 'diamond'
ORDER BY so_lan_dat_phong ;

-- Task 5:

SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach,
 hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.ten_dich_vu,
 sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)) AS tong_tien,count(hop_dong.ma_khach_hang) AS so_lan_dat_phong FROM hop_dong_chi_tiet
 JOIN hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 JOIN dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
RIGHT JOIN khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
GROUP BY ma_khach_hang;

-- Task 6: 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM dich_vu
JOIN loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT in (SELECT ma_dich_vu FROM hop_dong WHERE quarter(ngay_lam_hop_dong) = 1 and year(ngay_lam_hop_dong)=2021);

-- Task 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

 SELECT   dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.so_nguoi_toi_da, dich_vu.dien_tich,dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM dich_vu
 JOIN loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 WHERE (dich_vu.ma_dich_vu in (SELECT ma_dich_vu FROM hop_dong WHERE year(ngay_lam_hop_dong) = 2020)) and (dich_vu.ma_dich_vu
 not in (SELECT ma_dich_vu FROM hop_dong WHERE year(ngay_lam_hop_dong) = 2021));
 
 -- Task 8: 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
 
 -- Cách 1:
 SELECT DISTINCT ho_ten FROM khach_hang; 
 
 -- Cách2: 
 
 SELECT ho_ten FROM khach_hang GROUP BY khach_hang.ho_ten;
 
 -- Task 9: 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.


SELECT  month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as so_lan_dat_phong FROM hop_dong
WHERE year(ngay_lam_hop_dong) = 2021
GROUP BY thang;

-- Task 10: 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, sum(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem FROM hop_dong_chi_tiet
JOIN hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY ma_hop_dong;


-- Task 11: 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai FROM  dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct  on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 WHERE lk.ten_loai_khach = 'gold' AND ( kh.dia_chi LIKE '%Vinh%' OR  kh.dia_chi LIKE '%Quảng Ngãi%' ); 
 
 -- Task 12: 	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
 -- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
 -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.


SELECT hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien , kh.ho_ten as ho_ten_khach_hang,
 kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
FROM hop_dong_chi_tiet hdct
JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
JOIN nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
WHERE EXISTS( SELECT ma_dich_vu from hop_dong where quarter(ngay_lam_hop_dong) = 4 AND year(ngay_lam_hop_dong) = 2020 and hop_dong.ma_dich_vu = dv.ma_dich_vu)
AND Not EXISTS  (SELECT ma_dich_vu FROM hop_dong WHERE quarter(ngay_lam_hop_dong) in(1,2) AND year(ngay_lam_hop_dong) =2021 AND hop_dong.ma_dich_vu = dv.ma_dich_vu)
GROUP BY hd.ma_hop_dong;

-- Task 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)

SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, sum(hdct.so_luong) as so_lan_dat FROM hop_dong_chi_tiet hdct
JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY ma_dich_vu_di_kem
HAVING sum(hdct.so_luong) >= ( SELECT sum(hdct.so_luong) FROM hop_dong_chi_tiet hdct GROUP BY ma_dich_vu_di_kem ORDER BY sum(hdct.so_luong) DESC LIMIT 1)
;

-- Task 14: 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

 SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung FROM hop_dong hd
 JOIN dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
 JOIN hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 JOIN dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
 GROUP BY ten_loai_dich_vu
 HAVING count(hdct.ma_dich_vu_di_kem) = 1;
 
 -- Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
 -- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. 

SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as so_luong_hop_dong  
FROM nhan_vien nv
JOIN hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
WHERE year(hd.ngay_lam_hop_dong) = 2020 OR year(hd.ngay_lam_hop_dong)= 2021
GROUP BY nv.ma_nhan_vien
HAVING count(hd.ma_nhan_vien) <= 3;

-- Task 16:	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien 
WHERE nhan_vien.ma_nhan_vien not in (SELECT hop_dong.ma_nhan_vien FROM hop_dong WHERE year(ngay_lam_hop_dong) IN (2020, 2021)) ;




