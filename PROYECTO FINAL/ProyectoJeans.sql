CREATE DATABASE JEANS;

USE JEANS;

CREATE TABLE JEANS
(
    ID_MARCA INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NOMBRE_MARCA VARCHAR(30) NOT NULL,
    NIT INT NOT NULL,
    DIRECCION VARCHAR(150) NOT NULL,
    TELEFONO INT NOT NULL
);

CREATE TABLE PERSONAL
(
    ID_PER INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CI VARCHAR(30) NOT NULL,
    NOM_EMP VARCHAR(50) NOT NULL,
    APE_EMP VARCHAR(50) NOT NULL,
    EDAD INT NOT NULL,
    SEXO VARCHAR(15) NOT NULL,
    DIRECCION VARCHAR(100) NOT NULL,
    TELEFONO INT NOT NULL,
    CARGO VARCHAR(100) NOT NULL,
    TIPO_USUARIO VARCHAR(20) NOT NULL,
    USUARIO VARCHAR(20) NOT NULL,
    CONTRASENA varchar(20),
    ID_MARCA INT NOT NULL,
    FOREIGN KEY (ID_MARCA) REFERENCES JEANS(ID_MARCA)
);

CREATE TABLE PROVEEDOR
(
    ID_PROV INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CI VARCHAR(20) NOT NULL,
    NOM_PROV VARCHAR(50) NOT NULL,
    APE_PROV VARCHAR(50) NOT NULL,
    LABORATORIO VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(150) NOT NULL,
    EDAD INT NOT NULL,
    SEXO VARCHAR(15) NOT NULL,
    TELEFONO INT NOT NULL,
    ID_MARCA INT NOT NULL,
    FOREIGN KEY (ID_MARCA) REFERENCES JEANS(ID_MARCA)
);

CREATE TABLE CLIENTE
(
    ID_CLI INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOM_CLI VARCHAR(50) NOT NULL,
    APE_CLI VARCHAR(50) NOT NULL,
    NIT_O_CI INT NOT NULL,-- NIT O CI
    ID_PER INT NOT NULL,
    ID_MARCA INT NOT NULL,
    FOREIGN KEY (ID_PER) REFERENCES PERSONAL(ID_PER),
    FOREIGN KEY (ID_MARCA) REFERENCES JEANS(ID_MARCA)
);

CREATE TABLE ESTANTERIA
(
    ID_ESTANTERIA INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    ESTANTERIA CHAR (2) NOT NULL
);

CREATE TABLE ESPECIFICACION
(
    ID_ESP INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MODELO VARCHAR(100) NOT NULL,
    TALLA INT NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO_VENTA FLOAT NOT NULL,
    PRECIO_VENTA_MAYOR FLOAT NOT NULL,
    ID_ESTANTERIA INT NOT NULL,
    FOREIGN KEY (ID_ESTANTERIA) REFERENCES ESTANTERIA(ID_ESTANTERIA)
);

CREATE TABLE INVENTARIO
(
    ID_INVENTARIO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_ESP INT NOT NULL,
    MODELO VARCHAR(100) NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO_VENTA FLOAT NOT NULL,
    PRECIO_COMPRA_CONTADO FLOAT NOT NULL,
    PRECIO_COMPRA_CREDITO FLOAT NOT NULL,
    FOREIGN KEY(ID_ESP) REFERENCES ESPECIFICACION(ID_ESP)
);

CREATE TABLE REGISTRO_EMPLEADO
(
    ID_REGISTRO_EMPLEADO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_PER INT NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(50) NOT NULL,
    HORARIO_ENTRADA TIME NOT NULL,
    HORARIO_SALIDA TIME NOT NULL,
    CARGO VARCHAR(100) NOT NULL,
    UBICACION_EMPLEADO VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_PER) REFERENCES PERSONAL(ID_PER)
);

CREATE TABLE FACTURA
(
    ID_FACTURA INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    FECHA DATETIME NOT NULL,
    NOMRE_COMPRADOR VARCHAR(100) NOT NULL,
    NIT_CI INT NOT NULL,
    ID_ESP INT NOT NULL,
    MODELO VARCHAR(100) NOT NULL,
    TALLA VARCHAR(100) NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO_UNITARIO FLOAT NOT NULL,
    PRECIO_MAYOR FLOAT NOT NULL,
    IMPORTE FLOAT NOT NULL,
    TOTAL_FINAL FLOAT NOT NULL,
    EFECTIVO FLOAT NOT NULL,
    CAMBIO FLOAT NOT NULL,
    IMPORTE_LITERAL VARCHAR (200) NOT NULL,
    ID_PER INT NOT NULL,
    NOMBRE_CAJERO VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_PER) REFERENCES PERSONAL(ID_PER),
    FOREIGN KEY (ID_ESP) REFERENCES ESPECIFICACION(ID_ESP)
);

