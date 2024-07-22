-- Etapa 3.2: Funciones integradas de texto
/*1. Utilizar la tabla CLIENTES_NEPTUNO y 
generar una consulta que muestre las 
columnas IDCLIENTE y NOMBRECOMPANIA. 
En el resultado de la consulta, se debe 
mostrar una nueva columna llamada 
UBICACION que concatene las columnas 
DIRECCION, CIUDAD y PAIS, separando 
los valores de estos campos por un guión. 
Para este primer ejercicio, utilizar la función 
CONCAT.
*/

select IDCLIENTE, NOMBRECOMPANIA, concat(direccion,' - ', ciudad, ' - ', pais) Ubicacion from clientes_neptuno;


/*
2. Repetir el ejercicio anterior, utilizando la 
función CONCAT_WS.
*/

select IDCLIENTE, NOMBRECOMPANIA, concat_ws(' - ', direccion, ciudad, ' - ', pais) Ubicacion from clientes_neptuno;

/*
3. Modificar el ejercicio anterior para mostrar en 
mayúsculas los valores cargados en el campo 
NOMBRECOMPANIA. Esta columna debe 
mostrarse con el nombre EMPRESA.
*/

select IDCLIENTE, upper(NOMBRECOMPANIA) as Empresa, concat_ws('-', direccion, ciudad, pais) Ubicacion from clientes_neptuno;

/*
4. Modificar el ejercicio anterior para mostrar los 
valores cargados en el campo IDCLIENTE en 
minúsculas. Esta columna debe mostrarse 
con el nombre CODIGO
*/

select lower(IDCLIENTE) as Codigo, upper(NOMBRECOMPANIA) as Empresa, concat_ws('-', direccion, ciudad, pais) Ubicacion from clientes_neptuno;

/*
5. Utilizar la tabla NACIMIENTOS y generar una 
consulta que muestre la columna FECHA. En 
el resultado de la consulta, se debe mostrar 
una nueva columna con el nombre SEXO que 
muestre la inicial de los datos cargados en el 
campo SEXO y otra columna con el nombre 
TIPO que muestre la inicial de los datos 
cargados en el campo TIPO_PARTO.
*/

select FECHA, left(Sexo, 1) Sexo, left(tipo_parto, 1) Tipo from nacimientos;

/*
6. Utilizar la tabla CLIENTES_NEPTUNO y 
genera una consulta que muestre todos los 
campos de la tabla. Agregar una nueva 
columna a la consulta con el nombre 
CODIGO. La misma, debe concatenar la 
primera letra del campo CIUDAD y la 
primera y las 2 últimas letras del campo 
PAIS. Los datos de esta nueva columna se 
deben mostrar en mayúsculas
*/

select *, UPPER(CONCAT(left(ciudad, 1), left(pais, 1), right(pais, 2))) CODIGO from clientes_neptuno;

/*
7. Utilizar la tabla NACIMIENTOS y generar una consulta 
que muestre las 5 primeras columnas de la tabla. 
Agregar una nueva columna a la consulta con el 
nombre MES que tome el mes de nacimiento de los 
bebés del campo FECHA. Ordenar el resultado de 
menor a mayor por los valores de la columna MES.
*/

SELECT sexo, fecha, tipo_parto, atenc_part, LOCAL_PART, substring(fecha, 4, 2) Mes from nacimientos order by mes;

/*
8. Utilizar la tabla NACIMIENTOS y generar una consulta 
que muestre las siguientes columnas: SEXO, FECHA y 
TIPO_PARTO. En el resultado de la consulta, se debe 
mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la 
columna NACIONALIDAD original por Ciudadana
*/

SELECT sexo, fecha, tipo_parto, replace(nacionalidad, 'Chilena', 'Ciudadana') NACIONALIDAD from nacimientos;


-- Etapa 3.3: Funciones integradas de fecha
/*
1. Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados a lo largo del año 1998.
*/

SELECT * from pedidos_neptuno WHERE fechapedido >= '19980101' and fechapedido <= '19981231' order by fechapedido;

SELECT * from pedidos_neptuno WHERE fechapedido BETWEEN '19980101' and '19981231' order by fechapedido;

SELECT * from pedidos_neptuno WHERE year(fechapedido) = 1998 order by fechapedido;



/*
2. Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados durante los meses de agosto 
y septiembre del año 1997.
*/

SELECT * from pedidos_neptuno WHERE fechapedido BETWEEN 19970801 and 19971230 order by fechapedido;

select * from pedidos_neptuno where year(fechapedido) = 1997 and month(fechapedido) in (8,9) order by Fechapedido;

