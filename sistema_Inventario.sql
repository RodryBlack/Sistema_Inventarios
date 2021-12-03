use bd_inventario

CREATE TABLE usuarios (

id INT(11) AUTO_INCREMENT NOT NULL ,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
email varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
`password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
PRIMARY KEY (id) USING BTREE
)

INSERT INTO usuarios VALUES (1, 'jose','zona ciudadela','admin@mail.com', '123');
INSERT INTO usuarios VALUES (2, 'Rodrigo','zona Vinto','admin@mail.com', '22');
INSERT INTO usuarios VALUES (3, 'Luis','zona achachicala','admin@mail.com', '12345');

SELECT * FROM usuarios;


CREATE TABLE proveedores (
id INT(11) AUTO_INCREMENT NOT NULL,
dni VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(50) NOT NULL,
web VARCHAR(128) NOT NULL,
PRIMARY KEY (id) USING BTREE
)

INSERT INTO proveedores VALUES (1,'erg34','Electrico el foco','El alto','456787','elfoco.com');
INSERT INTO proveedores VALUES (2,'gt44','Chinabrands','Santa Cruz','876543','brands.com');
INSERT INTO proveedores VALUES (3,'343rdg','sinoTools','La Paz','9887664','tools.com');
INSERT INTO proveedores VALUES (4,'erf34','Felisa','El alto','76543','felisa.com');
INSERT INTO proveedores VALUES (5,'eryuj7','Electrico el foco','El alto','456787','elfoco.com');
INSERT INTO proveedores VALUES (6,'yjyu67','Electrico el foco','El alto','456787','elfoco.com');
INSERT INTO proveedores VALUES (7,'hygjyu8','Electrico el foco','El alto','456787','elfoco.com');
INSERT INTO proveedores VALUES (8,'yuj6','Electrico el foco','El alto','456787','elfoco.com');


SELECT * FROM proveedores;

use bd_inventario
SELECT p.*, p2.nombre AS proveedores  FROM  productos p
	LEFT JOIN proveedores p2 ON p.proveedor_id=p2.id


CREATE TABLE productos (

id INT(13) AUTO_INCREMENT  NOT NULL,
proveedor_id INT(11) NOT NULL,
nombre VARCHAR(50) NOT NULL,
unidades INT(30) NOT NULL,
precio FLOAT NOT NULL,
categoria VARCHAR(100) NOT NULL,
PRIMARY KEY (id) USING BTREE 
)

SELECT * FROM productos;

INSERT INTO productos VALUES (1,2,'alicates',36,30.2,'plomeria');
INSERT INTO productos VALUES (2,1,'extractores',40,4.2,'abrasivos');
INSERT INTO productos VALUES (3,4,'limas',20,9.4,'taller');
INSERT INTO productos VALUES (4,7,'cepillos',10,3.2,'construccion');	
INSERT INTO productos VALUES (5,8,'llaves',121,9.2,'tecnico');
INSERT INTO productos VALUES (6,1,'allen',90,6.5,'plomeria');
INSERT INTO productos VALUES (7,3,'plomadas',36,5.7,'plomeria');




