/*
8. Calcular la cantidad de entregas efectuadas 
por cada transportista, utilizando la tabla 
PEDIDOS_NEPTUNO. La columna en la que 
se obtienen los resultados debe mostrarse con 
el nombre ENTREGAS
*/

select Transportista, count(*) As 'Entregas' from pedidos_neptuno group by Transportista;

/*
9. Utilizar la tabla NACIMIENTOS y calcular la 
cantidad de nacimientos según el sexo de 
los bebés. La columna en la que se obtienen 
los resultados debe mostrarse con el nombre 
NACIMIENTOS.
*/

select Sexo, count(*) As 'NACIMIENTOS' from nacimientos group by Sexo;

/*
10. Utilizando la tabla PEDIDOS_NEPTUNO, 
calcular el total de gastos por cliente. La 
columna en la que se obtienen los resultados 
debe mostrarse con el nombre TOTAL 
GASTOS y debe mostrar como máximo 2 
decimales. La columna en la que figuran los 
nombres de los clientes debe tener el título 
CLIENTE
*/

select NombreCompania as 'CLIENTE', round(sum(Cargo), 2) as 'TOTAL GASTOS' from pedidos_neptuno group by NombreCompania;

/*
11. Utilizando la tabla PRODUCTOS, calcular la 
cantidad de productos pertenecientes a cada 
sección. La columna en la que se obtienen los 
resultados debe mostrarse con el nombre 
CANTIDAD. Ordenar la consulta de mayor 
a menor según los valores de la columna 
CANTIDAD.
*/

select Seccion, count(*) as CANTIDAD from productos group by Seccion order by CANTIDAD desc;

/*
12. Utilizar la tabla PEDIDOS_NEPTUNO y 
calcular la cantidad de ventas efectuadas 
por mes y año. Las columnas deben 
mostrarse con los nombres AÑO, MES
y VENTAS respectivamente. Ordenar el 
resultado por año y mes, para obtener 
un listado cronológico de las ventas.
*/

SELECT year(FechaPedido) as AÑO, month(fechapedido) as MES, count(*) as VENTAS 
from pedidos_neptuno group by year(fechapedido), month(FechaPedido) order by AÑO, MES;

/*
13. Utilizar la tabla PEDIDOS_NEPTUNO y 
calcular las siguientes estadísticas:
a. El total facturado por empleado.
*/

select Empleado, round(sum(Cargo), 2) as FACTURACION from pedidos_neptuno group by empleado;

/*
b. El promedio de facturación por empleado.
*/

select Empleado, round(avg(Cargo), 2) as PROMEDIO from pedidos_neptuno group by Empleado;

/*
c. La mejor venta efectuada por cada 
empleado.
*/

select Empleado, round(max(Cargo), 2) as 'MEJOR VENTA' from pedidos_neptuno group by Empleado;

/*
d. La peor venta efectuada por cada 
empleado.
*/

select Empleado, round(min(Cargo), 2) as 'PEOR VENTA' from pedidos_neptuno group by Empleado;

/*
e. La cantidad de ventas efectuadas por 
cada empleado.
*/

select Empleado, count(*) AS VENTAS from pedidos_neptuno group by Empleado;

/*
f. Tener en cuenta las siguientes especificaciones: las columnas deben recibir los 
nombres FACTURACION, PROMEDIO, 
MEJOR VENTA, PEOR VENTA y VENTAS. 
Las columnas llamadas FACTURACION y 
PROMEDIO deben mostrar, como máximo, 
2 decimales. 
*/

select Empleado, round(sum(Cargo), 2) as 
FACTURACION, round(avg(Cargo), 2) as PROMEDIO, 
round(max(Cargo), 2) as 'MEJOR VENTA',
round(min(Cargo), 2) as 'PEOR VENTA', 
count(*) AS VENTAS from pedidos_neptuno group by Empleado;