CREATE TABLE VENTAS
(
    ID_VENTA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_FACTURA INT NOT NULL,
    ID_ESP INT NOT NULL,
    ID_PER INT NOT NULL,
    CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_ESP) REFERENCES ESPECIFICACION(ID_ESP),
    FOREIGN KEY (ID_PER) REFERENCES PERSONAL(ID_PER),
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA(ID_FACTURA)
);

INSERT INTO JEANS(NOMBRE_MARCA, NIT, DIRECCION, TELEFONO)
VALUES ('PRINCESA MICHI Y TIN XD',1223567175,'Bolivia - La Paz - Villa Adela - Avenida Larecaja #123',60781575 );

INSERT INTO PERSONAL (CI, NOM_EMP, APE_EMP, EDAD, SEXO, DIRECCION, TELEFONO, CARGO, TIPO_USUARIO, USUARIO, ID_MARCA)
VALUES  ('9258125 LP', 'Fabiva', 'Ramos', 19, 'Femenino', 'Calle L de la Vega', 65488745, 'Gerente', 'Administrador', 'Fabi75',1),
        ('9235542 LP', 'Victor', 'Ortega', 20, 'Masculino', 'Villa Dolores', 77224834, 'Encargado de Almacen', 'Usuario', 'VictorO',1),
        ('9347852 LP', 'Mijael', 'Rojas', 19, 'Masculino', 'Bolivar C', 78923614, 'Vendedor', 'Usuario', 'Michi',1),
        ('7098562 LP', 'Nathalia', 'Quispe', 18, 'Femenino', 'Villa Fatima', 77583459, 'Vendedor', 'Usuario', 'NatLP',1),
        ('13405873 LP', 'Ana', 'Calderon', 19, 'Femenino', 'Rio Seco', 74123654, 'Vendedor', 'Usuario', 'Shideris5',1),
        ('10915839 LP', 'Martin', 'Mamani', 18, 'Maculino', 'Viacha', 78912781, 'Encargado de Inventario', 'Usuario', 'Tin4768',1),
        ('10394585 LP', 'Gisel', 'Huanca', 19, 'Femenino', '16 de Julio', 77208436, 'Recepcionista', 'Usuario', 'Giss12345',1),
        ('9258128 LP', 'Juan', 'Sanchez', 20, 'Masculino', 'Avenida Simon Bolivar', 70498753, 'Rectista', 'Usuario', 'Juan20',1),
        ('9235159 LP', 'Samuel', 'Valtazar', 21, 'Masculino', 'Villa Dolores', 77224159, 'Overloquista', 'Usuario', 'Samu21',1),
        ('9347753 LP', 'Diego', 'Roma', 19, 'Masculino', 'Rio Seco', 78923357, 'Atracado Final', 'Usuario', 'Diero19',1);

INSERT INTO PROVEEDOR (CI, NOM_PROV, APE_PROV, LABORATORIO, DIRECCION, EDAD, SEXO, TELEFONO, ID_MARCA)
VALUES ('9564879 SC', 'Alberto', 'Ramos', 'Tela Cruda', 'Santa Cruz de la Sierra, Tercer Anillo', 38, 'Masculino', 75218845,1),
       ('6998633 LP', 'Noemi', 'Gonzales', 'Lavado', 'Rio Seco, Extranca', 26, 'Femenino', 79622547,1),
       ('9862345 SC', 'Felix', 'Mamani', 'Tela Cruda', 'Santa Cruz, Primer Anillo', 53,'Masculino', 78523669,1),
       ('8966321 LP', 'Leonardo', 'Alvarez', 'Lavado', 'Villa Fatima', 41, 'Masculino', 77785222,1);

