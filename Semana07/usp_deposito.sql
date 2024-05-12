alter procedure usp_deposito
(
	@cuenta char(8),
	@importe money,
	@empleado char(4),
	@estado int out,
	@mensaje varchar(1000) out
)
as
DECLARE @contador int;
begin
	BEGIN TRY 
		BEGIN TRANSACTION;
		-- Verificar si cuenta existe
		SELECT @contador = count(1) 
		FROM CUENTA WHERE chr_cuencodigo = @cuenta;
		IF( @contador <> 1 )
		BEGIN
			set @estado = -1;
			set @mensaje = 'Cuenta no existe.';
		END;
		-- Actualizar cuenta
		UPDATE cuenta
		SET dec_cuensaldo = dec_cuensaldo + @importe,
		int_cuencontmov = int_cuencontmov + 1
		WHERE chr_cuencodigo = @cuenta;
		IF( @@ROWCOUNT <> 1 )
		BEGIN
			set @estado = -1;
			set @mensaje = 'Error en el proceso.';
		END;
		-- Leer el valor del contador
		SELECT @contador = int_cuencontmov
		FROM Cuenta WHERE chr_cuencodigo = @cuenta;
		IF( @@ROWCOUNT <> 1 )
		BEGIN
			set @estado = -1;
			set @mensaje = 'Error en el proceso.';
		END;
		--Registrar moviminto
		INSERT INTO Movimiento(chr_cuencodigo, int_movinumero,dtt_movifecha,
		chr_emplcodigo,chr_tipocodigo,dec_moviimporte)
		VALUES(@cuenta,@contador,GETDATE(),@empleado,'003',@importe);
		-- Confirmar Tx
		COMMIT TRANSACTION; 
		set @estado = 1;
		set @mensaje = 'Proceso ejecutado correctamente';
	END TRY 
	BEGIN CATCH 
		ROLLBACK TRANSACTION;
	END CATCH;
end;
go

select * from Cuenta where chr_cuencodigo = '00100001';
select * from Movimiento where chr_cuencodigo = '00100001';
go

declare @estado int, @mensaje varchar(1000)
exec usp_deposito '00100001',5000,'0005', @estado out, @mensaje out
print concat('Estado: ',@estado)
print concat('Mensaje: ',@mensaje)
go

select * from TipoMovimiento;
go