select * from pedidos_neptuno where month(fechapedido) between 8 and 9 and year(fechapedido) = 1997 order by Fechapedido;

select * from pedidos_neptuno where month(fechapedido) in (8,9) and year (fechapedido) = 1997 order by Fechapedido;
/*
3. Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados el primer día de cada mes de 
cualquier año.
*/

SELECT * from pedidos_neptuno where day(fechapedido) = 1 order by fechapedido;

/*
4. Utilizar la tabla PEDIDOS_NEPTUNO y 
obtener una lista de todos los registros
contenidos en la tabla. En una nueva 
columna llamada DIAS TRANSCURRIDOS, 
mostrar la cantidad de días transcurridos 
desde la fecha en que fue realizado cada 
pedido, al día de hoy.
*/

-- investigar error hecho por el profesor para la siguiente clase

SELECT *, datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), fecha pedido) / 365.25 'Años Transcurridos' from pedidos_neptuno;

/*
5. Modifica la consulta anterior y agregar otra 
columna con el nombre DIA, que refleje el 
nombre del día en el que se efectuó cada 
uno de los pedidos
*/

SELECT *, dayname(fechapedido) Dia, datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), fechapedido) / 365.25 'Años transcurridos' from pedidos_neptuno;


/*
6. Modificar la consulta anterior, agregando otra 
columna con el nombre DIA DEL AÑO, que 
refleje el número del día del año en el que se 
efectuó cada uno de los pedidos.
*/

SELECT *, dayname(fechapedido) Dia, dayofyear (fechapedido) 'Dia del año', datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), fechapedido) / 365.25 'Años transcurridos' from pedidos_neptuno;

/*
7. Modificar la consulta anterior y agregar otra 
columna con el nombre MES, que refleje el 
nombre del mes del año en el que se efectuó 
cada uno de los pedidos.
*/

SELECT *, dayname(fechapedido) Dia, dayofyear (fechapedido) 'Dia del año', 
monthname(fechapedido) Mes,
datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), 
fechapedido) / 365.25 'Años transcurridos' from pedidos_neptuno;


/*
8. Modificar la consulta anterior y agregar otra 
columna llamada PRIMER VENCIMIENTO
que calcule el primer vencimiento de cada 
factura, suponiendo que dicho vencimiento 
es a los 30 días de haber sido emitida.
*/

SELECT *, dayname(fechapedido) Dia, dayofyear (fechapedido) 'Dia del año', 
monthname(fechapedido) Mes, adddate(fechapedido, interval 30 day) 'Primer vencimiento',
datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), 
fechapedido) / 365.25 'Años transcurridos' from pedidos_neptuno;


/*
9. Modificar la consulta anterior y agregar otra 
columna llamada SEGUNDO VENCIMIENTO 
que calcule el segundo vencimiento de cada 
factura, suponiendo que dicho vencimiento 
es a los 2 meses de haber sido emitida
*/

SELECT *, dayname(fechapedido) Dia, dayofyear (fechapedido) 'Dia del año', 
monthname(fechapedido) Mes, adddate(fechapedido, interval 30 day) 'Primer vencimiento',
adddate(fechapedido, interval 60 day) 'Segundo vencimiento',
datediff(curdate(), fechapedido) 'Dias transcurridos', datediff(curdate(), 
fechapedido) / 365.25 'Años transcurridos' from pedidos_neptuno;

-- Etapa 3.4: Funciones matemáticas integradas
/*
1. Utilizar la tabla PEDIDOS_NEPTUNO y 
obtener una lista de todos los registros
cargados en la tabla. Generar una nueva 
columna con el nombre IVA que calcule el 
21% del cargo de cada pedido, obteniendo 
un valor numérico que, como máximo, 
contenga 2 decimales.
*/

SELECT *, round(cargo * 0.21, 2) IVA from PEDIDOS_NEPTUNO;


/*
2. Modificar la consulta anterior, agregando una 
nueva columna con el nombre NETO, que 
calcule el total a pagar por cada cliente por 
las compras realizadas (es decir, sumándole 
el IVA al cargo original, manteniendo como 
máximo 2 decimales).
*/

SELECT *, round(cargo * 0.21, 2) IVA, round(cargo * 1.21, 2) NETO from PEDIDOS_NEPTUNO;

/*
3. Modificar la consulta anterior, agregando una 
nueva columna con el nombre REDONDEO A 
FAVOR CLIENTE que devuelva el valor entero 
inferior del neto calculado anteriormente.
*/

SELECT *, round(cargo * 0.21, 2) IVA, round(cargo * 1.21, 2) NETO, floor(cargo * 1.21) 'Redondeo a favor del cliente' from PEDIDOS_NEPTUNO;

