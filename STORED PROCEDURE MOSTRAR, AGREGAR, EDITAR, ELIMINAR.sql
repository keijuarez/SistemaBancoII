--Tabla Cuentas

--Stored procedure mostrar

EXEC sp_helptext 'usp_clientes_mostrar';
Select * from tbl_cuentas
exec usp_cuentas_mostrar ;

CREATE PROCEDURE usp_cuentas_mostrar  
AS  
BEGIN  
 SET NOCOUNT ON;  
Select   
 CodigoCuenta,  
 CodigoCliente,  
 NumeroCuenta,  
 TipoCuenta,  
 Saldo,  
FechaApertura,  
 Estado  
from tbl_cuentas;  
END  

--Stored procedure agregar

-- =============================================
-- Author:		Keila
-- Create date: 22-02-2025
-- Description:	Stored procedure agregar
-- =============================================
CREATE PROCEDURE usp_cuentas_agregar
	
	@CodigoCliente int,
	@NumeroCuenta varchar (50), 
	@TipoCuenta varchar (50),
	@Saldo decimal (10,2),
	@FechaApertura datetime,
	@Estado varchar (15)
	
AS
BEGIN
	SET NOCOUNT ON;

	Insert into tbl_cuentas
	(
	CodigoCliente,
	NumeroCuenta,
	TipoCuenta,
	Saldo,
	FechaApertura,
	Estado
	) values
	(
	@CodigoCliente,
	@NumeroCuenta, 
	@TipoCuenta,
	@Saldo,
	@FechaApertura,
	@Estado
	)
END
GO

exec dbo.usp_cuentas_agregar 2,'GT123456888','Ahorro',100000,'2025-02-02','Activo';

select * from tbl_cuentas

--Stored procedure editar

-- =============================================
-- Author:		Keila
-- Create date: 22-02-2025
-- Description:	Stored procedure editar
-- =============================================
CREATE PROCEDURE usp_cuentas_editar
    @CodigoCuenta int,
	@CodigoCliente int,
	@NumeroCuenta varchar (50), 
	@TipoCuenta varchar (50),
	@Saldo decimal (10,2),
	@FechaApertura datetime,
	@Estado varchar (15)
AS
BEGIN
    UPDATE tbl_cuentas
    SET 
        CodigoCliente = @CodigoCuenta,
        NumeroCuenta = @NumeroCuenta,
        TipoCuenta = @TipoCuenta,
		Saldo = @Saldo,
        FechaApertura = @FechaApertura,
		Estado = @Estado
    WHERE CodigoCuenta = @CodigoCuenta;

    SELECT @@ROWCOUNT;
END

exec dbo.usp_cuentas_editar 16, 2,'GT999999999','Ahorro',1000,'2025-02-02','Activo';

select * from tbl_cuentas
select * from tbl_clientes

--Stored procedure eliminar

-- =============================================
-- Author:		Keila
-- Create date: 22-02-2025
-- Description:	Stored Procedure eliminar de la tabla cuentas
-- =============================================
CREATE PROCEDURE usp_cuentas_eliminar
	(
	@CodigoCuenta int
	)
AS
BEGIN
	SET NOCOUNT ON;
	Delete tbl_cuentas
	where CodigoCuenta = @CodigoCuenta;
    SELECT @@ROWCOUNT;
END