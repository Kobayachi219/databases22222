--สร้างฐานข้อมูลชื่อ institute
create database institute;

--เข้าถึงฐานข้อมูล institute
use institute;

--สร้างตารางชื่อ teacher และโครงสร้าง
create table teacher (
    TchID tinyint not null,
    tName varchar(15) not null,
    tSruname varchar(15) not null,
    City varchar(15) not null,
    Phone varchar(11),
    primary key (TchID)
);

--สร้างตาราง student และโครงสร้าง และ ข้อมูลของตาราง teacher ด้วย TchID
create table student (
    StdID bigint not null,
    sName varchar(15) not null,
    sSurname varchar(15) not null,
    Major varchar(5) not null,
    Gender varchar(6),
    TchID tinyint,
    primary key (StdID),
    foreign key (TchID) references teacher(TchID)
);

--สร้างตาราง subject และโครงสร้าง และ ข้อมูลของตาราง teacher ด้วย TchID
create table subject_t (
    SubID varchar(10) not null,
    SubName varchar(45) not null,
    Creadit tinyint not null,
    TchID tinyint not null,
    primary key (SubID),
    foreign key (TchID) references teacher(TchID)
);

--สร้างตาราง register และโครงสร้าง และ มีคีย์ร่วมเป็น SubID จากตาราง subject และ StdID จากตาราง student
create table register (
    SubID varchar(10) not null,
    StdID bigint not null,
    Semester tinyint not null,
    Year_s tinyint not null,
    Greade varchar(3) not null,
    primary key (SubID, StdID),
    foreign key (SubID) references subject_t(SubID),
    foreign key (StdID) references student(StdID)

);

--นำข้อมูลเข้าตาราง teacher (1.1)
insert into teacher (TchID, tName, tSruname, City, Phone) values 
    (1,'Suriya','Jandee','Bangkok','086571234'),
    (2,'Arita','Tanathanee','Trang','0879112411'),
    (3,'Thanin','Kumtawan','Songkhal','0895945353');


--นำข้อมูลเข้าตาราง student (1.2)
insert into  student (StdID, sName, sSurname, Major, Gender, TchID) values 
    (5250110200,'Sakchi','Chaitungroj','COM','Male',2),
    (5250110201,'Thanapong','Pongsakul','COM','Male',1),
    (5250110202,'Karnda','Sangjai','COM','Female',2),
    (5250110203,'Numgning','Sadthananan','ECOM','Female',2),
    (5250110204,'Angkor','Nakornwat','ECOM','Male',3),
    (5250113556,'Ariya','Chanom','COM','Female',3),
    (5250115555,'Miracal','Songum','ECOM','Female',1);

--นำข้อมูลเข้าตาราง subject (1.3)------------------------------------------------------------
insert into subject_t (SubID, SubName, Creadit, TchID) values
    ('946-240','Database Systems',2,3),
    ('946-250','Principle of Electronic',4,2),
    ('946-343','Information System Design and Implemantation',3,1),
    ('942-100','Extra Curriculum',1,1);

--นำข้อมูลเข้าตาราง register (1.4)
insert into register values
    ('942-100',5250113556,1,2552,'A'),
    ('946-240',5250110201,1,2553,'D+'),
    ('946-240',5250110202,1,2553,'C'),
    ('946-240',5250115555,1,2554,'B+'),
    ('946-250',5250115555,1,2554,'B'),
    ('946-250',5250113556,1,2554,'B+');

--เปลี่ยนข้อมูลชื่อนักเรียนจาก Sakchai เป็น Sorndee (1.5)
update student set sName='Sorndee' where sName='Sakchai';

--นำข้อมูลเพิ่มเข้าตาราง Subject (1.6)
    insert into subject_t values
        ('946-435','Multimedia Technology',3,3),
        ('947-113','Comptation Mathematics',1,2);

--นำข้อมูลเพิ่มเข้าตาราง Subject (1.7)
insert into subject_t values
    ('946-140','Information Technology',3,4);

--แสดงข้อมูลด้านในตาราง teacher (1.8)
select * from teacher;

--แสดงข้อมูลด้านในตาราง student (1.9)
select * from student;

--แสดงข้อมูลด้านในตาราง register (1.10)
select * from register;

--แสดงข้อมูลด้านในตาราง subject (1.11)
select * from subject_t;

--ลบข้อมูลในตาราง subject ที่มีค่า SubID เท่ากับ 947-113 (1.12)
delete from subject_t where SubID='947-113';

--ลบข้อมูลในตาราง subject ที่มีค่า SubID เท่ากับ 946-240 (1.13)
delete from subject_t where SubID='946-240';

--ลบข้อมูลในตาราง teacher ที่มีค่า TchID เท่ากับ 1 (1.14)
delete from teacher where TchID='1';

--เปลี่ยนข้อมูล SubID ที่มีรหัสเป็น 946-343 เป็น 946-250 (1.15)
update subject_t set SubID='946-250' where SubID='946-343';

--เปลี่ยนข้อมูล SubID ที่มีรหัสเป็น 942-100 เป็น 942-110 (1.16)
update subject_t set SubID='942-110' where SubID='942-100';

--เปลี่ยนข้อมูลรหัสนักเรียนทุกคนเป็น Trang (1.17)
update student set StdID='Trang' where StdID<>1;

--เปลี่ยนข้อมูลรหัสนักเรียนทุกคนเป็น 1111 (1.18)
update student set StdID=1111 where StdID<>1;

--เปลี่ยนชื่อนักเรียนทุกคนเป็น Lion (1.19)
update student set sName='Lion' where sName<>1;