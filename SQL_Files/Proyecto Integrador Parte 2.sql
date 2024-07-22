-- Proyecto Integrador Parte 2

/* Etapa 2.1: Importar tablas externas
 1. Importar el archivo CSV con el nombre 
CLIENTES_NEPTUNO (éste se encuentra  
disponible en el área de descargas, del 
presente módulo) a la base de datos con el 
nombre LABORATORIO. Y tener en cuenta 
las siguientes indicaciones:
 a. No cambiar el nombre de la tabla.
 b. Eliminar la tabla en el caso de que ya 
exista dentro de la base de datos.
 c. Mantener los tipos de datos asignados al 
momento de la importación.
 Nota: si no recuerdas los pasos para 
llevar a cabo la importación de tablas 
desde orígenes externos, puedes leer 
el contenido de este módulo. 
Introducción a Bases de Datos y SQL
*/



 /*2. Llevar a cabo los siguientes cambios en la 
tabla CLIENTES_NEPTUNO importada ante
riormente. Respetar las consignas detalladas 
a continuación y utilizar el comando ALTER 
TABLE:
 a. Campo IDCliente: debe ser de tipo 
VARCHAR, debe admitir hasta 5 caracte
res como máximo y debe ser el campo 
PRIMARY KEY de la tabla.
 b. Campo NombreCompania: debe ser de 
tipo VARCHAR, debe admitir hasta 100 
caracteres como máximo y no puede 
quedar vacío.
 c. Campo Pais: debe ser de tipo VARCHAR, 
debe admitir hasta 15 caracteres como 
máximo y no puede quedar vacío.
*/

alter table CLIENTES_NEPTUNO
MODIFY IDCliente varchar(5) PRIMARY KEY,
modify NombreCompania varchar(100) NOT NULL,
modify Pais varchar(15) NOT NULL;


/* 3. Cambiar el nombre de la tabla CLIENTES por 
CONTACTOS.
*/

RENAME TABLE CLIENTES TO CONTACTOS;


/* 4. Importar el archivo CSV con el nombre 
CLIENTES a la base de datos 
LABORATORIO. Y tener en cuenta las 
siguientes indicaciones:
 a. Este archivo lo encontrarás disponible en el 
área de descargas del presente módulo.
 b. No cambiar el nombre de la tabla.
 c. Mantener los tipos de datos asignados al 
momento de la importación.
*/

-- ya esta hecho

/*Introducción a Bases de Datos y SQL
 5. Llevar a cabo los siguientes cambios en la 
tabla CLIENTES  importada anteriormente. 
Respetar las consignas detalladas a conti
nuación y utiliza el comando ALTER TABLE:
 a. Campo Cod_Cliente: debe ser de tipo 
VARCHAR, debe admitir hasta 7 carac
teres como máximo y debe ser el campo 
PRIMARY KEY de la tabla.
 b. Campo Empresa: debe ser de tipo 
VARCHAR, debe admitir hasta 100 
caracteres como máximo y no puede 
quedar vacío.
 c. Campo Ciudad: debe ser de tipo 
VARCHAR, debe admitir hasta 25 caracte
res como máximo y no puede quedar vacío.
 d. Campo Telefono: debe ser de tipo INT y no 
debe admitir valores numéricos negativos.
 e. Campo Responsable: debe ser de tipo 
VARCHAR y debe admitir como máximo 
hasta 30 caracteres.
*/

alter table CONTACTOS
MODIFY Cod_cliente varchar(7) PRIMARY KEY,
modify Empresa varchar(100) NOT NULL,
modify Ciudad varchar(25) NOT NULL,
modify Telefono int unsigned,
modify Responsable varchar(30);


/*Introducción a Bases de Datos y SQL
 6. Importar el archivo CSV con el nombre 
PEDIDOS a la base de datos LABORATORIO. 
Y tener en cuenta las siguientes indicaciones:
 a. Este archivo lo encontrarás disponible en el 
área de descargas del presente módulo.
 b. No cambiar el nombre de la tabla.
 c. Mantener los tipos de datos asignados al 
momento de la importación.
*/

-- REALIZADO

