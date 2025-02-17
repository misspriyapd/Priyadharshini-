#database creation
create database employeemanagement;
use employeemanagement;

#table creation
create table department(id int primary key auto_increment,
emp_name varchar(50) not null
);

 #inserting records
 insert into department values (101,'ragul'),(102,'preetha'),(103,'keerthi');
 
 select*from department;
 
 #employee table creation
 create table employee (id int primary key auto_increment,
 emp_name varchar(50),
 age int not null,
 gender varchar(10),
 salary int not null,
 depatment_id int references department (id)
 );
 
  #inserting records
  insert into  employee values (01,'ragul',25,'male',35000,101),(02,'preetha',27,'female',45000,102),(03,'keerthi',22,'female',20000,103);
  select*from employee;
describe  employee;
 select*from employee where salary >30000
 


# Projects Table creation

create table project (project_id int primary key auto_increment,
     emp_name varchar (10) not null,
     budget int not null);
     
     insert into project values (1001,'ragul',20000),(1002,'preetha',25000),(1003,'keerthi',9000);
     select*from project;
     select*from project where budget >10000
      
      
      #employee project creation
      
      create table emp_project(emp_id int, project_id int,
      foreign key (emp_id) references employee(id),
      foreign Key (project_id) references project(project_id),
      primary key(emp_id,project_id)
      );
      
      insert into emp_project values (01,1001),(02,1002),(03,1003);
      select*from emp_project;
      
      #employee  attendance table creation
      
      create table attendance(id int primary key auto_increment,
      emp_id int,
      foreign key (emp_id) references employee (id),
      emp_date date,
      status enum('present','absent','on leave')
      );
       
      insert into attendance values (111,01,'21-01-25','absent'),(222,02,'20-01-25','present'),(333,03,'22-01-25','on leave');
      select*from attendance;
      
      



