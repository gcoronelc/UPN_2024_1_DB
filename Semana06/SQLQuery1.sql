drop database educa2;
go

select * from EDUCA2..PAGO;
go

select @@TRANCOUNT;
go

begin tran;
go

select @@TRANCOUNT;
go

delete from EDUCA2..PAGO;
go


select * from EDUCA2..PAGO;
go


rollback tran;
go
