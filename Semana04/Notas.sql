
drop table demo..notas;
go

create table demo..notas(
	id char(6) not null,
	c_code char(2) not null,
	city varchar(20) not null,
	nota int not null,
	constraint pk_notas primary key(id,c_code),
	constraint ck_notas_nota check(nota>=0 and nota <=20)
);
go

insert into demo..notas
values('AD0036','C1','London',15);
go

insert into demo..notas
values('AD0078','C2','New York',16);
go

insert into demo..notas
values('CC0075','C2','New York',18);
go

insert into demo..notas
values('CC0097','C1','Florida',13);
go

insert into demo..notas
values('AD0036','C2','London',15);
go


insert into demo..notas
values('CC0075','C1','New York',14);
go



select * from demo..notas;
go
