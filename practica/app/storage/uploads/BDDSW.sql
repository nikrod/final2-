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
