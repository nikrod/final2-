BEGIN TRANSACTION;

DROP TABLE IF EXISTS administradores CASCADE;
CREATE TABLE administradores (
  pk serial NOT NULL,
  rut int NOT NULL, -- rut debería guardarse cómo número (el digito verificador, sólo es una validación)
  clave varchar(255) NOT NULL, -- la contraseña debe guardarse hasheada
  nombres varchar(255) NOT NULL,
  apellidos varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (rut),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS archivos CASCADE;
CREATE TABLE archivos (
  pk bigserial NOT NULL,
  nombre varchar(255) NOT NULL, -- nombre que se desplegará
  ruta text NOT NULL, -- ruta física en el sistema de archivos.
  asignaturas_fk bigint NOT NULL REFERENCES asignaturas(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (ruta),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS departamentos CASCADE;
CREATE TABLE departamentos (
  pk serial NOT NULL,
  -- creo que la falta la facultad.
  nombre varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (nombre),
  PRIMARY KEY (pk)
);
INSERT INTO departamentos VALUES (1,'INFORMATICA', '2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');


DROP TABLE IF EXISTS carreras CASCADE;
CREATE TABLE carreras (
  pk serial NOT NULL,
  codigo int NOT NULL,
  nombre varchar(255) NOT NULL,
  -- creo que le falta la escuela
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (codigo),
  UNIQUE (codigo, nombre),
  PRIMARY KEY (pk)
);

INSERT INTO carreras VALUES (1,2141, 'ICCI', '2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');


DROP TABLE IF EXISTS alumnos CASCADE;
CREATE TABLE alumnos (
  pk bigserial NOT NULL,
  nombres varchar(255) NOT NULL,
  apellidos varchar(255) NOT NULL,
  rut int NOT NULL,
  carrera_fk int NOT NULL REFERENCES carreras(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  -- creo que le falta la fecha de nacimiento, email
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (rut),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS asignaturas CASCADE;
CREATE TABLE asignaturas (
  pk bigserial NOT NULL,
  codigo varchar(10) NOT NULL, -- codigo del ramo INF-635
  nombre varchar(255) NOT NULL, -- nombre del ramo
  departamento_fk int NOT NULL REFERENCES departamentos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (codigo),
  UNIQUE (codigo, nombre),
  PRIMARY KEY (pk)
);
INSERT INTO asignaturas VALUES (1,'1', 'INTRODUCCIÓN A LA INGENIERÍA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (2,'2', 'TÉCNICAS DE LA COMUNICACIÓN ORAL Y ESCRITA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (3,'3', 'QUÍMICA GENERAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (4,'4', 'CÁLCULO I', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (5,'5', 'ÁLGEBRA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (6,'6', 'FÍSICA MECÁNICA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (7,'7', 'DIBUJO DE INGENIERÍA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (8,'8', 'CIENCIAS DE LA COMPUTACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (9,'9', 'CÁLCULO II', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (10,'10', 'ÁLGEBRA LINEAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (11,'11', 'ELECTROMAGNETISMO', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (12,'12', 'LABORATORIO DE ELECTROMAGNETISMO', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (13,'13', 'CÁLCULO EN VARIAS VARIABLES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (14,'14', 'ECUACIONES DIFERENCIALES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (15,'15', 'LENGUAJES DE EXPRESIONES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (16,'16', 'PROGRAMACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (17,'17', 'INGLÉS TÉCNICO I', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (18,'18', 'ÓPTICA Y ONDAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (19,'19', 'LABORATORIO DE ÓPTICA Y ONDAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (20,'20', 'CÁLCULO VECTORIAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (21,'21', 'ESTADÍSTICA Y PROBABILIDAD', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (22,'22', 'MÉTODOS NUMÉRICOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (23,'23', 'ESTRUCTURAS DE DATOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (24,'24', 'INGLÉS TÉCNICO II', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (25,'25', 'FÍSICA MODERNA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (26,'26', 'LABORATORIO DE FÍSICA MODERNA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (27,'27', 'MECÁNICA RACIONAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (28,'28', 'INFERENCIA ESTADÍSTICA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (29,'29', 'ELECTRICIDAD Y ELECTRÓNICA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (30,'30', 'LENGUAJES DE PROGRAMACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (31,'31', 'SISTEMAS DE ADMINISTRACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (32,'32', 'INGENIERÍA DE SISTEMAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (33,'33', 'ESTRUCTURAS DISCRETAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (34,'34', 'TECNOLOGÍA DE EQUIPOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (35,'35', 'BASES DE DATOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (36,'36', 'SISTEMAS ECONÓMICOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (37,'37', 'INVESTIGACIÓN DE OPERACIONES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (38,'38', 'TEORÍA DE AUTÓMATAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (39,'39', 'ORGANIZACIÓN DE COMPUTADORES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (40,'40', 'SISTEMAS DE INFORMACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (41,'41', 'ÉTICA PROFESIONAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (42,'42', 'EVALUACIÓN DE PROYECTOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (43,'43', 'SIMULACIÓN DE SISTEMAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (44,'44', 'ARQUITECTURA DE COMPUTADORES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (45,'45', 'SISTEMAS OPERATIVOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (46,'46', 'INGENIERÍA DE SOFTWARE', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (47,'47', 'GESTIÓN MEDIO AMBIENTAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (48,'48', 'DESEMPEÑO DE SISTEMAS COMPUTACIONALES', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (49,'49', 'ANÁLISIS DE ALGORITMOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (50,'50', 'COMUNICACIÓN DE DATOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (51,'51', 'TALLER DE SISTEMAS DE INFORMACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (52,'52', 'GESTIÓN DE PERSONAL INFORMÁTICO', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (53,'53', 'GESTIÓN INFORMÁTICA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (54,'54', 'OPTIMIZACIÓN DE SISTEMAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (55,'55', 'COMPUTACIÓN PARALELA', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (56,'56', 'AUDITORÍA DE SISTEMAS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (57,'57', 'GESTIÓN FINANCIERA DE TI', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (58,'58', 'GESTIÓN DE PROYECTOS INFORMÁTICOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (59,'59', 'INFORMÁTICA INDUSTRIAL', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (60,'60', 'SISTEMAS DISTRIBUIDOS', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');
INSERT INTO asignaturas VALUES (61,'61', 'SISTEMAS INTEGRADOS DE INFORMACIÓN', '1','2014-12-06 18:12:39.102021', '2014-12-06 18:12:39.102021');


DROP TABLE IF EXISTS profesores CASCADE;
CREATE TABLE profesores (
  pk serial NOT NULL,
  nombres varchar(255) NOT NULL,
  apellidos varchar(255) NOT NULL,
  rut int NOT NULL,
  departamento_fk int NOT NULL REFERENCES departamentos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  -- creo que le falta la fecha de nacimiento, email
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (rut),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS propietarios_archivos CASCADE;
CREATE TABLE propietarios_archivos (
  pk bigserial NOT NULL,
  rut int NOT NULL,
  archivo_fk bigint NOT NULL REFERENCES archivos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (rut, archivo_fk),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS cursos CASCADE;
CREATE TABLE cursos (
  pk bigserial NOT NULL,
  asignatura_fk bigint NOT NULL REFERENCES asignaturas(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  semestre int NOT NULL,
  anio int NOT NULL,
  seccion int NOT NULL,
  profesor_fk int NOT NULL REFERENCES profesores(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (asignatura_fk, semestre, anio, seccion),
  PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS cursos_asistidos CASCADE;
CREATE TABLE cursos_asistidos (
  pk bigserial NOT NULL,
  curso_fk bigint NOT NULL REFERENCES cursos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  alumno_fk bigint NOT NULL REFERENCES alumnos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  updated_at timestamp NOT NULL DEFAULT NOW(), -- creo quedebería usar fecha y hora
  UNIQUE (curso_fk, alumno_fk),
  PRIMARY KEY (pk)
);

DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios (
  id serial NOT NULL,
  rut int NOT NULL,
  nombre varchar(40) NOT NULL,
  created_at timestamp NOT NULL DEFAULT NOW(),
  update_at timestamp NOT NULL DEFAULT NOW(),
  UNIQUE (rut),
  PRIMARY KEY (id)
);


COMMIT;
