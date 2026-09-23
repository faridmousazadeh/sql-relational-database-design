/*
   IST 659 — Data Administration Concepts and Database Management
   Portfolio version — logic preserved from the original submission.
*/

--create database xyz
--famousaz
create database xyz
go 
use xyz
go
drop table if exists xyz_consulting
go
create table xyz_consulting
(
    project_id int not null,
    project_name varchar(50) not null,
    employee_id int not null,
    employee_name varchar(50) not null,
    rate_category char(1) not null,
    rate_amount money not null,
    billable_hours int not null,
    total_billed money not null,
    constraint pk_xyz_consulting primary key(project_id, employee_id)
)
insert into xyz_consulting values 
(1023,	'Madagascar travel site',	11,	'Carol Ling',	'A',	 60.00, 	5,	 300.00 ),
(1023,	'Madagascar travel site',	12,	'Chip Atooth',	'B',	 50.00, 	10,	 500.00 ),
(1023,	'Madagascar travel site',	16,	'Charlie Horse',	'C',	 40.00, 	2,	 80.00), 
(1056,	'Online estate agency',	11,	'Carol Ling',	'D',	 90.00, 	5,	 450.00 ),
(1056,	'Online estate agency',	17,	'Avi Maria',	'B',	 50.00, 	2,	 100.00 ),
(1099,	'Open travel network',	11,	'Carol Ling',	'A',	 60.00, 	6,	 360.00 ),
(1099,	'Open travel network',	12,	'Chip Atooth',	'C',	 40.00, 	8,	 320.00 ),
(1099,	'Open travel network',	14,	'Arnie Hurtz',	'D',	 90.00, 	3,	 270.00 )
GO

select distinct project_id, project_name from xyz_consulting order by project_name


--famousaz
--4

drop table if exists xyz_projects;
go

select distinct project_id, project_name
into xyz_projects
from xyz_consulting;
go

alter table xyz_projects
add constraint pk_xyz_projects primary key (project_id);
go

select * from xyz_projects;
go 

--famousaz
drop table if exists xyz_employees;
go

select distinct employee_id, employee_name
into xyz_employees
from xyz_consulting;
go

alter table xyz_employees
add constraint pk_xyz_employees primary key (employee_id);
go

select * from xyz_employees;
go 

--famousaz
drop table if exists xyz_consulting_2nf;
go

select project_id, employee_id, rate_category, rate_amount, billable_hours, total_billed
into xyz_consulting_2nf
from xyz_consulting;
go

alter table xyz_consulting_2nf
add constraint pk_xyz_consulting_2nf primary key (project_id, employee_id);
go

select * from xyz_consulting_2nf;
go 

--famousaz
--5
drop table if exists xyz_rates;
go

select distinct rate_category, rate_amount
into xyz_rates
from xyz_consulting_2nf;
go

alter table xyz_rates
add constraint pk_xyz_rates primary key (rate_category);
go

select * from xyz_rates;
go 

--famousaz
drop table if exists xyz_consulting_3nf;
go

select project_id, employee_id, rate_category, billable_hours
into xyz_consulting_3nf
from xyz_consulting_2nf;
go

alter table xyz_consulting_3nf
add constraint pk_xyz_consulting_3nf primary key (project_id, employee_id);
go

select * from xyz_consulting_3nf;
go 

--famousaz
--7
alter table xyz_consulting_3nf
add constraint fk_xyz_consulting_projects
foreign key (project_id) references xyz_projects(project_id);
go

alter table xyz_consulting_3nf
add constraint fk_xyz_consulting_employees
foreign key (employee_id) references xyz_employees(employee_id);
go

alter table xyz_consulting_3nf
add constraint fk_xyz_consulting_rates
foreign key (rate_category) references xyz_rates(rate_category);
go 