INSERT INTO CLIENTE (NOM_CLI, APE_CLI, NIT_O_CI, ID_PER, ID_MARCA)
VALUES ('David', 'Gonzalez', 8951452,1,1),
       ('Luisa', 'Ruiz', 74123250,2,1),
       ('Julio', 'Mamani', 4948506,3,1),
       ('Miguel', 'Lopez', 1489623,4,1),
       ('Javier', 'Ramirez', 70362,5,1),
       ('Tania', 'Alcon', 4369713,1,1),
       ('Anali', 'Perez', 1325475,6,1),
       ('Elizabeth', 'Ramirez', 495018,7,1),
       ('Marian', 'Chambi', 49536,8,1),
       ('Moises', 'Arias', 132563,9,1);

INSERT INTO ESTANTERIA (ESTANTERIA)
VALUES ('1A'),
       ('1B'),
       ('1C'),
       ('1D'),
        ('1E'),
       ('1F'),
       ('1G'),
       ('1H'),
       ('1I'),
       ('1J'),
       ('2A'),
       ('2B'),
        ('2C'),
       ('2D'),
       ('2E'),
       ('2F'),
       ('2G'),
       ('2H'),
       ('2I'),
       ('2J'),
        ('3A'),
       ('3B'),
       ('3C'),
       ('3D'),
       ('3E'),
       ('3F'),
       ('3G'),
       ('3H'),
       ('3I'),
        ('3J'),
        ('4A'),
        ('4B'),
       ('4C'),
       ('4D'),
       ('4E'),
       ('4F'),
       ('4G'),
       ('4H'),
       ('4I'),
        ('4J'),
       ('5A'),
       ('5B'),
       ('5C'),
       ('5D'),
       ('5E'),
       ('5F'),
       ('5G'),
       ('5H'),
       ('5I'),
        ('5J'),
       ('6A'),
       ('6B'),
       ('6C'),
       ('6D'),
       ('6E'),
       ('6F'),
       ('6G'),
       ('6H'),
       ('6I'),
        ('6J'),
        ('7A'),
       ('7B'),
       ('7C'),
       ('7D'),
       ('7E'),
       ('7F'),
       ('7G'),
       ('7H'),
       ('7I'),
        ('7J'),
        ('8A'),
       ('8B'),
       ('8C'),
       ('8D'),
       ('8E'),
       ('8F'),
       ('8H'),
       ('8I'),
        ('8J'),
       ('9A'),
       ('9B'),
       ('9C'),
       ('9D'),
       ('9E'),
       ('9F'),
       ('9G'),
       ('9H'),
       ('9I'),
       ('9J');

