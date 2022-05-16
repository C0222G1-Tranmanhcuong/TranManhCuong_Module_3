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
JOIN loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_khach_hang
GROUP BY hop_dong.ma_khach_hang HAVING loai_khach.ten_loai_khach = 'platinium'
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

-- Task 6: 

SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM hop_dong
JOIN dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
JOIN loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT in (SELECT ma_dich_vu FROM hop_dong WHERE month(ngay_lam_hop_dong) = 1 OR 2 OR 3)



 
 

