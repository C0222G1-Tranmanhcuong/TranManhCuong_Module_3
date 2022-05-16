use quan_ly_sinh_vien;

select * from student 
where student_name like 'H%';

SELECT * FROM class
 WHERE month(start_date)= 12;

select * from `subject`
 where credit between 3 and 5;

update student set class_id = 2
 where student_name = 'Hung';
 

select s.student_name, sub.sub_name, m.mark from mark m 
join `subject` sub on m.sub_id = sub.sub_id
join student s on m.student_id = s.student_id
ORDER BY mark , student_name   ;