USE quan_ly_sinh_vien1;

-- Task 1: Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

SELECT *, max(credit) as credit_lon_nhat   FROM `subject`;

-- Task 2: Hiển thị các thông tin môn học có điểm thi lớn nhất.

SELECT *, max(mark) FROM `subject`
JOIN mark on mark.sub_id = `subject`.sub_id;

-- Task 3 : Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT *, avg(m.mark)  as diem_trung_binh FROM student st
JOIN mark m on st.student_id = m.student_id
GROUP BY st.student_id
ORDER BY diem_trung_binh DESC ;