INSERT INTO ESPECIFICACION(MODELO, TALLA, CANTIDAD, PRECIO_VENTA, PRECIO_VENTA_MAYOR, ID_ESTANTERIA)
VALUES ('Recto o Clasico',34,80,130,120, 1),
       ('Recto o Clasico',36,90,130,120, 2),
       ('Recto o Clasico',38,90,130,120, 3),
       ('Recto o Clasico',40,90,130,120, 4),
       ('Recto o Clasico',42,90,130,120, 5),
       ('Recto o Clasico',44,90,130,120, 6),
       ('Recto o Clasico',46,90,130,120, 7),
       ('Recto Tiro Alto',48,80,145, 140, 8),
       ('Recto Tiro Alto',50,80,145, 140, 9),
       ('Recto Tiro Alto',52,80,145, 140, 10),
       ('Recto Tiro Alto',54,80,145, 140, 11),
       ('Recto Tiro Alto',56,80,145, 140, 12),
       ('Recto Tiro Medio Alto',34,100,140, 135 , 13),
       ('Recto Tiro Medio Alto',36,100,140, 135 , 14),
       ('Recto Tiro Medio Alto',38,100,140, 135 , 15),
       ('Recto Tiro Medio Alto',40,100,140, 135 , 16),
       ('Recto Tiro Medio Alto',42,100,140, 135 , 17),
       ('Recto Tiro Medio Alto',44,100,140, 135 , 18),
       ('Recto Tiro Medio Alto',46,100,140, 135 , 19),
       ('Recto Tiro Medio Alto',48,100,145, 140 , 20),
       ('Recto Tiro Medio Alto',50,100,145, 140 , 21),
       ('Recto Tiro Medio Alto',52,100,145, 140 , 22),
       ('Recto Tiro Medio Alto',54,100,145, 140 , 23),
       ('Recto Tiro Medio Alto',56,100,145, 140 , 24),
       ('Chupin Tiro Alto',34,90,130, 120 , 25),
       ('Chupin Tiro Alto',36,90,130, 120 , 26),
       ('Chupin Tiro Alto',38,90,130, 120 , 27),
       ('Chupin Tiro Alto',40,90,130, 120 , 28),
       ('Chupin Tiro Alto',42,90,130, 120 , 29),
       ('Chupin Tiro Alto',44,90,130, 120 , 30),
       ('Chupin Tiro Alto',46,90,130, 120 , 31),
       ('Chupin Tiro Alto',48,90,140, 130 , 32),
       ('Chupin Tiro Alto',50,90,140, 130 , 33),
       ('Chupin Tiro Alto',52,90,140, 130 , 34),
       ('Chupin Tiro Alto',54,90,140, 130 , 35),
       ('Chupin Tiro Alto',56,90,140, 130 , 36),
       ('Chupin Tiro Medio Alto',34,85,135 , 130 , 37),
       ('Chupin Tiro Medio Alto',36,85,135 , 130 , 38),
       ('Chupin Tiro Medio Alto',38,85,135 , 130 , 39),
       ('Chupin Tiro Medio Alto',40,85,135 , 130 , 40),
       ('Chupin Tiro Medio Alto',42,85,135 , 130 , 41),
       ('Chupin Tiro Medio Alto',44,85,135 , 130 , 42),
       ('Chupin Tiro Medio Alto',46,85,135 , 130 , 43),
       ('Chupin Tiro Medio Alto',48,80,140 , 135 , 44),
       ('Chupin Tiro Medio Alto',50,80,140 , 135 , 45),
       ('Chupin Tiro Medio Alto',52,80,140 , 135 , 46),
       ('Chupin Tiro Medio Alto',54,80,140 , 135 , 47),
       ('Chupin Tiro Medio Alto',56,80,140 , 135 , 48),
       ('Jogger',34,70,120 , 110 , 49),
       ('Jogger',36,70,120 , 110 , 50),
       ('Jogger',38,70,120 , 110 , 51),
       ('Jogger',40,70,120 , 110 , 52),
       ('Jogger',42,70,120 , 110 , 53),
       ('Jogger',44,70,120 , 110 , 54),
       ('Jogger',46,70,120 , 110 , 55),
       ('Jogger',48,70,125 , 115 , 56),
       ('Jogger',50,70,125 , 115 , 57),
       ('Jogger',52,70,125 , 115 , 58),
       ('Jogger',54,70,125 , 115 , 59),
       ('Jogger',56,70,125 , 115 , 60),
       ('Acampanado Tiro Medio Alto',34,85,145 , 140 , 61),
       ('Acampanado Tiro Medio Alto',36,85,145 , 140 , 62),
       ('Acampanado Tiro Medio Alto',38,85,145 , 140 , 63),
       ('Acampanado Tiro Medio Alto',40,85,145 , 140 , 64),
       ('Acampanado Tiro Medio Alto',42,85,145 , 140 , 65),
       ('Acampanado Tiro Medio Alto',44,85,145 , 140 , 66),
       ('Acampanado Tiro Medio Alto',46,85,145 , 140 , 67),
       ('Acampanado Tiro Medio Alto',48,85,150 , 145 , 68),
       ('Acampanado Tiro Medio Alto',50,85,150 , 145 , 69),
       ('Acampanado Tiro Medio Alto',52,85,150 , 145 , 70),
       ('Acampanado Tiro Medio Alto',54,85,150 , 145 , 71),
       ('Acampanado Tiro Medio Alto',56,85,150 , 145 , 72),
       ('Acampanado Tiro Alto',34,90,150 , 145 , 73),
       ('Acampanado Tiro Alto',36,90,150 , 145 , 74),
       ('Acampanado Tiro Alto',38,90,150 , 145 , 75),
       ('Acampanado Tiro Alto',40,90,150 , 145 , 76),
       ('Acampanado Tiro Alto',42,90,150 , 145 , 77),
       ('Acampanado Tiro Alto',44,90,150 , 145 , 78),
       ('Acampanado Tiro Alto',46,90,150 , 145 , 79),
       ('Acampanado Tiro Alto',48,90,155 , 150 , 80),
       ('Acampanado Tiro Alto',50,90,155 , 150 , 81),
       ('Acampanado Tiro Alto',52,90,155 , 150 , 82),
       ('Acampanado Tiro Alto',54,90,155 , 150 , 83),
       ('Acampanado Tiro Alto',56,90,155 , 150 , 84),
       ('Mom',36,70,140 , 130 , 85),
       ('Mom',38,70,140 , 130 , 86),
       ('Mom',40,70,140 , 130 , 87),
       ('Mom',42,70,140 , 130 , 88),
       ('Mom',44,70,140 , 130 , 89);

