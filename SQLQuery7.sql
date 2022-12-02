create table Employee
(Empid int identity primary key,
FirstName varchar(50),
LastName varchar(50),
Age int,
Salary int,
);
insert into Employee values('ajay','mishra',23,250000);
insert into Employee values('rahual','jadhav',23,350000);
insert into Employee values('akash','biradar',53,450000);
select*from Employee;

 create  procedure spInsert
   @fname varchar(50),
   @lname varchar(50),
   @age int , 
   @salary int
   AS
   BEGIN
   insert into Employee values(@fname,@lname,@age,@salary);
   END
