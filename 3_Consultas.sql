

/*
Lista de consultas requeridas.
1) Consulta la facturación de un cliente en específico.
2) Consulta la facturación de un producto en específico.
3)Consulta la facturación de un rango de fechas.
4) De la facturación, consulta los clientes únicos (es decir, se requiere el listado de los clientes que han comprado por lo menos una vez, pero en el listado no se deben repetir los clientes)
5) Cubo de información (opcional): Si tienes experiencia en cubos de información, diseña un cubo con la base de datos anterior donde se tenga toda la información de facturación.
*/

USE ElZapatoRoto
go

SELECT  '1 Consulta de Facturacion'='Cliente especifico', FAC.FacturaID,
        FAC.ClienteID ,CLT.Nombre, PAI.Nombre,FAC.Impuestos ,FAC.Descuentos ,FAC.ValorAPagar ,FAC.FechaDeFacturacion ,        
		DDF.DetalleDeFacturacionID ,DDF.ProductoID ,DDF.Cantidad ,	 
		'Nombre de producto'=PRD.Nombre ,PRD.Valor , PRE.Description, PRE.Material, PRE.Color	
FROM dbo.Facturas FAC 
	INNER JOIN dbo.DetalleDeFacturas DDF ON FAC.FacturaID = DDF.FacturaID
	INNER JOIN dbo.Clientes CLT ON FAC.ClienteID = CLT.ClienteID
	INNER JOIN dbo.Paises PAI ON CLT.PaisID=PAI.PaisID
	INNER JOIN dbo.Productos PRD ON DDF.ProductoID=PRD.ProductoID
	INNER JOIN dbo.Presentaciones PRE ON PRD.PresentacionID=PRE.PresentacionID
WHERE CLT.Nombre IN ( 'Natalia Paris', 'Michel Jordan')

SELECT  '2 Consulta de Facturacion'='Producto especifico',  FAC.FacturaID,
        FAC.ClienteID ,CLT.Nombre, PAI.Nombre,FAC.Impuestos ,FAC.Descuentos ,FAC.ValorAPagar ,FAC.FechaDeFacturacion ,        
		DDF.DetalleDeFacturacionID ,DDF.ProductoID ,DDF.Cantidad ,	 
		'Nombre de producto'=PRD.Nombre ,PRD.PresentacionID ,PRD.Valor 	
FROM dbo.Facturas FAC 
	INNER JOIN dbo.DetalleDeFacturas DDF ON FAC.FacturaID = DDF.FacturaID
	INNER JOIN dbo.Clientes CLT ON FAC.ClienteID = CLT.ClienteID
	INNER JOIN dbo.Paises PAI ON CLT.PaisID=PAI.PaisID
	INNER JOIN dbo.Productos PRD ON DDF.ProductoID=PRD.ProductoID
WHERE PRD.Nombre like 'Versage%' OR PRD.Nombre LIKE 'Adidas%'


SELECT '3 Consulta de Facturacion'='Rango de fechas',  FAC.FacturaID,
        FAC.ClienteID ,CLT.Nombre, PAI.Nombre,FAC.Impuestos ,FAC.Descuentos ,FAC.ValorAPagar ,FAC.FechaDeFacturacion ,        
		DDF.DetalleDeFacturacionID ,DDF.ProductoID ,DDF.Cantidad ,	 
		'Nombre de producto'=PRD.Nombre ,PRD.PresentacionID ,PRD.Valor 	
FROM dbo.Facturas FAC 
	INNER JOIN dbo.DetalleDeFacturas DDF ON FAC.FacturaID = DDF.FacturaID
	INNER JOIN dbo.Clientes CLT ON FAC.ClienteID = CLT.ClienteID
	INNER JOIN dbo.Paises PAI ON CLT.PaisID=PAI.PaisID
	INNER JOIN dbo.Productos PRD ON DDF.ProductoID=PRD.ProductoID
WHERE FAC.FechaDeFacturacion BETWEEN '2018-07-11' AND '2018-09-01'

SELECT DISTINCT '4 Consulta de Facturacion'='Listado de clientes unicos',  
        FAC.ClienteID ,CLT.Nombre, 'Nombre Pais' = PAI.Nombre
FROM dbo.Facturas FAC 
	INNER JOIN dbo.Clientes CLT ON FAC.ClienteID = CLT.ClienteID
	INNER JOIN dbo.Paises PAI ON CLT.PaisID = PAI.PaisID

SELECT  '4.a Consulta de Facturacion'='Listado de clientes que nunca han sido facturados',  
        CLT.ClienteID ,CLT.Nombre, 'Nombre Pais'= PAI.Nombre
FROM dbo.Clientes CLT 
	INNER JOIN dbo.Paises PAI ON CLT.PaisID = PAI.PaisID
	LEFT JOIN Facturas FAC ON  CLT.ClienteID = FAC.ClienteID 
WHERE FAC.ValorAPagar IS NULL

