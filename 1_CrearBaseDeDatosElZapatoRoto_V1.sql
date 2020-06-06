/*
NOTES: La estrutura se ha procurado hacer lo mas simple posible. 
Se usa llaves primarias y llaves externas que luego seran usadas para preparar consultas.
MVT 6/6/20
*/
PRINT N'Diseña una Base de datos que permita solucionar el siguiente problema:
--Necesitamos registrar la facturación de los productos de la zapatería "El zapato roto". 
--Necesitamos poder registrar productos, clientes, facturas e inventario.';
GO


CREATE DATABASE [ElZapatoRoto]
go

USE  [ElZapatoRoto]
go



PRINT N'Creating [dbo].[Clientes]...';


GO
CREATE TABLE [dbo].[Clientes] (
    [ClienteID]                INT        IDENTITY (1, 1) NOT NULL,
    [Nombre]                   NCHAR (50) NOT NULL,
    [PaisID]                   INT        NOT NULL,
    [FechaDeCreacion]          DATETIME   NOT NULL,
    [UltimaFechaDeModificacion] DATETIME   NOT NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([ClienteID] ASC)
);


GO
PRINT N'Creating [dbo].[DetalleDeFacturas]...';


GO
CREATE TABLE [dbo].[DetalleDeFacturas] (
    [DetalleDeFacturacionID]   INT      IDENTITY (1, 1) NOT NULL,
    [FacturaID]                INT      NOT NULL,
    [ProductoID]               INT      NOT NULL,
	[Cantidad]				   smallint not null,
    [FechaDeCreacion]          DATETIME NOT NULL,
    [UltimaFechaDeModificacion] DATETIME NOT NULL,
    CONSTRAINT [PK_DetalleDeFacturacion] PRIMARY KEY CLUSTERED ([DetalleDeFacturacionID] ASC)
);


GO
PRINT N'Creating [dbo].[Facturas]...';


GO
CREATE TABLE [dbo].[Facturas] (
    [FacturaID]                INT      IDENTITY (1, 1) NOT NULL,
    [ClienteID]                INT      NOT NULL,
    [Impuestos]                MONEY    NOT NULL,
    [Descuentos]               MONEY    NOT NULL,
    [ValorAPagar]              MONEY    NOT NULL,
    [FechaDeFacturacion]       DATETIME NOT NULL,
    [FechaDeCreacion]          DATETIME NOT NULL,
    [UltimaFechaDeModificacion] DATETIME NOT NULL,
    CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED ([FacturaID] ASC)
);


GO
PRINT N'Creating [dbo].[Inventario]...';


GO
CREATE TABLE [dbo].[Inventario] (
    [InventarioID]      INT      IDENTITY (1, 1) NOT NULL,
    [ProductoID]        INT      NOT NULL,
    [TipoDeMovimiento]  INT      NOT NULL,
    [FechaDeMovimiento] DATETIME NOT NULL,
    [Cantidad]          INT      NOT NULL,
    CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED ([InventarioID] ASC)
);


GO
PRINT N'Creating [dbo].[Paises]...';


GO
CREATE TABLE [dbo].[Paises] (
    [PaisID]                   INT        IDENTITY (1, 1) NOT NULL,
    [Code]                     CHAR (3)   NOT NULL,
    [Nombre]                   NCHAR (50) NOT NULL,
    [FechaDeCreacion]          DATETIME   NOT NULL,
    [UltimaFechaDeModificacion] DATETIME   NOT NULL,
    CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED ([PaisID] ASC)
);


