CREATE SCHEMA minimarket;
USE minimarket; 

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



INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("Personal", 4, "normal");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("Carnico", 3, "congelado");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("despensa", 2, "normal");
INSERT INTO Categoria (nombreCat, pasillo, almacenaje)
VALUES ("perecible", 1, "frio");
 

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


SELECT * FROM Producto;
SELECT * FROM Categoria;
SELECT nombre, mesesDuracion FROM Producto WHERE categoria_id = 1; 
SELECT nombre, precioCompra FROM Producto; 

SELECT Producto.nombre, Producto.mesesDuracion, Categoria.nombreCat, Categoria.pasillo
FROM Producto JOIN Categoria ON Categoria.categoria_id = Producto.categoria_id; 
 