/* 7. Llevar a cabo los siguientes cambios en la 
tabla PEDIDOS  importada anteriormente. 
Respetar las consignas detalladas a conti
nuación y utilizar el comando ALTER TABLE:
 a. Campo Numero_Pedido: debe ser de tipo 
INT, sólo debe aceptar valores numéricos 
enteros y debe ser el campo PRIMARY KEY 
de la tabla.
 b. Campo Codigo_Cliente: debe ser de tipo 
VARCHAR, debe admitir hasta 7 caracte
res como máximo y no puede quedar vacío.
 c. Campo Fecha_Pedido: debe ser de tipo 
DATE y su carga es obligatoria.
Introducción a Bases de Datos y SQL
 d. Campo Forma_Pago: sólo debe admitir la 
carga de los valores APLAZADO, 
CONTADO o TARJETA.
 e. Campo Enviado: sólo debe admitir la carga 
de los valores SI o NO.
*/

alter table PEDIDOS
MODIFY Numero_Pedido int PRIMARY KEY,
modify Codigo_Cliente varchar(7) NOT NULL,
modify Fecha_Pedido DATE NOT NULL,
modify Forma_Pago ENUM ('APLAZADO', 'CONTADO', 'TARJETA'),
modify Enviado ENUM('SI', 'NO');

/*8. Importar el archivo CSV: PRODUCTOS a la 
base de datos LABORATORIO. Y tener en 
cuenta las siguientes indicaciones:
 a. Este archivo lo encontrarás disponible en 
el área de descargas del presente módulo.
 b. No cambiar el nombre de la tabla.
 c. Mantener los tipos de datos asignados al 
momento de la importación.
Introducción a Bases de Datos y SQL
 c. Campo Nombre: debe ser de tipo VARCHAR, debe 
admitir hasta 40 caracteres como máximo y no 
puede quedar vacío. 
d. Campo Importado: sólo debe admitir la carga de los 
valores VERDADERO o FALSO.
 e. Campo Origen: debe ser de tipo VARCHAR, admitir 
hasta 25 caracteres y ser de carga obligatoria.
 f. Campos Dia, Mes y Ano: deben ser de tipo INT, 
positivos y de carga obligatoria.
*/


/*9.Llevar a cabo los siguientes cambios en la 
tabla PRODUCTOS importada en el paso 
anterior. Respetar las consignas detalladas a 
continuación, utilizando el comando ALTER 
TABLE:
 a. Campo Cod_Producto: debe ser de tipo 
INT, sólo debe aceptar valores numéricos 
enteros y debe ser el campo PRIMARY KEY 
de la tabla.
 b. Campo Seccion: debe ser de tipo 
VARCHAR, debe admitir hasta 20 
caracteres como máximo y no puede 
quedar vacío
c. Campo Nombre: debe ser de tipo VARCHAR, debe 
admitir hasta 40 caracteres como máximo y no 
puede quedar vacío. 
d. Campo Importado: sólo debe admitir la carga de los 
valores VERDADERO o FALSO.
 e. Campo Origen: debe ser de tipo VARCHAR, admitir 
hasta 25 caracteres y ser de carga obligatoria.
 f. Campos Dia, Mes y Ano: deben ser de tipo INT, 
positivos y de carga obligatoria
*/

alter table PRODUCTOS
MODIFY Cod_producto int PRIMARY KEY,
modify Seccion varchar(20) NOT NULL,
modify Nombre varchar(40) NOT NULL,
modify Importado ENUM('VERDADERO', 'FALSO'),
modify Origen varchar(25) NOT NULL,
modify Dia int UNSIGNED NOT NULL,
Modify Mes int UNSIGNED NOT NULL,
Change Ano Anio int UNSIGNED NOT NULL;


/*Etapa 2.2: Generar tablas desde scripts
 1. Abrir el archivo con formato SQL con el nombre 
NACIMIENTOS* desde MySQL Workbench. 
(Este archivo lo encontrarás disponible en el área 
de Descargas del presente módulo).

-- REALIZADO

 2. Ejecutar el código.
 
-- REALIZADO
 
 3. Actualizar los esquemas para corroborar la 
generación de la tabla NACIMIENTOS dentro 
de la base de datos LABORATORIO

-- REALIZADO

4. Abrir el archivo con formato SQL con el 
nombre PEDIDOS_NEPTUNO desde MySQL 
Workbench. 

-- REALIZADO

5. Ejecutar el código.

-- REALIZADO

 6. Abrir el archivo con formato SQL con el 
nombre TABLAS_EXTRAS desde MySQL 
Workbench.

-- REALIZADO

 7. Ejecutar el código.
 
 -- REALIZADO
 
 8. Actualizar los esquemas para corroborar la 
generación de la tabla PEDIDOS_NEPTUNO 
dentro de la base de datos LABORATORIO.

-- REALIZADO

9. Cerrar los scripts con los nombres 
NACIMIENTOS, PEDIDOS NEPTUNO y 
TABLAS EXTRAS.
*/

