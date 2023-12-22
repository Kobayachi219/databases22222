--สร้างฐานข้อมูลชื่อ hospital
create database hospital;

--เรียกใช้ฐานข้อมูลชื่อ hospital
use hospital;

--สร้างตารางชื่อ patient และโครงสร้าง
create table patient (
    Pid varchar(7) not null,
    Pname varchar(20) not null,
    Pbirthdate date not null,
    Paddress varchar(50) not null,
    Ptel varchar(11) not null,
    primary key (Pid)
);

--สร้างตารางชื่อ doctor และโครงสร้าง
create table doctor (
    Did varchar(6) not null,
    Dname varchar(20) not null,
    Daddress varchar(100) not null,
    Dtel varchar(11) not null,
    primary key (Did)
);

--สร้างตาราง medicine และโครงสร้าง
create table medicine (
    Mid varchar(6) not null,
    Mname varchar(20) not null,
    MMeasurement varchar(100) not null,
    Mamount tinyint not null,
    Mprice float not null,
    primary key (Mid)
);

--สร้างตาราง rpescription และโครงสร้าง
create table prescription (
    Prs_id varchar(6) not null,
    Prs_date date not null,
    Pid varchar(7) not null,
    Did varchar(6) not null,
    primary key (Prs_id),
    foreign key (Pid) references patient(Pid),
    foreign key (Did) references doctor(Did)
);

--สร้างตาราง prescription_detail และโครงสร้าง
create table prescription_detail (
    Prs_id varchar(6) not null,
    Mid varchar(6) not null,
    Amount tinyint not null,
    primary key (Prs_id, Mid),
    foreign key (Prs_id) references prescription(Prs_id),
    foreign key (Mid) references medicine(Mid)
);

--นำข้อมูลเข้าตาราง patient (2.1)
insert into patient values 
    ('12150','Sanook','2000-03-11','Bangkok','025684525'),
    ('12151','Kapook','1995-01-28','Trang','075215623'),
    ('12152','Lemon','1980-12-24','Songkhla','074256325'),
    ('13310','Supachai','1996-05-17','Lampang','06951234558'),
    ('11200','Araimilo','2007-10-23','Samussakon','0651234458');

--นำข้อมูลเข้าตาราง doctor(2.2)
insert into doctor values 
    ('D0001','SOMJAI','102/2 Kuangpring, Trang','0894561026'),
    ('D0002','SUKSRI','86 Happy Rd, Phuket','0817889562'),
    ('D0003','NAKORN','39 M.6, Muang, Bangkok','0851256981'),
    ('D0004','THUMMA','12/45 Srilom, Krabi','0842567841');

--นำข้อมูลเข้าตาราง medicine(2.3)
insert into medicine values
    ('M0001','Paracetamol','tablet',2000,1.0),
    ('M0002','Amoxy','capsule',3500,2.0),
    ('M0003','Vitamin C','tablet',5000,0.5);

--นำข้อมูลเข้าตาราง prescription(2.4)
insert into prescription values
    ('10001','2010-01-25','12150','D0001'),
    ('10002','2010-01-25','13310','D0003'),
    ('10003','2010-07-13','12150','D0002'),
    ('10004','2010-08-28','11200','D0002');

--นำข้อมูลเข้าตาราง prescription_detail(2.5)
insert into prescription_detail values
    ('10001','M0001',10),
    ('10001','M0002',12),
    ('10002','M0003',15),
    ('10003','M0003',30),
    ('10004','M0001',20),
    ('10004','M0003',40);

--เปลี่ยนชื่อ Lemon เป็น Orange ในตาราง patient(2.6)
update patient set Pname='Orange' where Pname='Lemon';

--เปลี่ยน Did ของชื่อ Natty เป็น Did D003(2.7)
update doctor set Dname='Natty' where Did='D003';

--นำข้อมูลเข้าตาราง patient(2.8)
insert into patient values
    ('12149','Tawan','2001-05-11','Rayong','022681125'),
    ('12146','Sky','1999-01-28','Yala','073562541');

--นำข้อมูลเข้าตาราง prescription(2.9)
insert into prescription values
    ('10001','2010-01-25','12149','D0001');

--นำข้อมูลเข้าตาราง prescription(2.10)
insert into prescription values
    ('10001','2010-01-25','12148','D0005');

--แสดงข้อมูลตาราง patient(2.11)
select * from patient;

--แสดงข้อมูลตาราง doctor(2.12)
select * from doctor;

--แสดงข้อมูลตาราง medicine(2.13)
select * from medicine;

--แสดงข้อมูลตาราง prescription(2.14)
select * from prescription;

--แสดงข้อมูลตาราง prescription_detail(2.15)
select * from prescription_detail;

--ลขข้อมูลในตาราง doctor ที่มี Did เป็น D0001(2.16)
delete from doctor where Did='D0001';

--ลขข้อมูลในตาราง patient ที่มี Did เป็น 12146(2.17)
delete from patient where Pid='12146';

--เปลี่ยน Did ของตาราง doctor เป็น D002 ของข้อมูลที่มี Did เป็น D009(2.18)
update doctor set Did='D0009' where Did='D0002';

--เปลี่ยน Did ของตาราง doctor เป็น D004 ของข้อมูลที่มี Did เป็น D008(2.19)
update doctor set Did='D0008' where Did='D0004';

