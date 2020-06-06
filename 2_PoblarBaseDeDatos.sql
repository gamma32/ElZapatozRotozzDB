/*--Diseña una Base de datos que permita solucionar el siguiente problema:

--Necesitamos registrar la facturación de los productos de la zapatería "El zapato roto". 
--Necesitamos poder registrar productos, clientes, facturas e inventario.

--Los productos tendrán como mínimo: Nombre, presentación, valor.
--Los clientes tendrán como mínimo: Identificación, nombre, país.
--El inventario tendrá como mínimo: producto, tipo de movimiento (entrada o salida), fecha, cantidad.
--La facturación debe tener como mínimo: la información del cliente, los productos comprados, impuestos, descuentos, valor a pagar.
--Esta base de datos debe estar en 3ra forma normal.
*/
use ElZapatoRoto
go

/*
Por razones de control de identidades se ha asignado identidades a cada entrada.
*/
set IDENTITY_insert  Paises on
 insert into Paises (PaisID,Code,Nombre, FechaDeCreacion, UltimaFechaDeModificacion)
select *, getdate(), getdate() from (
select 'ID'=1, 'Code'='ARG', 'Nombre'='Argentina' union
select 2, 'BRA', 'Brasil' union
select 3, 'CHI','Chile' union
select 4, 'COL','Colombia' union
select 5, 'ECU','Ecuador' union
select 6, 'MEX','Mexico' union
select 7, 'PER', 'Peru' union
select 8, 'URU', 'Uruguay' union
select 9, 'USA', 'Estados Unidos'
) as Lista
Set IDENTITY_insert Paises off



set identity_insert clientes on
insert into Clientes (ClienteID, Nombre,PaisID,FechaDeCreacion, UltimaFechaDeModificacion )
select *, getdate(), getdate() from (
select 'ID'=1, 'Nombre'='Palito Ortega', 'PaisID'=1  union
select 'ID'=2, 'Nombre'='Armando Maradona', 'PaisID'=1  union
select 'ID'=3, 'Nombre'='Libertad Lamarque', 'PaisID'=1  union
select 'ID'=4, 'Nombre'='Alesandra Lima', 'PaisID'=2  union
select 'ID'=5, 'Nombre'='Ronaldo Nazario', 'PaisID'=2  union
select 'ID'=6, 'Nombre'='Sorcrates', 'PaisID'=2  union
select 'ID'=7, 'Nombre'='Sonia Braga', 'PaisID'=2  union
select 'ID'=8, 'Nombre'='Edson Arantes', 'PaisID'=2  union
select 'ID'=9, 'Nombre'='Mirian Hernandez', 'PaisID'=3  union
select 'ID'=10, 'Nombre'='Humbert Suazo', 'PaisID'=3  union
select 'ID'=11, 'Nombre'='Isabel Allende', 'PaisID'=3  union
select 'ID'=12, 'Nombre'='Sofia Vergara', 'PaisID'=4  union
select 'ID'=13, 'Nombre'='Natalia Paris', 'PaisID'=4  union
select 'ID'=14, 'Nombre'='Amparo Grisales', 'PaisID'=4  union
select 'ID'=15, 'Nombre'='Pibe Valderama', 'PaisID'=4  union
select 'ID'=16, 'Nombre'='Rene Higuita', 'PaisID'=4  union
select 'ID'=17, 'Nombre'='Manuela Saenz', 'PaisID'=5  union
select 'ID'=18, 'Nombre'='Manuela Espejo', 'PaisID'=5  union
select 'ID'=19, 'Nombre'='Alex Aguinaga', 'PaisID'=5  union
select 'ID'=20, 'Nombre'='Alberto Spencer', 'PaisID'=5  union
select 'ID'=21, 'Nombre'='Maria Felix', 'PaisID'=6  union
select 'ID'=22, 'Nombre'='Don Ramon', 'PaisID'=6  union
select 'ID'=23, 'Nombre'='El Chompiras', 'PaisID'=6  union
select 'ID'=24, 'Nombre'='La Chilindrina', 'PaisID'=6  union
select 'ID'=25, 'Nombre'='La bruja del 71', 'PaisID'=6  union
select 'ID'=26, 'Nombre'='Hugo Sanchez', 'PaisID'=6  union
select 'ID'=27, 'Nombre'='Mario Vargas Lloza', 'PaisID'=7  union
select 'ID'=28, 'Nombre'='Keiko Fujimori', 'PaisID'=7  union
select 'ID'=29, 'Nombre'='Claudia Palacios', 'PaisID'=7  union
select 'ID'=30, 'Nombre'='Eduardo Galeano', 'PaisID'=8  union
select 'ID'=31, 'Nombre'='Luis Suarez', 'PaisID'=8  union
select 'ID'=32, 'Nombre'='Oscar Tavares', 'PaisID'=8  union
select 'ID'=33, 'Nombre'='Michael Jackson', 'PaisID'=9  union
select 'ID'=34, 'Nombre'='Michel Jordan', 'PaisID'=9  union
select 'ID'=35, 'Nombre'='Katy Perry', 'PaisID'=9  union
select 'ID'=36, 'Nombre'='Kate Spade', 'PaisID'=9  
) as Clientela
set identity_insert clientes off