GO
PRINT N'Creating [dbo].[Presentaciones]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[Presentaciones] (
    [PresentacionID]           INT           IDENTITY (1, 1) NOT NULL,
    [Description]              NVARCHAR (30) NOT NULL,
    [Color]                    NCHAR (20)    NOT NULL,
    [Material]                 NCHAR (30)    NOT NULL,
    [Talla]                    INT           NOT NULL,
    [FechaDeCreacion]          DATETIME      NOT NULL,
    [UltimaFechaDeModificacion] DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([PresentacionID] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating [dbo].[Productos]...';


GO
CREATE TABLE [dbo].[Productos] (
    [ProductoID]               INT        IDENTITY (1, 1) NOT NULL,
    [Nombre]                   NCHAR (50) NOT NULL,
    [PresentacionID]           INT        NOT NULL,
    [Valor]                    MONEY      NOT NULL,
    [FechaDeCreacion]          DATETIME   NOT NULL,
    [UltimaFechaDeModificacion] DATETIME   NOT NULL,
    CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED ([ProductoID] ASC)
);


GO
PRINT N'Creating [dbo].[TipoDeMovimiento]...';


GO
CREATE TABLE [dbo].[TipoDeMovimiento] (
    [TipoDeMovimientoID] INT        NOT NULL,
    [Description]        NCHAR (20) NOT NULL,
    CONSTRAINT [PK_TipoDeMovimiento] PRIMARY KEY CLUSTERED ([TipoDeMovimientoID] ASC)
);


GO
PRINT N'Creating [dbo].[DF_DetalleDeFacturacion_FechaDeCreacion]...';


GO
ALTER TABLE [dbo].[DetalleDeFacturas]
    ADD CONSTRAINT [DF_DetalleDeFacturacion_FechaDeCreacion] DEFAULT (getdate()) FOR [FechaDeCreacion];


GO
PRINT N'Creating [dbo].[DF_DetalleDeFacturacion_UltimaFechaDeModificacion]...';


GO
ALTER TABLE [dbo].[DetalleDeFacturas]
    ADD CONSTRAINT [DF_DetalleDeFacturacion_UltimaFechaDeModificacion] DEFAULT (getdate()) FOR [UltimaFechaDeModificacion];


GO
PRINT N'Creating [dbo].[DF_Facturacion_Descuentos]...';


GO
ALTER TABLE [dbo].[Facturas]
    ADD CONSTRAINT [DF_Facturacion_Descuentos] DEFAULT ((0)) FOR [Descuentos];


GO
PRINT N'Creating [dbo].[DF_Facturacion_FechaDeCreacion]...';


GO
ALTER TABLE [dbo].[Facturas]
    ADD CONSTRAINT [DF_Facturacion_FechaDeCreacion] DEFAULT (getdate()) FOR [FechaDeCreacion];


GO
PRINT N'Creating [dbo].[DF_Facturacion_UltimaFechaDeModificacion]...';


GO
ALTER TABLE [dbo].[Facturas]
    ADD CONSTRAINT [DF_Facturacion_UltimaFechaDeModificacion] DEFAULT (getdate()) FOR [UltimaFechaDeModificacion];


GO
PRINT N'Creating [dbo].[DF_Table_1_Fecha]...';


GO
ALTER TABLE [dbo].[Inventario]
    ADD CONSTRAINT [DF_Table_1_Fecha] DEFAULT (getdate()) FOR [FechaDeMovimiento];


GO
PRINT N'Creating [dbo].[DF_Pais_FechaDeCreacion]...';


GO
ALTER TABLE [dbo].[Paises]
    ADD CONSTRAINT [DF_Pais_FechaDeCreacion] DEFAULT (getdate()) FOR [FechaDeCreacion];


GO
PRINT N'Creating [dbo].[DF_Pais_UltimaFechaDeModificacion]...';


GO
ALTER TABLE [dbo].[Paises]
    ADD CONSTRAINT [DF_Pais_UltimaFechaDeModificacion] DEFAULT (getdate()) FOR [UltimaFechaDeModificacion];


GO
PRINT N'Creating unnamed constraint on [dbo].[Presentaciones]...';


GO
ALTER TABLE [dbo].[Presentaciones]
    ADD DEFAULT getDate() FOR [FechaDeCreacion];


GO
PRINT N'Creating unnamed constraint on [dbo].[Presentaciones]...';


GO
ALTER TABLE [dbo].[Presentaciones]
    ADD DEFAULT getDate() FOR [UltimaFechaDeModificacion];


GO
PRINT N'Creating [dbo].[DF_Productos_FechaDeCreacion]...';


GO
ALTER TABLE [dbo].[Productos]
    ADD CONSTRAINT [DF_Productos_FechaDeCreacion] DEFAULT (getdate()) FOR [FechaDeCreacion];


GO
PRINT N'Creating [dbo].[DF_Productos_UltimaFechaDeModificacion]...';


GO
ALTER TABLE [dbo].[Productos]
    ADD CONSTRAINT [DF_Productos_UltimaFechaDeModificacion] DEFAULT (getdate()) FOR [UltimaFechaDeModificacion];


GO
PRINT N'Creating [dbo].[FK_Clientes_A_Paises]...';


GO
ALTER TABLE [dbo].[Clientes] WITH NOCHECK
    ADD CONSTRAINT [FK_Clientes_A_Paises] FOREIGN KEY ([PaisID]) REFERENCES [dbo].[Paises] ([PaisID]);


GO
PRINT N'Creating [dbo].[FK_DetalleDeFacturas_A_Facturas]...';


GO
ALTER TABLE [dbo].[DetalleDeFacturas] WITH NOCHECK
    ADD CONSTRAINT [FK_DetalleDeFacturas_A_Facturas] FOREIGN KEY ([FacturaID]) REFERENCES [dbo].[Facturas] ([FacturaID]);


GO
PRINT N'Creating [dbo].[FK_Facturas_A_Clientes]...';


GO
ALTER TABLE [dbo].[Facturas] WITH NOCHECK
    ADD CONSTRAINT [FK_Facturas_A_Clientes] FOREIGN KEY ([ClienteID]) REFERENCES [dbo].[Clientes] ([ClienteID]);


GO
PRINT N'Creating [dbo].[FK_Inventario_A_TipoDeMovimiento]...';


GO
ALTER TABLE [dbo].[Inventario] WITH NOCHECK
    ADD CONSTRAINT [FK_Inventario_A_TipoDeMovimiento] FOREIGN KEY ([TipoDeMovimiento]) REFERENCES [dbo].[TipoDeMovimiento] ([TipoDeMovimientoID]);


GO
