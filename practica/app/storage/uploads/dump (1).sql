--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administradores; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE administradores (
    pk integer NOT NULL,
    rut integer NOT NULL,
    clave character varying(255) NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.administradores OWNER TO niko;

--
-- Name: administradores_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE administradores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administradores_pk_seq OWNER TO niko;

--
-- Name: administradores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE administradores_pk_seq OWNED BY administradores.pk;


--
-- Name: alumnos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE alumnos (
    pk bigint NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    rut integer NOT NULL,
    carrera_fk integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.alumnos OWNER TO niko;

--
-- Name: alumnos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE alumnos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumnos_pk_seq OWNER TO niko;

--
-- Name: alumnos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE alumnos_pk_seq OWNED BY alumnos.pk;


--
-- Name: archivos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE archivos (
    pk bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    ruta text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.archivos OWNER TO niko;

--
-- Name: archivos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE archivos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivos_pk_seq OWNER TO niko;

--
-- Name: archivos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE archivos_pk_seq OWNED BY archivos.pk;


--
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE asignaturas (
    pk bigint NOT NULL,
    codigo character varying(10) NOT NULL,
    nombre character varying(255) NOT NULL,
    departamento_fk integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.asignaturas OWNER TO niko;

--
-- Name: asignaturas_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE asignaturas_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignaturas_pk_seq OWNER TO niko;

--
-- Name: asignaturas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE asignaturas_pk_seq OWNED BY asignaturas.pk;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE carreras (
    pk integer NOT NULL,
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.carreras OWNER TO niko;

--
-- Name: carreras_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE carreras_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_pk_seq OWNER TO niko;

--
-- Name: carreras_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE carreras_pk_seq OWNED BY carreras.pk;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE cursos (
    pk bigint NOT NULL,
    asignatura_fk bigint NOT NULL,
    semestre integer NOT NULL,
    anio integer NOT NULL,
    seccion integer NOT NULL,
    profesor_fk integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cursos OWNER TO niko;

--
-- Name: cursos_asistidos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE cursos_asistidos (
    pk bigint NOT NULL,
    curso_fk bigint NOT NULL,
    alumno_fk bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cursos_asistidos OWNER TO niko;

--
-- Name: cursos_asistidos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE cursos_asistidos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_asistidos_pk_seq OWNER TO niko;

--
-- Name: cursos_asistidos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE cursos_asistidos_pk_seq OWNED BY cursos_asistidos.pk;


--
-- Name: cursos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE cursos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_pk_seq OWNER TO niko;

--
-- Name: cursos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE cursos_pk_seq OWNED BY cursos.pk;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE departamentos (
    pk integer NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.departamentos OWNER TO niko;

--
-- Name: departamentos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE departamentos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_pk_seq OWNER TO niko;

--
-- Name: departamentos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE departamentos_pk_seq OWNED BY departamentos.pk;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE profesores (
    pk integer NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    rut integer NOT NULL,
    departamento_fk integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.profesores OWNER TO niko;

--
-- Name: profesores_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE profesores_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesores_pk_seq OWNER TO niko;

--
-- Name: profesores_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE profesores_pk_seq OWNED BY profesores.pk;


--
-- Name: propietarios_archivos; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE propietarios_archivos (
    pk bigint NOT NULL,
    rut integer NOT NULL,
    archivo_fk bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.propietarios_archivos OWNER TO niko;

--
-- Name: propietarios_archivos_pk_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE propietarios_archivos_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propietarios_archivos_pk_seq OWNER TO niko;

--
-- Name: propietarios_archivos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE propietarios_archivos_pk_seq OWNED BY propietarios_archivos.pk;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: niko; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    rut integer NOT NULL,
    nombre character varying(40),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.usuarios OWNER TO niko;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: niko
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO niko;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niko
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY administradores ALTER COLUMN pk SET DEFAULT nextval('administradores_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY alumnos ALTER COLUMN pk SET DEFAULT nextval('alumnos_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY archivos ALTER COLUMN pk SET DEFAULT nextval('archivos_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY asignaturas ALTER COLUMN pk SET DEFAULT nextval('asignaturas_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY carreras ALTER COLUMN pk SET DEFAULT nextval('carreras_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos ALTER COLUMN pk SET DEFAULT nextval('cursos_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos_asistidos ALTER COLUMN pk SET DEFAULT nextval('cursos_asistidos_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY departamentos ALTER COLUMN pk SET DEFAULT nextval('departamentos_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY profesores ALTER COLUMN pk SET DEFAULT nextval('profesores_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY propietarios_archivos ALTER COLUMN pk SET DEFAULT nextval('propietarios_archivos_pk_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niko
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY administradores (pk, rut, clave, nombres, apellidos, created_at, updated_at) FROM stdin;
\.


--
-- Name: administradores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('administradores_pk_seq', 1, false);


--
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY alumnos (pk, nombres, apellidos, rut, carrera_fk, created_at, updated_at) FROM stdin;
\.


--
-- Name: alumnos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('alumnos_pk_seq', 1, false);


--
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY archivos (pk, nombre, ruta, created_at, updated_at) FROM stdin;
\.


--
-- Name: archivos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('archivos_pk_seq', 1, false);


--
-- Data for Name: asignaturas; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY asignaturas (pk, codigo, nombre, departamento_fk, created_at, updated_at) FROM stdin;
\.


--
-- Name: asignaturas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('asignaturas_pk_seq', 1, false);


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY carreras (pk, codigo, nombre, created_at, updated_at) FROM stdin;
\.


--
-- Name: carreras_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('carreras_pk_seq', 1, false);


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY cursos (pk, asignatura_fk, semestre, anio, seccion, profesor_fk, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cursos_asistidos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY cursos_asistidos (pk, curso_fk, alumno_fk, created_at, updated_at) FROM stdin;
\.


--
-- Name: cursos_asistidos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('cursos_asistidos_pk_seq', 1, false);


--
-- Name: cursos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('cursos_pk_seq', 1, false);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY departamentos (pk, nombre, created_at, updated_at) FROM stdin;
\.


--
-- Name: departamentos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('departamentos_pk_seq', 1, false);


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY profesores (pk, nombres, apellidos, rut, departamento_fk, created_at, updated_at) FROM stdin;
\.


--
-- Name: profesores_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('profesores_pk_seq', 1, false);


--
-- Data for Name: propietarios_archivos; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY propietarios_archivos (pk, rut, archivo_fk, created_at, updated_at) FROM stdin;
\.


--
-- Name: propietarios_archivos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('propietarios_archivos_pk_seq', 1, false);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: niko
--

COPY usuarios (id, rut, nombre, created_at, update_at) FROM stdin;
1	18391612		2014-12-04 17:10:59.657522	2014-12-04 17:10:59.657522
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niko
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, true);


--
-- Name: administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (pk);


--
-- Name: administradores_rut_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_rut_key UNIQUE (rut);


--
-- Name: alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (pk);


--
-- Name: alumnos_rut_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_rut_key UNIQUE (rut);


--
-- Name: archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY archivos
    ADD CONSTRAINT archivos_pkey PRIMARY KEY (pk);


--
-- Name: archivos_ruta_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY archivos
    ADD CONSTRAINT archivos_ruta_key UNIQUE (ruta);


--
-- Name: asignaturas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY asignaturas
    ADD CONSTRAINT asignaturas_codigo_key UNIQUE (codigo);


--
-- Name: asignaturas_codigo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY asignaturas
    ADD CONSTRAINT asignaturas_codigo_nombre_key UNIQUE (codigo, nombre);


--
-- Name: asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (pk);


--
-- Name: carreras_codigo_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY carreras
    ADD CONSTRAINT carreras_codigo_key UNIQUE (codigo);


--
-- Name: carreras_codigo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY carreras
    ADD CONSTRAINT carreras_codigo_nombre_key UNIQUE (codigo, nombre);


--
-- Name: carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (pk);


--
-- Name: cursos_asignatura_fk_semestre_anio_seccion_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_asignatura_fk_semestre_anio_seccion_key UNIQUE (asignatura_fk, semestre, anio, seccion);


--
-- Name: cursos_asistidos_curso_fk_alumno_fk_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY cursos_asistidos
    ADD CONSTRAINT cursos_asistidos_curso_fk_alumno_fk_key UNIQUE (curso_fk, alumno_fk);


--
-- Name: cursos_asistidos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY cursos_asistidos
    ADD CONSTRAINT cursos_asistidos_pkey PRIMARY KEY (pk);


--
-- Name: cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (pk);


--
-- Name: departamentos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_nombre_key UNIQUE (nombre);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (pk);


--
-- Name: profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (pk);


--
-- Name: profesores_rut_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY profesores
    ADD CONSTRAINT profesores_rut_key UNIQUE (rut);


--
-- Name: propietarios_archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY propietarios_archivos
    ADD CONSTRAINT propietarios_archivos_pkey PRIMARY KEY (pk);


--
-- Name: propietarios_archivos_rut_archivo_fk_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY propietarios_archivos
    ADD CONSTRAINT propietarios_archivos_rut_archivo_fk_key UNIQUE (rut, archivo_fk);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios_rut_key; Type: CONSTRAINT; Schema: public; Owner: niko; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_rut_key UNIQUE (rut);


--
-- Name: alumnos_carrera_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_carrera_fk_fkey FOREIGN KEY (carrera_fk) REFERENCES carreras(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: asignaturas_departamento_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY asignaturas
    ADD CONSTRAINT asignaturas_departamento_fk_fkey FOREIGN KEY (departamento_fk) REFERENCES departamentos(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cursos_asignatura_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_asignatura_fk_fkey FOREIGN KEY (asignatura_fk) REFERENCES asignaturas(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cursos_asistidos_alumno_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos_asistidos
    ADD CONSTRAINT cursos_asistidos_alumno_fk_fkey FOREIGN KEY (alumno_fk) REFERENCES alumnos(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cursos_asistidos_curso_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos_asistidos
    ADD CONSTRAINT cursos_asistidos_curso_fk_fkey FOREIGN KEY (curso_fk) REFERENCES cursos(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cursos_profesor_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_profesor_fk_fkey FOREIGN KEY (profesor_fk) REFERENCES profesores(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profesores_departamento_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY profesores
    ADD CONSTRAINT profesores_departamento_fk_fkey FOREIGN KEY (departamento_fk) REFERENCES departamentos(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: propietarios_archivos_archivo_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: niko
--

ALTER TABLE ONLY propietarios_archivos
    ADD CONSTRAINT propietarios_archivos_archivo_fk_fkey FOREIGN KEY (archivo_fk) REFERENCES archivos(pk) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