set identity_insert Presentaciones on
 insert into Presentaciones (PresentacionID, Description,Color,Material, Talla, FechaDeCreacion, UltimaFechaDeModificacion )
select * , getdate(), getdate()from (
select 'ID'=1, 'Desc'='Addidas, para correr','Color'='Negro', 'Material'='Cuero', 'Talla'=40 union
select 2, 'Nike basketball', 'Blanco', 'Cuero', 42 union
select 3, 'Puma, futbol', 'Azul', 'Tela', 43 union
select 4, 'Lui Button, cena', 'Fucsia', 'Velvet', 38 union
select 5, 'Aldo, disco', 'Amarillo', 'Vinil', 36 union
select 6, 'Lui Button, matrimonio', 'Negro', 'Charol', 37 union
select 7, 'Versage, fiesta', 'Rojo', 'Charol', 35 union
select 8, 'Versage, bautizo', 'Blanco', 'Cuero', 39 union
select 9, 'Payless, casual', 'Rojo', 'Vinil', 35 union
select 10, 'Bata, hogar', 'Negro', 'Cuero', 43 ) as Zapatos
set identity_insert Presentaciones off


set identity_insert productos on
 insert into Productos (ProductoID, Nombre, PresentacionID, Valor, FechaDeCreacion, UltimaFechaDeModificacion)
select *, getdate(), getdate() from (
select 'ID'=1, 'Nombre'='Adidas, Olimpiadas','Presentacion'='1', 'Valor'=200 union
select 2, 'Nike, NBA oficial', 2, 250 union
select 3, 'Puma, Rusia 2018', 3, 250 union
select 4, 'Lui Button, cocktail', 4, 600 union
select 5, 'Aldo, parranda', 5, 120 union
select 6, 'Lui Botton, novia', 6, 900 union
select 7, 'Versage, disco', 7, 400 union
select 8, 'Versage, religion', 8, 500 union
select 9, 'Payless, casa', 9, 50 union
select 10, 'Bata, oficio', 2, 250
) as ListaProductos
set identity_insert productos off



 insert into TipoDeMovimiento (tipoDeMovimientoId, Description)
select 'tipo'=1, 'Desc'='Entrada' union
select 2, 'Salida'

set identity_insert Inventario on
insert into Inventario (InventarioID, ProductoID, TipoDeMovimiento, FechaDeMovimiento, Cantidad)
--x--> Inventario inicial, necesitara nuevos entradas segun detalle de facturas....
select 'ID'=1, 'ProductoID'=1, 'TipoDeMovimiento'=1, 'FechaDeMovimiento'='2018-06-01', 'Cantidad'=100 union
select 2, 2,1,'2018-06-01',100 union
select 3, 2,1,'2018-06-01',100 union
select 4, 2,1,'2018-06-01',100 union
select 5, 2,1,'2018-06-01',100 union
select 6, 2,1,'2018-06-01',100 union
select 7, 2,1,'2018-06-01',100 union
select 8, 2,1,'2018-06-01',100 union
select 9, 2,1,'2018-06-01',100 union
select 10, 2,1,'2018-06-01',100 
set identity_insert Inventario off



