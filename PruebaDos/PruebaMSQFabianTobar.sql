
#PRIMERO SE CREA EL SCHEMA 
CREATE SCHEMA minimarket;

USE minimarket; 





#SE CREAN 4 TABLAS PRINCIPALES

CREATE TABLE Producto (
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
	mesesDuracion INTEGER,
	precioCompra DOUBLE
    ); 
    
CREATE TABLE Categoria (
	categoria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombreCat VARCHAR(25),
	pasillo INTEGER,
	almacenaje  VARCHAR(20)
    ); 
    
CREATE TABLE Proveedor (
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombreProv VARCHAR(25),
	correo VARCHAR(50),
	telefono  VARCHAR(20)
    ); 
    
CREATE TABLE Boleta (
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroBoleta VARCHAR(25),
	fecha DATE,
	total  DOUBLE
    ); 





#SE CREAN LAS RELACIONES Y TABLAS RELACIONALES

ALTER TABLE Producto ADD categoria_id INTEGER NOT NULL; 
ALTER TABLE Producto 
ADD FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id);

ALTER TABLE Producto ADD categoria_id INTEGER NOT NULL; 
ALTER TABLE Producto 
ADD FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id);


CREATE TABLE Boteta_producto (
	Boteta_producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
); 

ALTER TABLE Boteta_producto ADD boleta_id INTEGER NOT NULL; 
ALTER TABLE Boteta_producto ADD producto_id INTEGER NOT NULL; 

ALTER TABLE Boteta_producto 
ADD FOREIGN KEY (boleta_id) REFERENCES Boleta (boleta_id); 
ALTER TABLE Boteta_producto 
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id); 


CREATE TABLE Producto_proveedor (
	producto_proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
); 

ALTER TABLE Producto_proveedor ADD producto_id INTEGER NOT NULL; 
ALTER TABLE Producto_proveedor ADD proveedor_id INTEGER NOT NULL; 

ALTER TABLE Producto_proveedor 
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id); 
ALTER TABLE Producto_proveedor 
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id); 

CREATE TABLE Categoria_proveedor (
	Categoria_proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
);   

ALTER TABLE Categoria_proveedor ADD categoria_id INTEGER NOT NULL; 
ALTER TABLE Categoria_proveedor ADD proveedor_id INTEGER NOT NULL; 

ALTER TABLE Categoria_proveedor 
ADD FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id); 
ALTER TABLE Categoria_proveedor 
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id); 






#SE AGREGAN LOS DATOS A LAS TABLAS

#TABLA CATEGORIA
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("Personal", 4, "normal");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("Carnico", 3, "congelado");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("despensa", 2, "normal");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("perecible", 1, "frio");
 


#TABLA PRODUCTO
INSERT INTO Producto (nombre, mesesDuracion, precioCompra, categoria_id)
VALUES ("jabon", 24, "500", 1);
INSERT INTO Producto (nombre, mesesDuracion, precioCompra, categoria_id)
VALUES ("cocacola", 48, "300", 2);
INSERT INTO Producto (nombre, mesesDuracion, precioCompra, categoria_id)
VALUES ("pollo", 12, "700", 3);
INSERT INTO Producto (nombre, mesesDuracion, precioCompra, categoria_id)
VALUES ("yogurt", 12, "60", 4);
INSERT INTO Producto (nombre, mesesDuracion, precioCompra, categoria_id)
VALUES ("condones", 64, "200", 1);



#TABLA BOLETA
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2345, "2022-01-05", 25500);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2346, "2022-02-05", 98000);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2347, "2022-03-05", 109674);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2348, "2022-04-05", 89746);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2349, "2022-05-05", 298647);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2350, "2022-06-05", 300987);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2351, "2022-07-05", 459762);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2352, "2022-08-05", 489234);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2353, "2022-09-05", 456857);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2354, "2022-10-05", 307564);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2355, "2022-11-05", 1647294);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2356, "2022-12-05", 1648202);
INSERT INTO Boleta (numeroBoleta, fecha, total)
VALUES (2357, "2023-01-05", 894000);

 



#SE REALIZAN LAS VISUALIZACIONES

#VISUALIZAR TABLAS BOLETA, PRODUCTO Y CATEGORIA
SELECT * FROM Boleta;
SELECT * FROM Producto;
SELECT * FROM Categoria;



#CONSULTAS BASICAS

#DE LA TABLA PRODUCTO, SE MUESTRA EL NOMBRE Y MESES DE DURACIÓN PARA 
#LA CATEGORIA NÚMERO 1
SELECT nombre, mesesDuracion FROM Producto WHERE categoria_id = 1; 

#DE LA TABLA PRODUCTO SE MUESTRA EL NOMBRE Y EL PRECIO DE COMPRA
SELECT nombre, precioCompra FROM Producto; 


#CONSULTA CON USO DE JOIN 
SELECT Producto.nombre, Producto.mesesDuracion, Categoria.nombreCat, Categoria.pasillo
FROM Producto JOIN Categoria ON Categoria.categoria_id = Producto.categoria_id; 


#CONSULTA DE LA TOTALIDAD DE GANANCIA DE VENTAS DE UN AÑO 
#CONSTRUIDA A BASE DE LAS BOLETAS DE UN AÑO 
SELECT SUM(total) FROM Boleta WHERE fecha LIKE '2022%';  