INSERT INTO INVENTARIO(ID_ESP, MODELO, CANTIDAD, PRECIO_VENTA, PRECIO_COMPRA_CONTADO,PRECIO_COMPRA_CREDITO)
VALUES (1,'RECTO O CLASICO',50,130,120,125),
       (2,'RECTO O CLASICO',50,130,120,125),
       (3,'RECTO O CLASICO',50,130,120,125),
       (4,'RECTO O CLASICO',50,130,120,125),
       (5,'RECTO O CLASICO',50,130,120,125),
       (6,'RECTO O CLASICO',50,130,120,125),
       (7,'RECTO O CLASICO',50,130,120,125),
       (13,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (14,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (15,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (16,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (17,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (18,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (19,'Recto Tiro Medio Alto',50,140, 135,138 ),
       (20,'Recto Tiro Medio Alto',50,145, 140,143 ),
       (21,'Recto Tiro Medio Alto',50,145, 140,143 ),
       (22,'Recto Tiro Medio Alto',50,145, 140,143 ),
       (23,'Recto Tiro Medio Alto',50,145, 140,143 ),
       (24,'Recto Tiro Medio Alto',50,145, 140,143),
       (25,'Chupin Tiro Alto',40,130, 120,125 ),
       (26,'Chupin Tiro Alto',40,130, 120,125 ),
       (27,'Chupin Tiro Alto',40,130, 120,125 ),
       (28,'Chupin Tiro Alto',40,130, 120,125 ),
       (29,'Chupin Tiro Alto',40,130, 120,125 ),
       (30,'Chupin Tiro Alto',40,130, 120,125 ),
       (31,'Chupin Tiro Alto',40,130, 120,125 ),
       (32,'Chupin Tiro Alto',40,140, 130,135 ),
       (33,'Chupin Tiro Alto',40,140, 130,135 ),
       (34,'Chupin Tiro Alto',40,140, 130,135 ),
       (35,'Chupin Tiro Alto',40,140, 130,135 ),
       (36,'Chupin Tiro Alto',40,140, 130,135 ),
       (61,'Acampanado Tiro Medio Alto',40,145 , 140 ,143),
       (62,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (63,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (64,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (65,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (66,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (67,'Acampanado Tiro Medio Alto',40,145 , 140,143 ),
       (68,'Acampanado Tiro Medio Alto',40,150 , 145,148 ),
       (69,'Acampanado Tiro Medio Alto',40,150 , 145,148 ),
       (70,'Acampanado Tiro Medio Alto',40,150 , 145,148 ),
       (71,'Acampanado Tiro Medio Alto',40,150 , 145,148 ),
       (72,'Acampanado Tiro Medio Alto',40,150 , 145,148 ),
       (73,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (74,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (75,'Acampanado Tiro Alto',50,150 , 145,148),
       (76,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (77,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (78,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (79,'Acampanado Tiro Alto',50,150 , 145,148 ),
       (80,'Acampanado Tiro Alto',50,155 , 150,153 ),
       (81,'Acampanado Tiro Alto',50,155 , 150,153 ),
       (82,'Acampanado Tiro Alto',50,155 , 150,153 ),
       (83,'Acampanado Tiro Alto',50,155 , 150,153 ),
       (84,'Acampanado Tiro Alto',50,155 , 150,153 );

INSERT INTO REGISTRO_EMPLEADO (ID_PER, NOMBRE, APELLIDOS, HORARIO_ENTRADA, HORARIO_SALIDA, CARGO, UBICACION_EMPLEADO)
VALUES (1, 'Fabiva', 'Ramos', '07:00:00', '20:00:00', 'Gerente', 'Oficina'),
       (2, 'Victor', 'Ortega', '07:30:00', '12:00:00', 'Encargado de Almacen', 'Almacen'),
       (3, 'Mijael', 'Rojas', '08:00:00', '16:00:00','Vendedor', 'Estantes'),
       (4, 'Nathalia', 'Quispe', '13:00:00', '20:00:00', 'Vendedor', 'Ventas'),
       (5, 'Ana', 'Calderon', '08:00:00', '20:00:00', 'Vendedor', 'Ventas'),
       (6, 'Martin', 'Mamani', '08:00:00', '13:00:00','Encargado de Invetario', 'Almacen'),
       (7, 'Gisel', 'Huanca', '07:30:00', '20:00:00','Recepcionista', 'Cajas');

INSERT INTO FACTURA(FECHA,NOMRE_COMPRADOR,NIT_CI,ID_ESP,MODELO,TALLA,CANTIDAD,PRECIO_UNITARIO,PRECIO_MAYOR,IMPORTE,TOTAL_FINAL,EFECTIVO,CAMBIO,IMPORTE_LITERAL,ID_PER,NOMBRE_CAJERO)
VALUES ('2021-11-13 10:12:45', 'SILVERIO RAMOS VERASTEGUI', 1239092, 1,'RECTO O CLASICO', 38, 2, 130, 120, 130, 260,260,0,'Docientos sesenta', 1,'Fabiva Ramos' ),
       ('2021-11-13 14:45:56', 'FREDDY ORTEGA MAMANI', 9861848, 2,'Acampanado Tiro Alto', 40, 1, 145, 140, 145, 145,145,0,'Ciento cuarenta y cinco', 2,'Victor Ortega' );

INSERT INTO VENTAS(ID_FACTURA, ID_ESP, ID_PER, CANTIDAD)
VALUES (1,3,1,2),
       (2,68,2,1);

select *
from personal;

create trigger contrasena
before insert on personal
    for each row
    begin
    declare nombre text default '';
    declare apellido text default '';
    set nombre = substr(new.NOM_EMP,1,2);
    set apellido = substr(new.APE_EMP,1,2);
    set new.CONTRASENA = concat(nombre,apellido,new.EDAD);
    set new.CONTRASENA = lower(new.CONTRASENA);
    end;

insert into personal (CI, NOM_EMP, APE_EMP, EDAD, SEXO, DIRECCION, TELEFONO, CARGO, TIPO_USUARIO, USUARIO, ID_MARCA)
values ('4594821 LP','Carlos','Quisbert',19,'Masculino','16 de Julio',79512468,'Vendedor','Usuario','Carlos46',1);
insert into personal (CI, NOM_EMP, APE_EMP, EDAD, SEXO, DIRECCION, TELEFONO, CARGO, TIPO_USUARIO, USUARIO, ID_MARCA)
values ('4594878 LP','Carlos','Quisbert',19,'Masculino','16 de Julio',79512468,'Vendedor','Usuario','Carlos46',1);

create view emp_hombres as
select per.NOM_EMP, per.APE_EMP, per.EDAD
from personal as per
where per.SEXO = 'Masculino';

create view emp_mujeres as
select per.NOM_EMP, per.APE_EMP, per.EDAD
from personal as per
where per.SEXO = 'Femenino';


select inv.PRECIO_VENTA
from inventario as inv
where inv.MODELO = 'RECTO O CLASICO';

select fac.NOMRE_COMPRADOR, fac.NIT_CI,fac.MODELO, fac.TALLA, fac.CANTIDAD, fac.PRECIO_UNITARIO, fac.IMPORTE, fac.TOTAL_FINAL, fac.EFECTIVO, fac.CAMBIO, fac.IMPORTE_LITERAL, fac.FECHA, fac.NOMBRE_CAJERO
from factura as fac
where fac.ID_FACTURA = 1;

create function precio_factura(id_fac int)
returns text
begin
    if id_fac <=2
    then
    return(
        select concat('Nombre: ',fac.NOMRE_COMPRADOR,', Modelo: ',fac.MODELO,', Talla: ',fac.TALLA,', Cantidad: ',fac.CANTIDAD,', Precio unitario: ',fac.PRECIO_UNITARIO,', Precio total: ',fac.TOTAL_FINAL)
        from factura as fac
        where fac.ID_FACTURA = id_fac);
    else
        return 'No esta en los parametros';
    end if;
end;

select precio_factura(2) as Datos_de_la_factura;

create  function especificaciones(id_estant int)
returns text
begin
    if id_estant <= 89
    then
        return(
        select concat('Modelo: ',esp.MODELO,', Talla: ', esp.TALLA,', Cantidad: ', esp.CANTIDAD,', Precio: ', esp.PRECIO_VENTA)
        from especificacion as esp
        where ID_ESTANTERIA = id_estant
        );
    else
        return 'No esta en los parametros';
    end if;
end;

select especificaciones(100) as Especificaiones_segun_el_id_de_estanteria;

select esp.MODELO, esp.TALLA, esp.CANTIDAD, esp.PRECIO_VENTA
from especificacion as esp
where ID_ESTANTERIA = 20;

create  function inventario(id_invent int)
returns text
    begin
        if id_invent <= 55
            then
            return(
            select concat('Modelo: ',inv.MODELO,', Cantidad: ',inv.CANTIDAD,', Precio de venta: ',inv.PRECIO_VENTA,', Precio de compra: ',inv.PRECIO_COMPRA_CONTADO,', Precio de compra a credito: ',inv.PRECIO_COMPRA_CREDITO)
            from inventario as inv
            where inv.ID_INVENTARIO = id_invent);
        else
            return 'No esta en los parametros';
        end if;
    end;

select inventario(20);

create function personal(id_pers int)
returns text
begin
    if id_pers <=11
        then
        return(
            select concat('Nombre: ',per.NOM_EMP,', Apellido: ',per.APE_EMP,', Edad: ',per.EDAD,', Sexo: ',per.SEXO,', Telefono: ',per.TELEFONO,', Cargo: ',per.CARGO,', Tipo de usuario: ',per.TIPO_USUARIO)
            from personal as per
            where ID_PER = 1
            );
        else
            return 'No esta en los parametros';
    end if;
end;

drop function personal;

select personal(15);

Create table guardar_datos(
    FECHA DATETIME NOT NULL,
    NOMRE_COMPRADOR VARCHAR(100) NOT NULL,
    NIT_CI INT NOT NULL,
    MODELO VARCHAR(100) NOT NULL,
    TALLA VARCHAR(100) NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO_UNITARIO FLOAT NOT NULL,
    PRECIO_MAYOR FLOAT NOT NULL,
    IMPORTE FLOAT NOT NULL,
    TOTAL_FINAL FLOAT NOT NULL,
    EFECTIVO FLOAT NOT NULL,
    CAMBIO FLOAT NOT NULL,
    IMPORTE_LITERAL VARCHAR (200) NOT NULL,
    ID_PER INT NOT NULL,
    NOMBRE_CAJERO VARCHAR(100) NOT NULL
);

create or replace trigger guardado
    before insert on factura
    for each row
    begin
        insert into guardar_datos (FECHA, NOMRE_COMPRADOR, NIT_CI, MODELO, TALLA, CANTIDAD, PRECIO_UNITARIO, PRECIO_MAYOR, IMPORTE, TOTAL_FINAL, EFECTIVO, CAMBIO, IMPORTE_LITERAL,ID_PER, NOMBRE_CAJERO)
        values (new.FECHA, new.NOMRE_COMPRADOR, new.NIT_CI, new.MODELO, new.TALLA, new.CANTIDAD, new.PRECIO_UNITARIO, new.PRECIO_MAYOR, new.IMPORTE, new.TOTAL_FINAL, new.EFECTIVO, new.CAMBIO, new.IMPORTE_LITERAL,new.ID_PER, new.NOMBRE_CAJERO);
    end;

INSERT INTO FACTURA(FECHA,NOMRE_COMPRADOR,NIT_CI,ID_ESP,MODELO,TALLA,CANTIDAD,PRECIO_UNITARIO,PRECIO_MAYOR,IMPORTE,TOTAL_FINAL,EFECTIVO,CAMBIO,IMPORTE_LITERAL,ID_PER, NOMBRE_CAJERO)
VALUES ('2021-11-13 10:12:45', 'SILVIO RAMOS VERASTEGUI', 1239092, 1,'RECTO O CLASICO', 38, 2, 130, 120, 130, 260,260,0,'Docientos sesenta',1,'Fabiva Ramos' ),
       ('2021-11-13 14:45:56', 'FRY ORTEGA MAMANI', 9861848, 2,'Acampanado Tiro Alto', 40, 1, 145, 140, 145, 145,145,0,'Ciento cuarenta y cinco',2,'Victor Ortega' );


create view TALLAS AS
select esp.*
from especificacion as esp
where talla = 34;








































drop database JEANS;