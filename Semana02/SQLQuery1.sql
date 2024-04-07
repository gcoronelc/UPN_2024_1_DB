-- Crea la BD
create database demo;
go

-- Activa la BD
use demo;
go

-- Crear la tabla empleado
create table empleado(
	idemp int not null identity(1,1),
	nombre varchar(100) not null,
	edad int not null
);
go

-- Crea la PK de empleado
alter table empleado
add constraint pk_empleado
primary key(idemp);
go

-- Crea un check para la columna edad
alter table empleado
add constraint ck_empleado_edad
check(edad>=18);
go

-- Crea la tabla usuario
create table usuario(
	idemp int not null,
	usuario varchar(20) not null,
	clave varchar(20) not null,
	activo int not null
);
go

-- Crea la PK de la tabla usuario
alter table usuario
add constraint pk_usuario
primary key (idemp);
go

-- Crea la FK de la tabla usuario
alter table usuario
add constraint fk_usuario_empleado
foreign key (idemp)
references empleado;
go

-- Crea el UNIQUE de la columna usuario
alter table usuario
add constraint u_empleado_usuario
unique(usuario);
go

-- Crea el check de la columna activo
alter table usuario
add constraint ck_empleado_activo
check(activo in (0,1));
go


-- Datos de la tabla empleado
insert into empleado(nombre,edad)
values('Juan Perez',30);
go

insert into empleado(nombre,edad)
values('Jorge Garcia',18);
go

select * from empleado;
go

-- Datos de la tabla usuario
insert into usuario(idemp,usuario,clave,activo)
values(1,'jperez','secreto',1);
go

insert into usuario(idemp,usuario,clave,activo)
values(3,'jgarcia','nadielosabe',1);
go

select * from usuario;
go



select * from empleado;
select * from usuario;
go














