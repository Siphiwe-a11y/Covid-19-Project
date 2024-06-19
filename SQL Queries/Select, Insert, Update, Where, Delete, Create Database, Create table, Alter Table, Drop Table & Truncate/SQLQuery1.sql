--Select everything Query
--Retrives data from a database
select *
from dbo.waterQualityData$;

--Select specific column Query
--Rettrives specified columns from a database
Select Site_Id, [Salinity (ppt)], [Water Depth (m)]
from dbo.waterQualityData$

--Inserting into a database Query
--Inserts new data into a database
--When insering include all the columns and add values in row-like
select *
from waterQualityDataReduced$;

insert into dbo.waterQualityDataReduced$ ( Site_Id, Unit_Id, Read_Date, [Salinity (ppt)], [Dissolved Oxygen (mg/L)])
Values ('Miami', '','2018',5,5);

--where Query
--Filters records based on specified records
select *
from dbo.waterQualityDataReduced$
where Site_Id ='Miami';

--Update and set Query
--Updates existing data in a database
update dbo.waterQualityDataReduced$
set Site_Id ='Update', Unit_Id ='2'
where [Salinity (ppt)] =1.3;

select *
from dbo.waterQualityDataReduced$
where [Salinity (ppt)] = 1.3;

--Delete SQL Query
--Deletes data from a database
delete from dbo.waterQualityDataReduced$
where [Salinity (ppt)] = 1.3;

select *
from dbo.waterQualityDataReduced$
where [Salinity (ppt)] = 1.3;

--Create database Query
--Creates a new Database
create database test;

--Deop database Query
--Deletes a database
drop database test;

--Create table Query
--Creates a new table in a database
Create table userProfile (
	PersonID int,
	LastName varChar(255),
	FirstName varChar(255),
	Address varChar(255),
	City varChar(255)
);

insert into userProfile ( PersonID, LastName, FirstName, Address , city)
Values (1,'SQL','Database','123','Johannesburg')

select *
from userProfile;

--Alter SQL Query
--Modifies an existing table structure
--Adds column
alter table userProfile
add ward int;

select *
from userProfile;

--Drop column
alter table userProfile
drop column ward;

select *
from userProfile;

--Truncate table
--Removes all records from a table
Truncate table userProfile;

select *
from userProfile;

--Drop table
--Deletes a table from a database
drop table userProfile;

select *
from userProfile;