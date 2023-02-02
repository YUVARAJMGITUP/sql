create database studentinfo;
drop database studentinfo;
drop table student;
use studentinfo;
create table student(student_id int not null auto_increment,first_name varchar(55),last_name varchar(55),
date_of_birth date,age int,gender varchar(66),address varchar(66) default "tamil nadu",
mobile_no bigint,email varchar(55),check (age>=10),primary key(student_id));
desc student;
insert into student(student_id,first_name,last_name,date_of_birth,age,gender,address,mobile_no,email) values
(1,"arjun","M","2000-11-07",21,"male","pandichery",8361746471,"arjun78@gmail.com"),
(2,"venkat","kumar","2001-12-24",21,"male","chennai",7361746471,"venkat78@gmail.com"),
(3,"devika","dhivya","2000-10-07",21,"female","vellore",9161746471,"devika668@gmail.com"),
(4,"vignesh","kumar","2000-01-09",20,"male","selam",8361746489,"vignesh@gmail.com"),
(5,"jegan","raj","1998-06-07",24,"male","krishnagiri",6361746470,"jegan@gmail.com"),
(6,"sovrav","ji","1996-07-07",26,"male","thirutchi",9361746477,"sovravyuva87@gmail.com"),
(7,"ranjith","Magesh","1999-09-21",20,"male","covai",6361746476,"ranjithyu@gmail.com"),
(8,"karthi","keyan","2002-11-07",25,"male","madurai",9161746479,"karthi98@gmail.com"),
(9,"vasanth","kumar","2000-02-07",22,"male","bangalore",8361749471,"vasanth76@gmail.com"),
(10,"abi","sree","2002-12-08",21,"female","chennai",9361746491,"abisree@gmail.com");
select * from student;
select first_name from student;
select last_name from student;
select * from student having age >=25;
select concat(first_name,"  ",last_name) from student;
select distinct address from student;
select count(distinct gender ) from student;
select * from student order by last_name desc;