/*
Etapa 2.3: Consultar tablas
 1. Mostrar todo el contenido de la tabla 
CLIENTES_NEPTUNO importada en el 
laboratorio anterior.
*/

select * FROM CLIENTES_NEPTUNO;

/*
 2. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS.
*/

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO;

/*
 3. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Luego, ordenar alfabéticamente el resultado 
de la consulta por los nombres de los países.
*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais;
SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais desc;

/*
 4. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar el resultado de la consulta 
alfabéticamente por los nombres de los 
países. Para aquellos países que se repiten, 
ordenar las ciudades alfabéticamente.
*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais, Ciudad;
SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais, Ciudad, NOMBRECOMPANIA;

/*
 5. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar de manera alfabética el resultado de 
la consulta, por los nombres de los países. 
Mostrar únicamente los 10 primeros clientes
*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais limit 10;


/*
6. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar de manera alfabética el resultado de 
la consulta, por los nombres de los países. 
Mostrar únicamente los clientes ubicados 
desde la posición 11 hasta la 15
*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno
ORDER BY Pais limit 5 offset 10;


/* UN CRITERIO LOGICO TRAE LAS COINCIDENCIAS QUE TENGA UNA FILA ( EJ: CANTIDAD DE VARONES/ MUJERES). PARA PODER FILTRAR TODAS LAS OPCIONES
SE UTILIZA LA PALABRA RESERVADA WHERE (EXPRESION LOGICA) (VERDADERO / FALSO)*/

SELECT * FROM contactos;

SELECT * FROM CONTACTOS WHERE RESPONSABLE = 'angel' OR RESPONSABLE = 'juan' OR RESPONSABLE = 'ana';

SELECT * FROM CONTACTOS WHERE RESPONSABLE IN ('SANTIAGO', 'GONZALO', 'MICAELA');

SELECT * FROM CONTACTOS WHERE RESPONSABLE NOT IN ('SANTIAGO', 'GONZALO', 'MICAELA');

SELECT * FROM CONTACTOS WHERE RESPONSABLE NOT IN ('SANTIAGO', 'GONZALO', 'MICAELA');

SELECT * FROM CONTACTOS WHERE RESPONSABLE = 'SANTIAGO' or RESPONSABLE = 'GONZALO' OR RESPONSABLE = 'MICAELA';

-- donde tenemos los datos numericos?

select * from artículos;

select nombre, precio from artículos where precio = 513.35;

select nombre, precio from artículos where precio > 513.35;

select nombre, precio from artículos where precio < 513.35;

select nombre, precio from artículos where precio < 600 and stock > 40;

select nombre, precio from artículos where precio < 600 or stock > 40;

select nombre, precio from artículos where precio > 500 and precio < 1000;

-- Estas 2 operaciones son equivalentes, ya que pueden ser utilizadas con la misma finalidad

select nombre, precio from artículos where precio >= 513.35 and precio <= 979.75;

select nombre, precio from artículos where precio between 513.35 and 979.75;

-- between es una palabra reservada que significa "entre", en between siempre tiene que ir primero el valor minimo y luego el maximo

-- Traer todos los articulos en donde el stock aumentando un 25% sea menos a 40

select * from artículos;

select * from artículos where stock * 1.25 < 40;

-- que pasa si quiero un producto con un valor de precio de lista?

select * from artículos where precio in (1589.5, 2000, 3005);

select * from artículos where precio not in (1589.5, 2000, 3005);

/*1. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
extranjeras. Mostrar todos los campos de la 
tabla en el resultado de la consulta.
*/

select * from nacimientos limit 1;
select * from nacimientos where nacionalidad <> 'chilena';
select * from nacimientos where nacionalidad = 'extranjera';
select * from nacimientos where nacionalidad not in ('extranjera', 'chilena');


/*2. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
menores de edad. Mostrar todos los campos 
de la tabla en el resultado de la consulta y 
ordenar el resultado de menor a mayor por 
la edad de las madres.
*/

select * from nacimientos where edad_madre < 18 order by edad_madre;
select * from nacimientos where edad_madre < 18 order by edad_madre desc;


/*3. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que tengan la misma edad que el padre. 
Mostrar todos los campos de la tabla en 
el resultado de la consulta.
*/

select * from nacimientos where edad_padre = edad_madre;

select * from nacimientos where edad_madre = edad_padre;



/*4. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que, con respecto al padre, tengan 40 años o 
menos que el padre.
*/

