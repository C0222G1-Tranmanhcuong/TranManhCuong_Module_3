create database management_student;
use management_student;

CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATE NOT NULL,
    `status` BIT
);

CREATE TABLE student (
    student_id INT NOT NULL AUTO_INCREMENT KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

CREATE TABLE `subject` (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT DEFAULT 1
);

create table mark(
mark_id int not null auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
unique(sub_id, student_id),
foreign key (sub_id) references `subject` (sub_id),
foreign key (student_id) references student (student_id)
);