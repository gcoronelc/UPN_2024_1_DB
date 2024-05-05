use master 
go 

create database perudev; 
go


alter database perudev set recovery FULL 
go 

select databasepropertyex( 'perudev','Recovery' ) 
go


exec sp_addumpdevice 'disk', 'PD', 'D:\Backup\PDDevice.bak' 
go


select * from master.dbo.sysdevices 
go


create table perudev..test( 
id Int Identity Primary Key, 
dato varchar(30) 
) 
go


declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('Backup de Base de Datos') 
	commit tran 
	set @k = @k + 1 
end;
go


select * from perudev..test;
go



backup database perudev 
to pd 
with 
	format, 
	name = 'BakBD', 
	description = 'Backup completo de la base de datos'; 
go

restore headeronly from pd 
go


declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) values('SQL Server 2000') 
	commit tran 
	set @k = @k + 1 
end 
go


backup database perudev 
to pd 
with 
	differential, 
	name = 'BakDif01', 
	description = 'Primer backup diferencial dela base de datos' 
go


restore headeronly from pd 
go


-- PRACTICA DIRIGIDA - RESTAURACION DE LA BASE DE DATOs
-- ==============================================================

drop database perudev;
go

restore headeronly from pd;
go

RESTORE DATABASE perudev FROM PD WITH FILE=1, RECOVERY;
GO

select * from perudev..test;
go


-- PRACTICA DIRIGIDA - RESTAURACION HASTA EL DIFERENCIAL
-- ==============================================================

drop database perudev;
go

restore headeronly from pd;
go

RESTORE DATABASE perudev FROM PD WITH FILE=1, NORECOVERY;
GO

RESTORE DATABASE perudev FROM PD WITH FILE=2, RECOVERY;
GO

select * from perudev..test;
go