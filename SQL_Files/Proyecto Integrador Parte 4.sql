-- Consultas y Sub-Consultas: que son y como se utilizan

select * from clientes_neptuno;
select * from pedidos_neptuno;

-- Quiero saber de los clientes quienes realizaron pedidos ¿ como lo resuelvo?

select * from clientes_neptuno where nombrecompania not in(select nombrecompania from pedidos_neptuno);

-- Operaciones en conjunto: que son? son operaciones que permiten trabajar con todo tipo de operadores
-- de conjunto (union- solo soportado por MySQL)
-- union se va a utilizar muy poco, ya que no es universal, por lo tanto se utilizara mas join
-- (intersect, except - otros motores) ¿que se pueden unir? tablas
-- se deben cumplir las siguientes condiciones (las consultas tienen que tener la misma estructura)

select * from pedidos
union
select * from pedidos_neptuno;

-- Consultas de tablas relacionadas
/* Sirve para verificar la existencia de valores de una tabla en otra en lugar de hacer una sub-consulta,
me permite traer informacion relacionada de las 2 tablas*/

select * from artículos;
insert into artículos values(100, 'CPU i5', 25000, 100, 'EEUU'); -- codigo, articulo, precio, stock y origen

select * from facturas where articuloid in (select articuloid from artículos);

-- solo te va a traer consultas de la consulta principal, no de la sub-consulta
select nombre from facturas where articuloid in (select articuloid from artículos);

-- como solucionar este problema, con JOIN. Debo utilizarlo para relacionar tablas, no es unir sino combinar tablas

select * from facturas join artículos on facturas.ArticuloID = artículos.IDArticulo;

-- Join a secas = inner join (el uso es opcional, es el mismo tipo de Join). 
-- (el Join devuelve todos los registros que cumplen con la condicion "on")
-- Tabla Izquierda
-- tabla derecha
-- en un Inner Join no importal cual es la izquierda o derecha, los resultados no cambian

-- vamos a insertar algo que esta mal

select * from facturas;

insert into facturas values ('A', 100, 20, 200, curdate(), 1600);


-- quiero conocer todas las facturas con el dato del producto
-- voy a tener que traer un modificador de Join llamado left

select letra, numero, idcliente, f.idarticulo, nombre, fecha, monto from artículos a left
join facturas g on f.articuloid = a.idarticulo;

select letra, número, clienteid, f.idarticulo, nombre, fecha, monto from facturas f
left join artículos a on f.idarticulo = a.idarticulo;

-- que ocurre si quiero que traiga todo?

select * from facturas f left join artículos a on f.IDArticulo = a.IDArticulo;

-- con un right funciona exactamente al reves del left

select letra, número, f.idarticulo, nombre from facturas f left join artículos a on f.IDArticulo = a.IDArticulo;

select letra, número, f.idarticulo, nombre from facturas f right join artículos a on f.IDArticulo = a.IDArticulo;

-- IR (Integridad Referencial)

create table alumnos(
id int primary key,
nombre varchar(50) not null,
carrera int not null);

insert into alumnos values (
1, 'Juan', 1);
insert into alumnos values (
2, 'Mariano', 1), (3, 'Pedro', 2),
(4, 'Gabriela', 2), (5, 'Esteban', 3);

create table carreras(
id int primary key,
nombre varchar(50) not null);

insert into carreras values 
(1, 'Desarrollo'), 
(2, 'Diseño'),
(3, 'Psicologia'),
(4, 'Arquitectura');


select * from carreras;
select * from alumnos;

select * from alumnos a join carreras c on a.carrera = c.id;

insert into alumnos values
(6, 'Sofia', 10);

select * from alumnos a left join carreras c on a.carrera = c.id
union
select * from alumnos a right join carreras c on a.carrera = c.id;

-- claves externas = claves foraneas = foreign key
-- tabla padre = parent
-- tabla hija = child
/* clave foranea (apunta/ referencia desde la tabla hija a la tabla padre (PK obligatoria)
evita datos huerfanos*/

set sqt_safe_update = 0;

alter table alumnos add foreign key(carrera) references carreras(id) on update cascade on delete cascade;

insert into alumnos values (6, 'Sofia', 10);
insert into carreras values (10, 'Marketing');

-- Documentacion
/* Tengo que hacer un DR (Diagrama Relacional) ¿que es?
es un dibujo de como se relacionan las tablas entre si,
para poder hacerlo se deben seguir los siguientes pasos*/

/* - Databases
- Reverse engineer
- Al tener la coneccion solo debo hacer click en Next
- Debo seleccionar la BBDD que quiero documentar
- Siguiente 
- Ver los objetos (incluir el tilde de abajo para que importe todos los objetos en el
 diagrama)
 - Execute
 - Next
 - Finish
 
