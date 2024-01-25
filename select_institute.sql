create database select_institute;

--เข้าถึงฐานข้อมูล institute
use select_institute;

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
    Year_s bigint not null,
    Greade varchar(3) not null,
    primary key (SubID, StdID),
    foreign key (SubID) references subject_t(SubID),
    foreign key (StdID) references student(StdID)

);

--นำข้อมูลเข้าตาราง teacher
insert into teacher (TchID, tName, tSruname, City, Phone) values 
    (1,'Suriya','Jandee','Bangkok','086571234'),
    (2,'Arita','Tanathanee','Trang','0879112411'),
    (3,'Thanin','Kumtawan','Songkhal','0895945353');


--นำข้อมูลเข้าตาราง student 
insert into  student (StdID, sName, sSurname, Major, Gender, TchID) values 
    (5250110200,'Sakchi','Chaitungroj','COM','Male',2),
    (5250110201,'Thanapong','Pongsakul','COM','Male',1),
    (5250110202,'Karnda','Sangjai','COM','Female',2),
    (5250115555,'Numging','sadthananan','ECOM','Female',3),
    (5250113556,'Angkor','Nakornwat','ECOM','Male',3);


--นำข้อมูลเข้าตาราง subject ------------------------------------------------------------
insert into subject_t (SubID, SubName, Creadit, TchID) values
    ('946-240','Database Systems',2,3),
    ('946-250','Principle of Electronic',4,2),
    ('946-343','Information System Design and Implemantation',3,1),
    ('942-100','Extra Curriculum',1,1);

--นำข้อมูลเข้าตาราง register 
insert into register values
    ('942-100',5250113556,1,2552,'A'),
    ('946-240',5250110201,1,2553,'D+'),
    ('946-240',5250110202,1,2553,'C'),
    ('946-240',5250115555,1,2554,'B+'),
    ('946-250',5250115555,1,2554,'B'),
    ('946-250',5250113556,1,2554,'B+');

--1
select * from student order by sName;

--2
select * from student where Gender='Female';

--3 
select * from student where Major = 'ECOM';

--4
select SubID,Year_s from register where Year_s = 2554;

--5
select StdID,Greade from register where Greade = 'B+' and Year_s = 2554;

--6
select * from teacher where City = 'Songkhal';

--7
select * from student where right(StdID,2) = '55';

--8
select * from student where lower(sName) LIKE '%a%';

--9
select StdID,Semester,Year_s,Greade from register where Greade in ('A','B','B+'); 

--10
select *, count(*) as Gender from student where Gender = 'Female' group by Major;

--11
select * from subject_t order by Creadit desc;

--12
select * from subject_t where Creadit >= 2 order by SubName asc;

--13
select major, count(StdID) as StdID_Count from student group by major order by StdID_Count asc;

--14
select * from subject_t order by length(SubName) desc, SubName desc;

--15
select StdID from register where Greade in ('B','B+','A','A+');

--16
select * from student where sName like 'a%r';

--17
select * from student order by length(sName) limit 1;

--18
select SubID,SubName,TchID from subject_t;

--19
select StdID,SubID,Greade from register where Year_s = 2554;

--20
select * from student order by StdID limit 10 offset 2;

--21
select * from subject_t order by Creadit asc limit 2;

--22
select * from student order by RAND() limit 1;

--23
select * from student order by RAND() limit 3;

--24
select * from student join teacher on student.TchID = teacher.TchID where teacher.tName = 'Suriya';

--25
select * from teacher where city = 'Songkhal';

--26
select * from student order by sName asc;

--27
select sName,sSurname from student where major = 'COM' and Gender = 'Male';

--28
select sName,sSurname from student join teacher on student.TchID = teacher.TchID where major = 'COM' and teacher.tName = 'Arita';

--29
select * from subject_t where Creadit < 3;

--30
select * from subject_t where Creadit < 2;
