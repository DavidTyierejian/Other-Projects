-- Introducción a Bases de Datos y SQL
-- Etapa 1.1: Crear bases de datos

/* 

1 Crear una base de datos con el nombre
LABORATORIO. En el caso de que la base de
datos exista previamente, eliminarla antes de
iniciar el laboratorio.

*/

CREATE DATABASE LABORATORIO;

/*

2. Poner en uso la base de datos generada en el
paso anterior.

*/

USE LABORATORIO; 

/*

3. Crear una tabla con el nombre FACTURAS
dentro de la base de datos con la estructura
que se muestra en la diapositiva 5 y tener en
cuenta las siguientes consideraciones:

a. PK significa PRIMARY KEY.

b. Observar que se declara una clave
primaria compuesta por los campos Letra
y Número; cada campo por sí solo no es
clave, ni tampoco identifica al registro, pero
la combinación de ambos forman la clave.

*/

CREATE TABLE FACTURAS(
Letra char(1), 
Número int,
ClienteID int,
ArticuloID int,
Fecha date,
Monto double,
Primary key (Letra, Número));

/*

4. Crear una tabla con el nombre ARTÍCULOS
dentro de la base de datos y tomar en
consideración la estructura definida en la
diapositiva 5.

*/

CREATE TABLE ARTÍCULOS(
ArticuloID INT PRIMARY KEY, 
Nombre VARCHAR(50),
Precio double,
Stock int);

/*

5. Crear una tabla con el nombre CLIENTES
dentro de la base de datos y tomar en
consideración la estructura definida en la
diapositiva siguiente.

*/

 CREATE TABLE CLIENTES (
 CLIENTEID INT PRIMARY KEY,
    NOMBRE VARCHAR(25),
    APELLIDO VARCHAR(25),
    CUIT CHAR(16),
    DIRECCION VARCHAR(50),
    COMENTARIOS VARCHAR(50)
 );


CREATE TABLE CLIENTES(
Codigo INT PRIMARY KEY, 
Nombre VARCHAR(25),
CUIT char(16),
Direccion varchar(50),
Comentarios varchar(50));

/*

6. Mostrar un listado de todas las bases de
datos alojadas en el servidor.

*/

Show databases;

/*

7. Mostrar un listado de todas las tablas
generadas anteriormente dentro de la base
de datos con el nombre LABORATORIO.

*/

show tables;

/*

8. Comentar la instrucción que lista las tablas
contenidas dentro de la base de datos
LABORATORIO.

*/

/*
show tables;
*/

/*

9. Describir la estructura de la tabla CLIENTES.
-

*/


describe CLIENTES;

-- Etapa 1.2: Modificar Estructuras

/*
1 Modificar la tabla FACTURAS tomando en
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ClienteID
por IDCliente, manteniendo su tipo de dato
y restricciones ya definidas.
b. Cambiar el nombre del campo ArticuloID
por IDArticulo, manteniendo su tipo de
dato y restricciones ya definidas.
c. Asignar la restricción UNSIGNED al campo
Monto, manteniendo el tipo de dato ya
definido para el campo.
*/

alter table FACTURAS
CHANGE ClienteID IDCliente int,
change ArticuloID IDarticulo int,
modify Monto Double unsigned;


/*
2. Modificar la tabla ARTICULOS tomando en
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ArticuloID
por IDArticulo, manteniendo su tipo de
dato y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre
para que admita hasta 75 caracteres.
c. Asignar las restricciones UNSIGNED y
NOT NULL al campo Precio, manteniendo
el tipo de dato ya definido para el campo.
d. Asignar las restricciones UNSIGNED y
NOT NULL al campo Stock, manteniendo
el tipo de dato ya definido para el campo.
*/

alter table ARTÍCULOS
CHANGE ArticuloID IDArticulo int,
modify Nombre varchar(75),
modify Precio Double unsigned NOT NULL,
modify Stock int unsigned NOT NULL;

/*
3. Modificar la tabla CLIENTES. Tomar en
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ClienteID
por IDCliente, manteniendo su tipo de dato
y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre
para que admita hasta 30 caracteres y
asigne la restricción correspondiente para
que su carga sea obligatoria.
c. Cambiar el tipo de dato del campo
Apellido para que admita hasta 35
caracteres y asigne la restricción
correspondiente para que su carga
sea obligatoria.
d. Cambiar el nombre del campo
Comentarios por Observaciones y su
tipo de dato para que admita hasta
255 caracteres.
*/
#as
alter table CLIENTES
CHANGE ClienteID IDCliente int,
modify Nombre varchar(30) NOT NULL,
modify Apellido varchar(35) NOT NULL,
change Comentarios Observaciones varchar(255);

/*
1.3 Hacer INSERT de datos a las TABLAS que creamos
*/

 INSERT INTO FACTURAS
 VALUES ('A', 28, 14, 335, '2021-03-18', 1589.50),
 ('A', 39, 26, 157, '2021-04-12', 979.75),
        ('B', 8, 17, 95, '2021-04-25', 513.35),
        ('B', 12, 5, 411, '2021-05-03', 2385.70),
        ('B', 19, 50, 157, '2021-05-26', 979.75);
        
        
INSERT INTO ARTÍCULOS
 VALUES (95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
 (157, 'Apple AirPods Pro', 979.75, 152),
        (335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
        (411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);

INSERT INTO CLIENTES
 VALUES (5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP'),
 (14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA'),
        (17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA'),
        (26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP'),
        (50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

SELECT * FROM ARTÍCULOS;
SELECT * FROM FACTURAS;
SELECT * FROM CLIENTES;

-- Alias es un valor que le voy a asignar a la columna pero solamente para representar un dato

SELECT fecha, monto as importe, letra, número from facturas;
SELECT FECHA 'Fecha de venta', monto as importe, letra, número FROM FACTURAS;

-- como le calculo el iva?

SELECT fecha 'Fecha de IVA', monto as importe, monto * 1.21 'Monto + IVA', letra tipo, número FROM FACTURAS;
SELECT fecha 'Fecha de IVA', monto as importe, round(monto * 1.21, 2) 'Monto + IVA', letra tipo, número FROM FACTURAS;