set Identity_insert facturas on
insert into Facturas (FacturaID ,ClienteID ,Impuestos ,Descuentos ,ValorAPagar ,FechaDeFacturacion ,FechaDeCreacion ,UltimaFechaDeModificacion )
select 'ID'=1,'Cliente'=2,'Imp'=10,'Desc'=0,0,'2018-07-01','2018-07-01', '2018-07-01'union
select 2, 5, 10, 0, 0, '2018-07-05', '2018-07-05','2018-07-05' union
select 3, 6, 10, 0, 0, '2018-07-06', '2018-07-06', '2018-07-06' union
select 4, 8, 5, 0, 0, '2018-07-08', '2018-07-08', '2018-07-08' union
select 'ID'=5,'Cliente'=10,'Imp'=5,'Desc'=1,0,'2018-07-10','2018-07-10', '2018-07-10'union
select 'ID'=6,'Cliente'=15,'Imp'=10,'Desc'=2 ,0,'2018-07-15','2018-07-15', '2018-07-15'union
select 'ID'=7,'Cliente'=20,'Imp'=2,'Desc'=0 ,0,'2018-07-20','2018-07-20', '2018-07-20'union
select 'ID'=8,'Cliente'=26,'Imp'=12,'Desc'=1 ,0,'2018-07-26','2018-07-26', '2018-07-26'union
select 'ID'=9,'Cliente'=31,'Imp'=3,'Desc'=0 ,0,'2018-07-31','2018-07-31', '2018-07-31'union
select 'ID'=10,'Cliente'=34,'Imp'=10,'Desc'=1 ,0,'2018-08-14','2018-08-14', '2018-08-14' union
select 'ID'=11,'Cliente'=4,'Imp'=15,'Desc'=1 ,0,'2018-09-04','2018-09-04', '2018-09-04' union
select 'ID'=12,'Cliente'=9,'Imp'=9,'Desc'=1 ,0,'2018-09-09','2018-09-09', '2018-09-09' union
select 'ID'=13,'Cliente'=13,'Imp'=10,'Desc'=1 ,0,'2018-09-13','2018-09-13', '2018-09-13' union
select 'ID'=14,'Cliente'=17,'Imp'=6,'Desc'=3 ,0,'2018-09-17','2018-09-17', '2018-09-17' union
select 'ID'=15,'Cliente'=25,'Imp'=9,'Desc'=1 ,0,'2018-10-15','2018-10-15', '2018-10-15' union
select 'ID'=16,'Cliente'=35,'Imp'=12,'Desc'=2 ,0,'2018-11-15','2018-11-15', '2018-11-15' 
set Identity_insert facturas off


set Identity_insert DetalleDeFacturas on
insert into DetalleDeFacturas (DetalleDeFacturacionID ,FacturaID ,ProductoID , Cantidad, FechaDeCreacion ,UltimaFechaDeModificacion )
select 'ID'=1, 'FacturaID'=1, 'ProductoID'=3, 'Cantidad'=2, '2018-07-01', '2018-07-01' union
select 'ID'=2, 'FacturaID'=1, 'ProductoID'=2, 'Cantidad'=1, '2018-07-01', '2018-07-01' union
select 'ID'=3, 'FacturaID'=2, 'ProductoID'=1, 'Cantidad'=2, '2018-07-05', '2018-07-05' union
select 'ID'=4, 'FacturaID'=2, 'ProductoID'=2, 'Cantidad'=1, '2018-07-05', '2018-07-05' union
select 'ID'=5, 'FacturaID'=3, 'ProductoID'=1, 'Cantidad'=2, '2018-07-06', '2018-07-06' union
select 'ID'=6, 'FacturaID'=3, 'ProductoID'=3, 'Cantidad'=1, '2018-07-06', '2018-07-06' union
select 'ID'=7, 'FacturaID'=4, 'ProductoID'=1, 'Cantidad'=1, '2018-07-08', '2018-07-08' union
select 'ID'=8, 'FacturaID'=4, 'ProductoID'=3, 'Cantidad'=1, '2018-07-08', '2018-07-08' union
select 'ID'=9, 'FacturaID'=5, 'ProductoID'=1, 'Cantidad'=1, '2018-07-10', '2018-07-10' union
select 'ID'=10, 'FacturaID'=5, 'ProductoID'=3, 'Cantidad'=1, '2018-07-10', '2018-07-10' union
select 'ID'=11, 'FacturaID'=6, 'ProductoID'=1, 'Cantidad'=1, '2018-07-15', '2018-07-15' union
select 'ID'=12, 'FacturaID'=6, 'ProductoID'=2, 'Cantidad'=2, '2018-07-15', '2018-07-15' union
select 'ID'=13, 'FacturaID'=7, 'ProductoID'=2, 'Cantidad'=1, '2018-07-20', '2018-07-20' union
select 'ID'=14, 'FacturaID'=7, 'ProductoID'=3, 'Cantidad'=1, '2018-07-20', '2018-07-20' union
select 'ID'=15, 'FacturaID'=8, 'ProductoID'=2, 'Cantidad'=1, '2018-07-26', '2018-07-26' union
select 'ID'=16, 'FacturaID'=8, 'ProductoID'=3, 'Cantidad'=2, '2018-07-26', '2018-07-26' union
select 'ID'=17, 'FacturaID'=9, 'ProductoID'=1, 'Cantidad'=2, '2018-07-31', '2018-07-31' union
select 'ID'=18, 'FacturaID'=10, 'ProductoID'=1, 'Cantidad'=2, '2018-08-14', '2018-08-14' union
select 'ID'=19, 'FacturaID'=10, 'ProductoID'=2, 'Cantidad'=2, '2018-08-14', '2018-08-14' union
select 'ID'=20, 'FacturaID'=11, 'ProductoID'=4, 'Cantidad'=2, '2018-09-04', '2018-09-04' union
select 'ID'=21, 'FacturaID'=11, 'ProductoID'=8, 'Cantidad'=1, '2018-09-04', '2018-09-04' union
select 'ID'=22, 'FacturaID'=11, 'ProductoID'=7, 'Cantidad'=2, '2018-09-04', '2018-09-04' union
select 'ID'=23, 'FacturaID'=12, 'ProductoID'=5, 'Cantidad'=2, '2018-09-04', '2018-09-04' union
select 'ID'=24, 'FacturaID'=12, 'ProductoID'=9, 'Cantidad'=4, '2018-09-04', '2018-09-04' union
select 'ID'=25, 'FacturaID'=13, 'ProductoID'=4, 'Cantidad'=2, '2018-09-13', '2018-09-13' union
select 'ID'=26, 'FacturaID'=13, 'ProductoID'=7, 'Cantidad'=1, '2018-09-13', '2018-09-13' union
select 'ID'=27, 'FacturaID'=14, 'ProductoID'=5, 'Cantidad'=1, '2018-09-17', '2018-09-17' union
select 'ID'=28, 'FacturaID'=14, 'ProductoID'=10, 'Cantidad'=1, '2018-09-17', '2018-09-17' union
select 'ID'=29, 'FacturaID'=15, 'ProductoID'=2, 'Cantidad'=1, '2018-10-15', '2018-10-15' union
select 'ID'=30, 'FacturaID'=15, 'ProductoID'=8, 'Cantidad'=1, '2018-10-15', '2018-10-15' union
select 'ID'=31, 'FacturaID'=16, 'ProductoID'=6, 'Cantidad'=2, '2018-10-15', '2018-10-15' union
select 'ID'=32, 'FacturaID'=16, 'ProductoID'=8, 'Cantidad'=1, '2018-10-15', '2018-10-15' 
set Identity_insert DetalleDeFacturas off