select edad_madre, edad_padre, edad_padre - edad_madre from nacimientos order by edad_padre - edad_madre desc;
-- arriba se calculo la diferencia de edad
select edad_madre, edad_padre, edad_padre - edad_madre from nacimientos where edad_padre - edad_madre >= 40 order by edad_padre - edad_madre;

/*5. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residen en Argentina. Mostrar todos los 
campos de la tabla en el resultado de la 
consulta.
*/

select * from clientes_neptuno;
select * from clientes_neptuno where pais = 'Argentina';

/*6. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos los clientes, con excepción 
de los que residen en Argentina. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar alfabéticamente 
dicho resultado por los nombres de los países.
*/

select * from clientes_neptuno where pais <> 'Argentina' order by pais;
select * from clientes_neptuno where pais not in ('Argentina') order by pais asc; -- ASC es de ascendente, por defecto se ordena por asc
select * from clientes_neptuno where pais != 'Argentina' order by pais;

/*7. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que nacieron con 
menos de 20 semanas de gestación. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar dicho resultado de 
mayor a menor, por los valores de la columna 
SEMANAS.
*/

select * from nacimientos;
select * from nacimientos where semanas < 20 order by semanas desc;


/*8. De la tabla NACIMIENTOS, obtener una lista 
de todos los bebés de sexo femenino, 
nacidos de madres extranjeras solteras, de 
más de 40 años. Mostrar todos los campos
de la tabla en el resultado de la consulta.
*/

select * from nacimientos;
select * from nacimientos where sexo = 'femenino' and nacionalidad = 'extranjera' and edad_madre > 40 and estado_civil_madre = 'soltera';


/*
9. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residan en países sudamericanos. 
Mostrar todos los campos de la tabla en el 
resultado de la consulta y ordenar de manera 
alfabética los registros, por los nombres de 
los países y las ciudades.
*/

select * from clientes_neptuno;
select * from clientes_neptuno where pais = 'Argentina' or pais = 'brasil' or pais = 'venezuela' order by pais, ciudad;
select * from clientes_neptuno where pais in ( 'Argentina', 'brasil','venezuela') order by pais, ciudad;

/*
10. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que hayan nacido 
con una cantidad de semanas de gestación 
de entre 20 y 25 semanas, inclusive. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar el resultado según 
las semanas de gestación de los recién 
nacidos, de menor a mayor.
*/

select * from nacimientos;
select * from nacimientos where semanas between 20 and 25 order by semanas;

/*
11. De la tabla NACIMIENTOS, utilizar el operador IN y obtener una lista de todos los bebés 
que nacieron en las comunas 1101, 3201, 
5605, 8108, 9204, 13120 y 15202. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar de menor a mayor
los registros, por los números de comuna
*/

select * from nacimientos;
select * from nacimientos where comuna in (1101, 3201, 
5605, 8108, 9204, 13120, 15202) order by comuna;

/*
12. De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes cuyo ID comience con la letra 
C. Mostrar todos los campos de la tabla, en el 
resultado de la consulta.
*/

select * from clientes_neptuno;
select * from clientes_neptuno  where IDCliente like 'c%';
select * from clientes_neptuno where direccion like '%a%' '%v%';
select * from clientes_neptuno where direccion like '%a%''%v%'; -- este no tiene un espacio, te va a devolver otro resultado
select * from clientes_neptuno where direccion like '%av%';
SELECT * FROM clientes_neptuno WHERE Direccion LIKE '%a%' '%v%' or '%av%';
select * from clientes_neptuno  where pais like 'ca%';

/*
13. De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes que residan en una ciudad que 
comience con la letra B y en total posea 5 caracteres. 
Mostrar todos los campos de la tabla en el resultado 
de la consulta.
*/

select * from clientes_neptuno;
select * from clientes_neptuno where ciudad like 'b%' and char_length(ciudad) = 5;
select * from clientes_neptuno where ciudad like 'b____';

/*
14. De la tabla NACIMIENTOS, obtener una lista de todos 
aquellos padres que tengan más de 10 hijos
*/

select * from nacimientos; 
select * from nacimientos where hijos_total > 10 order by hijos_total; 


---------------------------------------------------------------------------------------

-- UTILIZACION DE FUNCIONES

-- PARA QUE SIRVEN? QUE TIPOS DE FUNCIONES EXISTEN?

