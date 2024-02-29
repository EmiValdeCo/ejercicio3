DROP DATABASE IF EXISTS db_universidad_edumangase;
CREATE DATABASE db_universidad_edumangase;

USE db_universidad_edumangase;

CREATE TABLE tb_profesores (
    id_profesor VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT(UUID()),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE
);

CREATE TABLE tb_materias (
    id_materia VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT(UUID()),
    nombre_materia VARCHAR(100) NOT NULL,
    grupo_materia INT NOT NULL,
    id_profesor VARCHAR(36) NOT NULL,
    cupos INT NOT NULL CHECK (cupos >= 0),
    FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor)
);

CREATE TABLE tb_alumnos (
    id_alumno VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT(UUID()),
    carnet_alumno VARCHAR(10) UNIQUE,
    nombre_alumno VARCHAR(50) NOT NULL,
    apellido_alumno VARCHAR(50) NOT NULL,
    edad_alumno INT NOT NULL
);

CREATE TABLE tb_inscripciones (
    id_inscripcion VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT(UUID()),
    id_alumno VARCHAR(36) NOT NULL,
    id_materia VARCHAR(36) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES tb_alumnos(id_alumno),
    FOREIGN KEY (id_materia) REFERENCES tb_materias(id_materia)
);

CREATE TABLE tb_calificaciones (
    id_calificacion VARCHAR(36) PRIMARY KEY NOT NULL DEFAULT(UUID()),
    id_inscripcion VARCHAR(36) NOT NULL,
    calificacion_final DECIMAL(5,2) NOT NULL CHECK (calificacion_final >= 0 AND calificacion_final <= 10),
    fecha_calificacion DATE NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES tb_inscripciones(id_inscripcion)
);

DELIMITER //
CREATE TRIGGER actualizacion_cupos 
AFTER INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
	UPDATE tb_materias
	SET cupos = cupos - 1
	WHERE id_materia = NEW.id_materia;
END
//
DELIMITER;  

DELIMITER //
CREATE PROCEDURE insert_de_datos_profesores(
    IN pr_nombre VARCHAR(100),
    IN pr_apellido VARCHAR(100),
    IN pr_correo_electronico VARCHAR(100)
)
BEGIN
    INSERT INTO tb_profesores(nombre, apellido, correo_electronico) 
    VALUES (pr_nombre, pr_apellido, pr_correo_electronico);
END //
DELIMITER ;


CALL insert_de_datos_profesores("Emiliano", "Jacobo", "Emiliano@gmail.com");
CALL insert_de_datos_profesores('Juan', 'González', 'juan.gonzalez@example.com');
CALL insert_de_datos_profesores('María', 'Rodríguez', 'maria.rodriguez@example.com');
CALL insert_de_datos_profesores('José', 'Martínez', 'jose.martinez@example.com');
CALL insert_de_datos_profesores('Ana', 'Hernández', 'ana.hernandez@example.com');
CALL insert_de_datos_profesores('Pedro', 'López', 'pedro.lopez@example.com');
CALL insert_de_datos_profesores('Laura', 'García', 'laura.garcia@example.com');
CALL insert_de_datos_profesores('Diego', 'Pérez', 'diego.perez@example.com');
CALL insert_de_datos_profesores('Sofía', 'Sánchez', 'sofia.sanchez@example.com');
CALL insert_de_datos_profesores('Carlos', 'Romero', 'carlos.romero@example.com');
CALL insert_de_datos_profesores('Elena', 'Díaz', 'elena.diaz@example.com');
CALL insert_de_datos_profesores('Luis', 'Muñoz', 'luis.munoz@example.com');
CALL insert_de_datos_profesores('Marta', 'Álvarez', 'marta.alvarez@example.com');
CALL insert_de_datos_profesores('Javier', 'Ruiz', 'javier.ruiz@example.com');
CALL insert_de_datos_profesores('Carmen', 'Torres', 'carmen.torres@example.com');

SELECT * FROM tb_profesores;

DELIMITER //
CREATE PROCEDURE insert_de_datos_alumnos(
    IN pr_carnet_alumno VARCHAR(10),
    IN pr_nombre_alumno VARCHAR(50),
    IN pr_apellido_alumno VARCHAR(50),
    IN pr_edad_alumno INT
)
BEGIN
    INSERT INTO tb_alumnos(carnet_alumno, nombre_alumno,apellido_alumno,edad_alumno) 
    VALUES (pr_carnet_alumno, pr_nombre_alumno, pr_apellido_alumno,pr_edad_alumno);
END //
DELIMITER ;

