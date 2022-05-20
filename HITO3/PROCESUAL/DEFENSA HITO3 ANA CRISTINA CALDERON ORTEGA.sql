create database universidad3;

use universidad3;

CREATE TABLE estudiantes
(
    id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    edad INTEGER,
    fono INTEGER,
    email VARCHAR(100),
    direccion VARCHAR(100),
    sexo VARCHAR(10)
);

CREATE TABLE materias
(
  id_mat INTEGER AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  nombre_mat VARCHAR(100),
  cod_mat VARCHAR(100)
);

CREATE TABLE inscripcion
(
  id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  semestre VARCHAR(20),
  gestion INTEGER,
  id_est INT NOT NULL,
  id_mat INT NOT NULL,
  FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
  FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');

INSERT INTO inscripcion ( semestre, gestion,id_est, id_mat) VALUES
('1er Semestre', 2018, 1, 1),
('2do Semestre', 2018, 1, 2),
('1er Semestre', 2019,2, 4),
('2do Semestre', 2019, 2, 3),
('2do Semestre', 2020, 3, 3),
('3er Semestre', 2020,3, 1),
('4to Semestre', 2021, 4, 4),
('5to Semestre', 2021, 5, 5);

create function seriefibonacci(limite integer)
returns text
begin
    declare x integer default 0;
    declare y integer default 1;
    declare z integer default 0;
    declare cont integer default 0;
    declare resultado text default ' ';
    while(cont<limite) do
        set resultado=concat(resultado, z, ', ');
        set x=y;
        set y=z;
        set z=x+y;
        set cont=cont+1;
        end while;
    return resultado;
end;

select seriefibonacci(7);

set @userAll= 'HOLA';

create function example1()
returns text
    begin
        return @userAll;
    end;

select example1();

create function minedad()
returns int
begin
    declare respuesta int default 0;
    set respuesta=
        (select MIN(est.edad)
        from estudiantes as est);
    return respuesta;
end;

select minedad();

create function paredadmin()
returns text
begin
    declare minedad int default minedad();
    declare respuesta text default '';
    declare x int default 0;
    if (minedad%2=0)
        then
        while x<=minedad do
            set respuesta=concat(respuesta,x,',');
            set x=x+2;
            end while;
        return respuesta;
    else
        while minedad>=x do
            set respuesta=concat(respuesta,minedad,',');
            set minedad=minedad-2;
            end while;
        return respuesta;
    end if;
end;

create  function Vocales(cadena text)
returns text
begin
    declare x int default 1;
    declare y text default '';
    declare z int default char_length(cadena);
    declare l char default '';
    declare A int default 0;
    declare E int default 0;
    declare I int default 0;
    declare O int default 0;
    declare U int default 0;
    while x <= z
        do
        set l= substring(cadena,x, 1);
            if l = 'a'
                then
                set
                    A = A + 1;
            else if l = 'e'
                then
                set
                    E = E + 1;
            else if l= 'i'
                then
                set
                    I = I + 1;
            else if l = 'o'
                then
                set
                    O = O + 1;
            else if l = 'u'
                then
                set
                    U = U + 1;
            end if;
            end if;
            end if;
            end if;
            end if;
        set x= x + 1;
        end while;
    set y = concat( 'a:', A,' ', 'e:', E, ' ', 'i:', I, ' ','o:', O,' ', 'u: ', U);
    return (y);
end;
select Vocales('Taller de base de datos') as VOCALES_SEPARABLES;

create function cliente (credit_number integer)
returns text
begin
    declare respuesta text default ' ';
    case
        when credit_number>50000 then set respuesta= 'PLATINIUM';
        when credit_number>=10000 and  credit_number<=50000 then set respuesta= 'GOLD';
        when credit_number<=10000 then set respuesta= 'SILVER';
    end case;
    return respuesta;
end;
select cliente(50001);

create  function LETTERS(cadena text)
returns text
begin
    declare x text default '';
    declare y int default char_length(cadena);
    declare z int default 1;
    declare l int default y;
    repeat
        if (y >= z)
        then
            set x = concat (substr(cadena, y, l-1),  ' , ',x);
            set y = y- 1;
        end if;
        until y <= 0
        end repeat;
    return(x);
end;
select LETTERS('dbaii');

drop function LETTERS;

SELECT SUBSTR('Ximena Condori Mar', 1,5);

create function comparestrings2(cad1 text, cad2 text, cad3 text)
returns text
begin
    if strcmp(cad1, cad2)=0
        then
        return 'Cadenas iguales';
    else if strcmp(cad1, cad3)=0
        then
        return 'Cadenas iguales';
    else if strcmp(cad2, cad3)=0
        then
        return 'Cadenas iguales';
    else
        return 'Cadenas distintas';
    end if;
    end if;
    end if;
end;
select comparestrings2('dba ii', 'DVA II', 'dba ii');

CREATE  FUNCTION manejodeloop3(x INT, y INT, nom varchar(20))
RETURNS TEXT
BEGIN
    DECLARE str TEXT DEFAULT '';
    loop_label : LOOP
        IF x > y
        THEN
            LEAVE loop_label;
        end if;
        SET str = CONCAT(str,nom, x, ' , ');
        SET x = x + 1;
        ITERATE loop_label;
    end loop;
    RETURN str;
end;
SELECT manejodeloop3(1, 10, 'Serie de numeros: ');

drop function manejodeloop3;

SELECT SUBSTR('Ximena Condori Mar', 1,5);



create function posicion(cadena varchar(50), subcadena varchar(50))
returns INTEGER
begin
    declare position integer default 0;
    set position = locate(cadena, subcadena);
    return position;
end;
create function LONGITUD(cadena varchar(50))
returns text
begin
    declare countString varchar(20) default ' ';
    declare respuesta text default ' ';
    set countString=char_length(cadena);

    if (countString>7)
        then
        set respuesta= concat('Passed', ':',countString);
        else
        set respuesta= concat('Failed', ':',countString);
    end if;
    return respuesta;
end;
select posicion('II', 'BASE DE DATOS II');