/*
4. Modificar la consulta anterior, agregando una 
nueva columna con el nombre REDONDEO 
A FAVOR EMPRESA que devuelva el valor 
entero superior del neto antes calculado
*/

SELECT *, round(cargo * 0.21, 2) IVA, round(cargo * 1.21, 2) NETO, floor(cargo * 1.21) 'Redondeo a favor del cliente',
ceiling(cargo * 1.21) 'Redondeo a favor de EMPRESA' from PEDIDOS_NEPTUNO;

-- Etapa 3.5: Funciones de agregado - agrupamiento
/*
1. Calcular la cantidad de registros cargados en 
la tabla PEDIDOS_NEPTUNO.
*/

select count(*) 'Cantidad de Pedidos / Registros' from pedidos_neptuno;

/*
2. Calcular la cantidad de pedidos cargados en 
la tabla PEDIDOS_NEPTUNO que hayan sido 
entregados por el transportista con el nombre 
SPEEDY EXPRESS. La columna en la que se 
obtiene el resultado debe mostrarse con el 
nombre ENTREGAS SPEEDY EXPRESS.
*/

select count(*) 'Entregas Speedy Express' from pedidos_neptuno where transportista = 'Speedy Express';
select * from pedidos_neptuno where transportista = 'Speedy Express';

/*
3. Calcular la cantidad de pedidos cargados en 
la tabla PEDIDOS_NEPTUNO que hayan sido 
atendidos por empleados cuyo apellido 
comience con la letra C. La columna en la 
que se obtiene el resultado debe mostrarse 
con el nombre VENTAS.
*/

select count(*) 'Empleados cual apellido empieza con C' from pedidos_neptuno where left(Empleado, 1) = 'C';
select *, left(empleado, 1) = 'C' VENTAS from pedidos_neptuno;


/*
4. Calcular el precio promedio de todos los 
productos cargados en la tabla llamada 
PRODUCTOS_NEPTUNO. La columna del 
resultado, debe mostrarse con el nombre 
PRECIO PROMEDIO. El resultado debe 
mostrar, como máximo, sólo 2 decimales
*/

select round(avg(preciounidad), 2) 'Precio Promedio' from productos_neptuno;

/*
5. Modificar la consulta anterior para obtener el 
precio más bajo de la tabla. La columna en 
la que se obtiene el resultado debe mostrarse 
con el nombre PRECIO INFERIOR.
*/

select round(avg(preciounidad), 2) 'Precio Promedio', min(preciounidad) 'Precio Inferior' from productos_neptuno;

/*
6. Modificar la consulta anterior para obtener 
el precio más alto de la tabla. La nueva 
columna debe mostrarse con el nombre 
PRECIO MAXIMO.
*/

select round(avg(preciounidad), 2) 'Precio Promedio', min(preciounidad) 'Precio Inferior', 
max(preciounidad) 'Precio Maximo' from productos_neptuno;

/*
7. Generar una consulta en base a la tabla 
PRODUCTOS_NEPTUNO que muestre el 
precio más alto correspondiente a cada 
categoría. La columna en la que se obtiene 
dicho precio debe mostrarse con el nombre 
PRECIO MAXIMO. La columna que muestra 
las categorías debe mostrarse con el nombre 
CATEGORIA.
*/


select nombrecategoria Categoria, max(preciounidad) 'Precio Maximo' from productos_neptuno group by nombrecategoria;

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

select NombreCompania as 'CLIENTE', round(sum(Cargo), 2) 'TOTAL GASTOS' from pedidos_neptuno group by NombreCompania;

/*
11. Utilizando la tabla PRODUCTOS, calcular la 
cantidad de productos pertenecientes a cada 
sección. La columna en la que se obtienen los 
resultados debe mostrarse con el nombre 
CANTIDAD. Ordenar la consulta de mayor 
a menor según los valores de la columna 
CANTIDAD.
*/

select Seccion, count(*) as CANTIDAD from productos group by Seccion order by CANTIDAD desc; -- esta consulta no es para todos los motores
select Seccion, count(*) Cantidad from productos group by seccion order by count(*); -- esta consulta me sirve para todos los motores

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

select Empleado, max(Cargo) as 'MEJOR VENTA' from pedidos_neptuno group by Empleado;

/*
d. La peor venta efectuada por cada 
empleado.
*/

select Empleado, min(Cargo) as 'PEOR VENTA' from pedidos_neptuno group by Empleado;

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
max(Cargo) as 'MEJOR VENTA', min(Cargo) as 'PEOR VENTA', 
count(*) AS VENTAS from pedidos_neptuno group by Empleado;