/* Es un codigo/procedimiento que esta escrito en lenguaje SQL y que tiene pequeños programas de programacion
este lenguaje nos permite crear funciones, nos permite usar funciones integradas
que ya estan disponibles para ser ejecutadas, la funcion es algo que el motor sabe realizar
pero para eso debo utilizar los parametros correctos, hay funciones que no aceptan parametros"
*/

select * from clientes;

-- funciones integradas (de texto, matematicas, logicas, de fecha).
-- algunas aceptan parametros (argumentos), otras no

select current_date(), current_time();

select upper('celeste andrea candia');
select lower('CELESTE ANDREA CANDIA');

select ucase('celeste andrea candia');
select lcase('CELESTE ANDREA CANDIA');

-- Funciones de Concatenacion (concat) para poder concatenar textos

select concat('Eduardo', 'Degano');
select concat_ws('Eduardo', 'Degano');

-- Para extraer textos (left)

select left('Eduardo', 1);

select concat(left('Eduardo', 1), '.', 'Degano');

select concat('PB', ' ', right('Dto. A', 1));

-- Las funcioones Daypart (devolver siempre valores enteros de lo contrario podrian devolver 9 en vez de 09
-- en que bimestre mas ventas tengo? quiero saber todos los pedidos del primer trimestre?
-- como lo calculo?

select * from pedidos where month(fecha_pedido) in (1,2,3);
select * from pedidos where month(fecha_pedido) <= 6;
select * from pedidos where month(fecha_pedido) > 9;

-- quiero saber todos los pedidos que  se realizan en la segunda quincena

select * from pedidos where day(fecha_pedido) > 15;

-- entre la semana 2 y 3

select * from pedidos where day(fecha_pedido) between 8 and 22;

-- como descompongo las horas

select *, hour(fecha_pedido), minute(fecha_pedido), second(fecha_pedido) hora from pedidos;

-- Matematicas

-- Tengo que hacer un calculo de aritmetica para poder ver otra funcion

select nombre, precio * 1.27 'Precio IVA' from artículos;

select nombre, round(precio * 1.27, 2) 'Precio IVA' from artículos;

select nombre, precio *  1.27, round(precio * 1.27, 2) 'Precio IVA', mod(10, 2) from artículos; 
select nombre, precio *  1.27, round(precio * 1.27, 2) 'Precio IVA', pow(2, 8) from artículos; 
-- la funcion mod devuelve el resto de la division
-- la funcion pow significa potencia y multiplica el calculo, ejmeplo 2 a la 8 = 256
select nombre, precio *  1.27, round(precio * 1.27, 2) 'Precio IVA', precio, ceil(precio), floor(precio), pow(2, 8) from artículos;


--
-- Funciones de agregacion (agrupamiento) funciones que me permiten calcular valores agregados
-- count, sum, avg(average), max, min

SELECT * from artículos;

SELECT count(*) 'cantidad de artículos' from artículos;

SELECT count(*) 'Cantidad de Productos' from productos;

SELECT count(*) 'Cantidad de Pedidos' from pedidos;

SELECT count(*) 'Cantidad de Pedidos' from pedidos_neptuno;

SELECT count(*) 'Cantidad de Varones' from nacimientos WHERE sexo = 'masculino';

-- como traigo el total del stock?

SELECT count(*) 'Cantidad de Articulos', sum(stock) 'Total de stock', max(precio) 'Precio Maximo', min(precio) 'Precio minimo', avg(precio) 'Promedio de precios' from artículos;

SELECT count(*) 'Cantidad de Articulos', sum(stock) 'Total de stock', max(precio) 'Precio Maximo', min(precio) 'Precio minimo', round(avg(precio), 2) 'Promedio de precios' from artículos;

-- Agrupamiento de consultas

SELECT nombrecategoria, count(*) 'Cantidad de Productos', round(avg(preciounidad), 0) 'Precio promedio', max(preciounidad) 'Precio maximo', min(preciounidad) 'Precio Minimo' from productos_neptuno WHERE nombrecategoria in ('Bebidas', 'Condimentos') group by nombrecategoria;

SELECT nombrecategoria, count(*) 'Cantidad de Productos', round(avg(preciounidad), 0) 'Precio promedio', max(preciounidad) 'Precio maximo', min(preciounidad) 'Precio Minimo' from productos_neptuno WHERE nombrecategoria in ('Bebidas', 'Condimentos') group by idproveedor;

-- consulta mal formada

select pais, ciudad, count(*) 'Cantidad de Cliente' from clientes_neptuno;

-- consulta bien formada

select pais, ciudad, count(*) 'Cantidad de cliente' from clientes_neptuno group by pais, ciudad;





