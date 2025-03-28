USE [master]
GO
/****** Object:  Database [DB_BANCO]    Script Date: 24/02/2025 10:07:08 p. m. ******/
CREATE DATABASE [DB_BANCO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_BANCO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_BANCO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_BANCO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_BANCO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_BANCO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BANCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BANCO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BANCO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BANCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BANCO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BANCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BANCO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BANCO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BANCO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BANCO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BANCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BANCO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BANCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BANCO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BANCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BANCO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BANCO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_BANCO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BANCO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BANCO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_BANCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_BANCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_BANCO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_BANCO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_BANCO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_BANCO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_BANCO]
GO
/****** Object:  Table [dbo].[tbl_cuentas]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cuentas](
	[CodigoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[NumeroCuenta] [nvarchar](50) NOT NULL,
	[TipoCuenta] [nvarchar](50) NULL,
	[Saldo] [decimal](10, 2) NULL,
	[FechaApertura] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_cuentas2]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_cuentas2]
	as
	(
		Select 
			CodigoCuenta,
			CodigoCliente,
			NumeroCuenta,
			TipoCuenta,
			Saldo
		from tbl_cuentas 
	);
GO
/****** Object:  Table [dbo].[tbl_clientes]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clientes](
	[CodigoCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Departamento] [nvarchar](100) NULL,
	[Pais] [nvarchar](100) NULL,
	[Categoria] [nvarchar](50) NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_cuentas3]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create view [dbo].[Vw_cuentas3]
	as
	(
		Select 
			c.CodigoCliente,
			clie.Nombre,
			c.NumeroCuenta,
			c.Saldo,
			clie.Direccion,
			clie.Departamento
		from tbl_cuentas c
				inner join tbl_clientes clie on c.CodigoCliente=clie.CodigoCliente
	);
GO
/****** Object:  View [dbo].[Vw_cuentas4]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_cuentas4]
	as
	(
		Select 
			c.CodigoCliente,
			clie.Nombre,
			c.NumeroCuenta,
			c.TipoCuenta,
			c.Saldo,
			clie.Direccion,
			clie.Departamento
		from tbl_cuentas c
				inner join tbl_clientes clie on c.CodigoCliente=clie.CodigoCliente
				where c.TipoCuenta='Ahorro' and c.Saldo >= 1000
	);
GO
/****** Object:  View [dbo].[Vw_clientes]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_clientes] 
	as
	(
		Select * 
		from tbl_clientes
	);
GO
/****** Object:  View [dbo].[Vw_clientes2]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_clientes2] 
	as
	(
		Select 
			CodigoCliente,
			Nombre,
			Direccion,
			Departamento, 
			Estado
		from tbl_clientes
	);
GO
/****** Object:  Table [dbo].[tbl_prestamos]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_prestamos](
	[CodigoPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[MotivoPrestamo] [nvarchar](255) NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[TasaInteres] [decimal](5, 2) NULL,
	[PlazoMeses] [int] NULL,
	[FechaPrestamo] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_clientes3]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_clientes3]
	as
	(
		Select 
			c.CodigoCliente,
			c.Nombre,
			c.Pais,
			c.Departamento,
			p.CodigoPrestamo,
			p.FechaPrestamo,
			p.Moneda,
			p.Monto,
			p.PlazoMeses,
			p.TasaInteres,
			p.Estado
		from tbl_clientes c
				inner join tbl_prestamos p on c.CodigoCliente=p.CodigoCliente
	);
GO
/****** Object:  View [dbo].[Vw_clientes4]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_clientes4]
	as
	(
		Select 
			c.CodigoCliente,
			c.Nombre,
			c.Pais,
			c.Departamento,
			p.CodigoPrestamo,
			p.FechaPrestamo,
			p.Moneda,
			p.Monto,
			p.PlazoMeses,
			p.TasaInteres,
			p.Estado
		from tbl_clientes c
				inner join tbl_prestamos p on c.CodigoCliente=p.CodigoCliente
		where c.Estado='Activo'
	);
GO
/****** Object:  View [dbo].[Vw_cuentas]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_cuentas]
	as
	(
		Select * 
		from tbl_cuentas
	);
GO
/****** Object:  Table [dbo].[tbl_pagos]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pagos](
	[CodigoPago] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPrestamo] [int] NULL,
	[CodigoTarjeta] [int] NULL,
	[CodigoCuenta] [int] NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[MonedaPago] [nvarchar](10) NOT NULL,
	[FechaPago] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_cuentas1]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Vw_cuentas1]
	as
	(
		Select 
			c.CodigoCuenta,
			c.CodigoCliente,
			c.NumeroCuenta,
			c.TipoCuenta,
			c.Saldo,
			c.Estado,
			p.CodigoPago,
			p.CodigoPrestamo,
			p.CodigoTarjeta,
			p.Monto
		from tbl_cuentas c
				inner join tbl_pagos p on c.CodigoCuenta=p.CodigoCuenta
		where c.Estado='Activo'
	);
GO
/****** Object:  Table [dbo].[tbl_movimientos]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_movimientos](
	[CodigoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCuenta] [int] NOT NULL,
	[TipoTransaccion] [nvarchar](50) NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[Estado] [nvarchar](15) NULL,
	[FechaTransaccion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tarjetas]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tarjetas](
	[CodigoTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[NumeroTarjeta] [nvarchar](50) NOT NULL,
	[TipoTarjeta] [nvarchar](50) NULL,
	[CategoriaTarjeta] [nvarchar](50) NULL,
	[FechaExpiracion] [datetime] NULL,
	[CVV] [nvarchar](4) NULL,
	[Monto] [decimal](10, 2) NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[CodigoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioSistema] [nvarchar](100) NOT NULL,
	[ClaveSistema] [nvarchar](255) NOT NULL,
	[Estado] [nvarchar](15) NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_clientes] ON 

INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (1, N'Sofia Torres', N'6a Avenida 5-60', N'Guatemala', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (2, N'Fernando Ruiz', N'7a Calle 6-70', N'Zacapa', N'Guatemala', N'Premium', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (3, N'Gloria Castillo', N'8a Avenida 7-80', N'Santa Rosa', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (4, N'Jorge Ramírez', N'9a Calle 8-90', N'Alta Verapaz', N'Guatemala', N'Premium', N'Inactivo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (5, N'Patricia Fernández', N'10a Avenida 9-100', N'Baja Verapaz', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (6, N'Juan Perez', N'1a Avenida 5-10', N'Guatemala', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (7, N'Maria Lopez', N'2a Calle 6-20', N'Quetzaltenango', N'Guatemala', N'Lista Negra', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (8, N'Carlos Gomez', N'3a Avenida 7-30', N'San Marcos', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (9, N'Ana Martinez', N'4a Calle 8-40', N'Escuintla', N'Guatemala', N'Premium', N'Inactivo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (10, N'Luis Morales', N'5a Avenida 9-50', NULL, N'Guatemala', N'Lista Negra', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (11, N'Diego Hernandez', N'11a Avenida 10-110', N'Guatemala', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (12, N'Isabel Martinez', N'12a Calle 11-120', N'Chiquimula', N'Guatemala', N'Premium', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (13, N'Ricardo Morales', N'13a Avenida 12-130', N'Izabal', N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (14, N'Laura Gomez', N'14a Calle 13-140', N'Petén', N'Guatemala', N'Premium', N'Inactivo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (15, N'Jose Lopez', N'15a Avenida 14-150', NULL, N'Guatemala', N'Regular', N'Activo')
INSERT [dbo].[tbl_clientes] ([CodigoCliente], [Nombre], [Direccion], [Departamento], [Pais], [Categoria], [Estado]) VALUES (27, N'Keila', N'Guate', N'Guate', N'Guate', N'Activo', N'Activo')
SET IDENTITY_INSERT [dbo].[tbl_clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_cuentas] ON 

INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (1, 1, N'GT123456789', N'Ahorro', CAST(1000.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (2, 2, N'GT987654321', N'Corriente', CAST(5000.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (3, 3, N'GT123123123', N'Ahorro', CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (4, 1, N'GT321321321', N'Corriente', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (5, 4, N'GT456456456', N'Ahorro', CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (6, 6, N'GT654321987', N'Ahorro', CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.697' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (7, 7, N'GT789654123', N'Corriente', CAST(4000.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (8, 8, N'GT321987654', N'Ahorro', CAST(1700.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (9, 6, N'GT147258369', N'Corriente', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (10, 9, N'GT963258741', N'Ahorro', CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (11, 1, N'GT111213141', N'Ahorro', CAST(950.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (12, 2, N'GT151617181', N'Corriente', CAST(5600.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (13, 13, N'GT192021222', N'Ahorro', CAST(1250.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (14, 11, N'GT232425262', N'Corriente', CAST(3100.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (15, 1, N'GT272829303', N'Ahorro', CAST(700.00 AS Decimal(10, 2)), CAST(N'2025-02-02T11:52:20.700' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (16, 2, N'GT123456888', N'Ahorro', CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-02-02T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_cuentas] ([CodigoCuenta], [CodigoCliente], [NumeroCuenta], [TipoCuenta], [Saldo], [FechaApertura], [Estado]) VALUES (17, 27, N'GT243565788', N'Ahorro', CAST(300000.00 AS Decimal(10, 2)), CAST(N'2025-02-22T00:00:00.000' AS DateTime), N'Activo')
SET IDENTITY_INSERT [dbo].[tbl_cuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pagos] ON 

INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (16, NULL, NULL, 2, CAST(1500.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T11:53:30.937' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (17, NULL, NULL, 4, CAST(800.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T11:53:30.940' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (18, NULL, NULL, 5, CAST(2000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T11:53:30.940' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (19, NULL, NULL, 6, CAST(600.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T11:53:30.940' AS DateTime), N'Pendiente')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (20, NULL, NULL, 8, CAST(3000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T11:53:30.940' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (21, 1, NULL, NULL, CAST(2000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.300' AS DateTime), N'Pagado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (22, 2, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.300' AS DateTime), N'Pagado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (23, 3, NULL, NULL, CAST(1500.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.303' AS DateTime), N'Pagado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (24, 4, NULL, NULL, CAST(500.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.303' AS DateTime), N'Pendiente')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (25, 5, NULL, NULL, CAST(3000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.303' AS DateTime), N'Proceso')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (31, NULL, NULL, 2, CAST(1500.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.307' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (32, NULL, NULL, 4, CAST(800.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.307' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (33, NULL, NULL, 5, CAST(2000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.307' AS DateTime), N'Completado')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (34, NULL, NULL, 6, CAST(600.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.307' AS DateTime), N'Pendiente')
INSERT [dbo].[tbl_pagos] ([CodigoPago], [CodigoPrestamo], [CodigoTarjeta], [CodigoCuenta], [Monto], [MonedaPago], [FechaPago], [Estado]) VALUES (35, NULL, NULL, 8, CAST(3000.00 AS Decimal(10, 2)), N'GTQ', CAST(N'2025-02-02T12:09:56.307' AS DateTime), N'Completado')
SET IDENTITY_INSERT [dbo].[tbl_pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_prestamos] ON 

INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (1, 1, N'Compra de vivienda', CAST(100000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.00 AS Decimal(5, 2)), 60, CAST(N'2020-01-30T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (2, 2, N'Educacion', CAST(20000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.00 AS Decimal(5, 2)), 24, CAST(N'2020-01-30T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (3, 3, N'Negocio propio', CAST(50000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.50 AS Decimal(5, 2)), 36, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (4, 4, N'Viaje', CAST(15000.00 AS Decimal(10, 2)), N'GTQ', CAST(7.00 AS Decimal(5, 2)), 12, CAST(N'2020-10-05T00:00:00.000' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (5, 5, N'Compra de vehiculo', CAST(30000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.50 AS Decimal(5, 2)), 48, CAST(N'2022-03-24T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (6, 6, N'Compra de vivienda', CAST(120000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.25 AS Decimal(5, 2)), 60, CAST(N'2023-04-07T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (7, 7, N'Educacion', CAST(25000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.50 AS Decimal(5, 2)), 24, CAST(N'2020-01-08T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (8, 8, N'Negocio propio', CAST(60000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.75 AS Decimal(5, 2)), 36, CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (9, 9, N'Negocio propio', CAST(20000.00 AS Decimal(10, 2)), N'GTQ', CAST(7.25 AS Decimal(5, 2)), 12, CAST(N'2021-04-18T00:00:00.000' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (10, 10, N'Negocio propio', CAST(35000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.75 AS Decimal(5, 2)), 48, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (11, 11, N'Viaje', CAST(95000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.80 AS Decimal(5, 2)), 60, CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (12, 12, N'Viaje', CAST(18000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.20 AS Decimal(5, 2)), 12, CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (13, 3, N'Compra de vivienda', CAST(70000.00 AS Decimal(10, 2)), N'GTQ', CAST(5.50 AS Decimal(5, 2)), 36, CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'Activo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (14, 3, N'Educacion', CAST(25000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.80 AS Decimal(5, 2)), 24, CAST(N'2021-05-15T00:00:00.000' AS DateTime), N'Inactivo')
INSERT [dbo].[tbl_prestamos] ([CodigoPrestamo], [CodigoCliente], [MotivoPrestamo], [Monto], [Moneda], [TasaInteres], [PlazoMeses], [FechaPrestamo], [Estado]) VALUES (15, 5, N'Compra de vehiculo', CAST(40000.00 AS Decimal(10, 2)), N'GTQ', CAST(6.00 AS Decimal(5, 2)), 48, CAST(N'2024-04-04T00:00:00.000' AS DateTime), N'Activo')
SET IDENTITY_INSERT [dbo].[tbl_prestamos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_tarjetas] ON 

INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (16, 1, N'1234 5678 9012 3456', N'Credito', N'Standard', CAST(N'2025-12-31T00:00:00.000' AS DateTime), N'123', CAST(5000.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (17, 2, N'2345 6789 0123 4567', N'Debito', N'Platinum', CAST(N'2024-11-30T00:00:00.000' AS DateTime), N'456', CAST(3000.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (18, 3, N'3456 7890 1234 5678', N'Credito', N'Standard', CAST(N'2026-10-31T00:00:00.000' AS DateTime), N'789', CAST(7000.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (19, 4, N'4567 8901 2345 6789', N'Credito', N'Black', CAST(N'2023-05-31T00:00:00.000' AS DateTime), N'321', CAST(2000.00 AS Decimal(10, 2)), N'GTQ', N'Inactivo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (20, 5, N'5678 9012 3456 7890', N'Debito', N'Oro', CAST(N'2025-03-31T00:00:00.000' AS DateTime), N'654', CAST(1500.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (21, 6, N'6789 0123 4567 8901', N'Credito', N'Standard', CAST(N'2026-06-30T00:00:00.000' AS DateTime), N'234', CAST(6000.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (22, 7, N'7890 1234 5678 9012', N'Debito', N'Platinum', CAST(N'2024-07-31T00:00:00.000' AS DateTime), N'567', CAST(3500.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (23, 1, N'8901 2345 6789 0123', N'Credito', N'Oro', CAST(N'2025-08-31T00:00:00.000' AS DateTime), N'890', CAST(7500.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (24, 9, N'9012 3456 7890 1234', N'Credito', N'Oro', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'123', CAST(2500.00 AS Decimal(10, 2)), N'GTQ', N'Inactivo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (25, 1, N'0123 4567 8901 2345', N'Debito', N'Premium', CAST(N'2026-10-31T00:00:00.000' AS DateTime), N'456', CAST(1800.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (26, 1, N'1234 5678 9012 3456', N'Credito', N'Standard', CAST(N'2025-02-28T00:00:00.000' AS DateTime), N'234', CAST(4500.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (27, 2, N'2345 6789 0123 4567', N'Debito', N'Platinum', CAST(N'2024-03-31T00:00:00.000' AS DateTime), N'567', CAST(3200.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (29, 4, N'4567 8901 2345 6789', N'Credito', N'Standard', CAST(N'2023-05-31T00:00:00.000' AS DateTime), N'321', CAST(1500.00 AS Decimal(10, 2)), N'GTQ', N'Inactivo')
INSERT [dbo].[tbl_tarjetas] ([CodigoTarjeta], [CodigoCliente], [NumeroTarjeta], [TipoTarjeta], [CategoriaTarjeta], [FechaExpiracion], [CVV], [Monto], [Moneda], [Estado]) VALUES (30, 15, N'5678 9012 3456 7890', N'Debito', N'Platinum', CAST(N'2026-06-30T00:00:00.000' AS DateTime), N'654', CAST(2100.00 AS Decimal(10, 2)), N'GTQ', N'Activo')
SET IDENTITY_INSERT [dbo].[tbl_tarjetas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_usuarios] ON 

INSERT [dbo].[tbl_usuarios] ([CodigoUsuario], [UsuarioSistema], [ClaveSistema], [Estado], [FechaCreacion], [FechaModificacion]) VALUES (1, N'admin', N'root', N'Activo', CAST(N'2025-02-02T11:52:01.850' AS DateTime), CAST(N'2025-02-02T11:52:01.850' AS DateTime))
INSERT [dbo].[tbl_usuarios] ([CodigoUsuario], [UsuarioSistema], [ClaveSistema], [Estado], [FechaCreacion], [FechaModificacion]) VALUES (2, N'jalvarez', N'alvarez123', N'Activo', CAST(N'2025-02-02T11:52:01.850' AS DateTime), CAST(N'2025-02-02T11:52:01.850' AS DateTime))
INSERT [dbo].[tbl_usuarios] ([CodigoUsuario], [UsuarioSistema], [ClaveSistema], [Estado], [FechaCreacion], [FechaModificacion]) VALUES (3, N'jroman', N'123', N'Activo', CAST(N'2025-02-02T11:52:01.850' AS DateTime), CAST(N'2025-02-02T11:52:01.850' AS DateTime))
INSERT [dbo].[tbl_usuarios] ([CodigoUsuario], [UsuarioSistema], [ClaveSistema], [Estado], [FechaCreacion], [FechaModificacion]) VALUES (4, N'aaldana', N'aldana2024', N'Inactivo', CAST(N'2025-02-02T11:52:01.853' AS DateTime), CAST(N'2025-02-02T11:52:01.853' AS DateTime))
INSERT [dbo].[tbl_usuarios] ([CodigoUsuario], [UsuarioSistema], [ClaveSistema], [Estado], [FechaCreacion], [FechaModificacion]) VALUES (5, N'pdonis', N'hacker123', N'Activo', CAST(N'2025-02-02T11:52:01.853' AS DateTime), CAST(N'2025-02-02T11:52:01.853' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_usuarios] OFF
GO
ALTER TABLE [dbo].[tbl_cuentas] ADD  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[tbl_tarjetas] ADD  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[tbl_cuentas]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[tbl_movimientos]  WITH CHECK ADD FOREIGN KEY([CodigoCuenta])
REFERENCES [dbo].[tbl_cuentas] ([CodigoCuenta])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoPrestamo])
REFERENCES [dbo].[tbl_prestamos] ([CodigoPrestamo])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoTarjeta])
REFERENCES [dbo].[tbl_tarjetas] ([CodigoTarjeta])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoCuenta])
REFERENCES [dbo].[tbl_cuentas] ([CodigoCuenta])
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[tbl_tarjetas]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_crear]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_clientes_crear]
	-- Add the parameters for the stored procedure here
	@Nombre varchar (100),
	@Direccion varchar (255), 
	@Departamento varchar (200),
	@Pais varchar (100),
	@Categoria varchar (50),
	@Estado varchar (15)
	
AS
BEGIN
	SET NOCOUNT ON;

	Insert into tbl_clientes
	(
	Nombre,
	Direccion,
	Departamento,
	Pais,
	Categoria,
	Estado
	) values
	(
	@Nombre,
	@Direccion,
	@Departamento,
	@Pais,
	@Categoria,
	@Estado
	)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_editar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_clientes_editar]
	-- Add the parameters for the stored procedure here
	@Codigo int,
	@Nombre varchar (100),
	@Direccion varchar (255), 
	@Departamento varchar (200),
	@Pais varchar (100),
	@Categoria varchar (50),
	@Estado varchar (15)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_clientes
	Set
	Nombre = @Nombre,
	Direccion = @Direccion,
	Departamento = @Departamento,
	Pais = @Pais,
	Categoria = @Categoria,
	Estado = @Estado
	Where CodigoCliente = @Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_editar2]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Keila
-- Create date: Prueba editar 2
-- Description:	22-02-2025
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_editar2]
    @Codigo int,
	@Nombre varchar (100),
	@Direccion varchar (255), 
	@Departamento varchar (200),
	@Pais varchar (100),
	@Categoria varchar (50),
	@Estado varchar (15)
AS
BEGIN
    UPDATE tbl_clientes
    SET 
        Nombre = @Nombre,
        Direccion = @Direccion,
        Departamento = @Departamento,
        Pais = @Pais,
        Categoria = @Categoria,
        Estado = @Estado
    WHERE CodigoCliente = @Codigo;

    -- Devolver el número de registros afectados
    SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_eliminar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keila Juarez
-- Create date: 16-02-2025
-- Description:	stored procedure eliminar
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_eliminar]
	(
	@Codigo int
	)
AS
BEGIN
	SET NOCOUNT ON;
	Delete tbl_clientes
	where CodigoCliente = @Codigo
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_eliminar2]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keila
-- Create date: Eliminar 2
-- Description:	22-02-2025
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_eliminar2]
	(
	@Codigo int
	)
AS
BEGIN
	SET NOCOUNT ON;
	Delete tbl_clientes
	where CodigoCliente = @Codigo;

	 -- Devolver el número de registros afectados
    SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_mostrar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Keila Juarez
-- Create date: 2025 -02-09
-- Description:	store procedure para mostrar los clientes de la tabla tbl_clientes
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_mostrar]  --prfijo _nombre _tabla accion
AS
BEGIN
	SET NOCOUNT ON;

Select 
	CodigoCliente as 'CodigoCliente',
	Nombre,
	Direccion,
	Departamento,
	Pais,
	Categoria,
	Estado
from tbl_clientes;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_agregar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_cuentas_agregar]
	
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
/****** Object:  StoredProcedure [dbo].[usp_cuentas_editar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Keila
-- Create date: 22-02-2025
-- Description:	Stored procedure editar
-- =============================================
CREATE PROCEDURE [dbo].[usp_cuentas_editar]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_eliminar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_cuentas_eliminar]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_mostrar]    Script Date: 24/02/2025 10:07:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Keila
-- Create date: 22'02'2025
-- Description:	Stored procedure mostrar cuentas
-- =============================================
CREATE PROCEDURE [dbo].[usp_cuentas_mostrar]  
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
GO
USE [master]
GO
ALTER DATABASE [DB_BANCO] SET  READ_WRITE 
GO