/*
Para actualizar Valor a pagar es necesario sumar los productos comprados y aplicar impuestos y descuentos
La siguiente consulta calcula el valor total y genera el SQL de accion para actualiaar las facturas.
Si esta Db tuviera una interface todos esos calculos se lo haria al vuelo.
*/
SELECT Factura_ID, 'TotalFactura'=SUM(Valores) ,
'ActionQuery'= 'Update Facturas set ValorAPagar=' + CONVERT(VARCHAR(20), SUM(Valores)) + ' where FacturaID=' + CONVERT(VARCHAR(20),Factura_ID)
FROM ( 
		SELECT 'Factura_ID'=FRA.FacturaID,  'Valores'= Cantidad * Valor * (1 + Impuestos/100) * (1 -Descuentos/100) 		
		FROM dbo.Facturas FRA INNER JOIN dbo.DetalleDeFacturas DetFac ON FRA.FacturaID = DetFac.FacturaID
			INNER JOIN dbo.Productos Prd ON DetFac.ProductoID=Prd.ProductoID ) AS Valores
	INNER JOIN dbo.Facturas FCACT ON Valores.Factura_ID = FCACT.FacturaID
GROUP BY Valores.Factura_ID

Update Facturas set ValorAPagar=825.00 where FacturaID=1
Update Facturas set ValorAPagar=715.00 where FacturaID=2
Update Facturas set ValorAPagar=715.00 where FacturaID=3
Update Facturas set ValorAPagar=472.50 where FacturaID=4
Update Facturas set ValorAPagar=467.78 where FacturaID=5
Update Facturas set ValorAPagar=754.60 where FacturaID=6
Update Facturas set ValorAPagar=510.00 where FacturaID=7
Update Facturas set ValorAPagar=831.60 where FacturaID=8
Update Facturas set ValorAPagar=412.00 where FacturaID=9
Update Facturas set ValorAPagar=980.10 where FacturaID=10
Update Facturas set ValorAPagar=2846.25 where FacturaID=11
Update Facturas set ValorAPagar=474.80 where FacturaID=12
Update Facturas set ValorAPagar=1742.40 where FacturaID=13
Update Facturas set ValorAPagar=380.43 where FacturaID=14
Update Facturas set ValorAPagar=809.33 where FacturaID=15
Update Facturas set ValorAPagar=2524.48 where FacturaID=16


/*
	Actualizar movimiento de inventario, basado en los detalles de facturacion.
	Solo se debe correr una vez  
*/
INSERT INTO dbo.Inventario  ( ProductoID , TipoDeMovimiento , FechaDeMovimiento ,  Cantidad  )
SELECT  DetFac.ProductoID, 'TipoDeMovimiento'=2, FRA.FechaDeFacturacion, Cantidad
FROM dbo.Facturas FRA INNER JOIN dbo.DetalleDeFacturas DetFac ON FRA.FacturaID = DetFac.FacturaID
INNER JOIN dbo.Productos Prd ON DetFac.ProductoID=Prd.ProductoID
ORDER BY fra.FechaDeFacturacion