SELECT * FROM tb_alumnos;
CALL insert_de_datos_alumnos("GM1", "Emiliano", "Jacobo",11);
CALL insert_de_datos_alumnos("GM2", "María", "Rodríguez", 12);
CALL insert_de_datos_alumnos("GM3", "José", "Martínez", 13);
CALL insert_de_datos_alumnos("GM4", "Ana", "Hernández", 14);
CALL insert_de_datos_alumnos("GM5", "Pedro", "López", 15);
CALL insert_de_datos_alumnos("GM6", "Laura", "García", 16);
CALL insert_de_datos_alumnos("GM7", "Diego", "Pérez", 17);
CALL insert_de_datos_alumnos("GM8", "Sofía", "Sánchez", 18);
CALL insert_de_datos_alumnos("GM9", "Carlos", "Romero", 19);
CALL insert_de_datos_alumnos("GM10", "Elena", "Díaz", 20);
CALL insert_de_datos_alumnos("GM11", "Luis", "Muñoz", 21);
CALL insert_de_datos_alumnos("GM12", "Marta", "Álvarez", 22);
CALL insert_de_datos_alumnos("GM13", "Javier", "Ruiz", 23);
CALL insert_de_datos_alumnos("GM14", "Carmen", "Torres", 24);
CALL insert_de_datos_alumnos("GM15", "Monica", "Alas", 24);

DROP PROCEDURE insert_de_datos_materias;

DELIMITER //
CREATE PROCEDURE insert_de_datos_materias(
    IN pr_nombre_materia VARCHAR(100),
    IN pr_grupo_materia INT,
    IN pr_cupos INT,
    IN pr_id_profesor VARCHAR(36)
    
)
BEGIN
    INSERT INTO tb_materias(nombre_materia,grupo_materia,cupos, id_profesor) 
    VALUES (pr_nombre_materia, pr_grupo_materia,pr_cupos,pr_id_profesor);
END //
DELIMITER ;

CALL insert_de_datos_materias('Matemáticas', 1, 30,'8e26d761-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Lenguaje', 1, 30,'9c6e8a2a-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Historia', 1, 30, '9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Ciencias Naturales', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Educación Física', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Inglés', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Geografía', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Artes', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Biología', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Física', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Química', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Literatura', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Economía', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Informática', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');
CALL insert_de_datos_materias('Filosofía', 1, 30,'9d8b6eb4-d65b-11ee-8a56-14d424856382');


DELIMITER //
CREATE PROCEDURE insert_de_datos_inscripciones(
    IN pr_id_alumno VARCHAR(36),
    IN pr_id_materia VARCHAR(36),
    IN pr_fecha_inscripcion DATE,
    IN pr_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    INSERT INTO tb_inscripciones(id_alumno, id_materia,fecha_inscripcion,estado) 
    VALUES (pr_id_alumno,pr_id_materia, pr_fecha_inscripcion, pr_estado);
END //
DELIMITER ;

SELECT * FROM tb_alumnos;
SELECT * FROM tb_materias;

CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');
CALL insert_de_datos_inscripciones('4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28', 'Activo');

DELIMITER //
CREATE PROCEDURE insert_de_datos_calificaciones(
    IN pr_id_inscripcion VARCHAR(36),
    IN pr_calificacion_final DECIMAL(5,2),
    IN pr_fecha_calificacion DATE
)
BEGIN
    INSERT INTO tb_calificaciones(id_inscripcion, calificacion_final, fecha_calificacion) 
    VALUES (pr_id_inscripcion,pr_calificacion_final, pr_fecha_calificacion);
END //
DELIMITER ;

SELECT * FROM tb_calificaciones; 

CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',5.5, '2024-01-15');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',8.2, '2024-02-20');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',9.5, '2024-03-10');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',6.0, '2024-04-05');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',8.0, '2024-05-12');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',7.5, '2024-06-25');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',8.7, '2024-07-08');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',7.2, '2024-08-18');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',9.0, '2024-09-29');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',7.8, '2024-10-03');
CALL insert_de_datos_calificaciones('04460800-d663-11ee-8a56-14d424856382',8.2, '2024-11-14');
CALL insert_de_datos_calificaciones('1ce51ca5-d6a2-11ee-8a56-14d424856382',7.5, '2024-12-20');
CALL insert_de_datos_calificaciones('a529e782-d663-11ee-8a56-14d424856382',9.7, '2025-01-05');
CALL insert_de_datos_calificaciones('a53512a4-d663-11ee-8a56-14d424856382',6.0, '2025-02-08');
CALL insert_de_datos_calificaciones('a537be42-d663-11ee-8a56-14d424856382',8.5, '2025-03-17');



