-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-12-2014 a las 17:22:17
-- Versión del servidor: 5.5.40-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `BDDSW`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administradores`
--

CREATE TABLE IF NOT EXISTS `Administradores` (
  `Rut_Adm` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Rut_Adm`),
  UNIQUE KEY `Rut_Adm_UNIQUE` (`Rut_Adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Administradores`
--

INSERT INTO `Administradores` (`Rut_Adm`, `Clave`, `Nombre`, `Apellido`, `created_at`, `updated_at`) VALUES
('14566', '3434', 'dgfhgh', 'fgfhjh', '2014-11-19', '2014-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administradores_has_Archivos`
--

CREATE TABLE IF NOT EXISTS `Administradores_has_Archivos` (
  `Administradores_Rut_Adm` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Archivos_Cod_Arch` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Administradores_Rut_Adm`,`Archivos_Cod_Arch`),
  KEY `fk_Administradores_has_Archivos_Archivos1_idx` (`Archivos_Cod_Arch`),
  KEY `fk_Administradores_has_Archivos_Administradores1_idx` (`Administradores_Rut_Adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumnos`
--

CREATE TABLE IF NOT EXISTS `Alumnos` (
  `Rut_Alum` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Carrera_Cod_Carrera` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Rut_Alum`),
  UNIQUE KEY `Rut_Alum_UNIQUE` (`Rut_Alum`),
  KEY `fk_Alumno_Carrera1_idx` (`Carrera_Cod_Carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Alumnos`
--

INSERT INTO `Alumnos` (`Rut_Alum`, `Clave`, `Nombre`, `Apellido`, `Carrera_Cod_Carrera`, `created_at`, `updated_at`) VALUES
('123123', 'asd', 'asd', 'asd', '2141', '2014-11-19', '2014-11-19'),
('3434', '344', 'dffgghg', 'dffhgh', '2141', '2014-11-19', '2014-11-19'),
('cdfg', 'gfgfg', 'fgfg', 'fgfg', '2141', '2014-11-19', '2014-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumnos_has_Asignaturas`
--

CREATE TABLE IF NOT EXISTS `Alumnos_has_Asignaturas` (
  `Alumnos_Rut_Alum` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Asignaturas_Cod_Asig` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Alumnos_Rut_Alum`,`Asignaturas_Cod_Asig`),
  KEY `fk_Alumnos_has_Asignaturas_Asignaturas1_idx` (`Asignaturas_Cod_Asig`),
  KEY `fk_Alumnos_has_Asignaturas_Alumnos1_idx` (`Alumnos_Rut_Alum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Archivos`
--

CREATE TABLE IF NOT EXISTS `Archivos` (
  `Cod_Arch` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Arch`),
  UNIQUE KEY `Archivo_UNIQUE` (`Cod_Arch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Archivos`
--

INSERT INTO `Archivos` (`Cod_Arch`, `Nombre`, `created_at`, `updated_at`) VALUES
('holi.jpg', 'foto', '2014-11-04', '2014-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asignaturas`
--

CREATE TABLE IF NOT EXISTS `Asignaturas` (
  `Cod_Asig` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Cod_Asig`),
  UNIQUE KEY `Cod_Asig_UNIQUE` (`Cod_Asig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Asignaturas`
--

INSERT INTO `Asignaturas` (`Cod_Asig`, `Nombre`, `created_at`, `updated_at`) VALUES
('info1', 'programacion', '2014-11-09', '2014-11-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carreras`
--

CREATE TABLE IF NOT EXISTS `Carreras` (
  `Cod_Carrera` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Cod_Carrera`),
  UNIQUE KEY `Cod_Carrera_UNIQUE` (`Cod_Carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Carreras`
--

INSERT INTO `Carreras` (`Cod_Carrera`, `Nombre`, `created_at`, `updated_at`) VALUES
('2141', 'hola', '2014-11-18', '2014-11-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamentos`
--

CREATE TABLE IF NOT EXISTS `Departamentos` (
  `Cod_Dpto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`Cod_Dpto`),
  UNIQUE KEY `Cod_Dpto_UNIQUE` (`Cod_Dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Departamentos`
--

INSERT INTO `Departamentos` (`Cod_Dpto`, `updated_at`, `created_at`) VALUES
('fisica', '2014-11-18', '2014-11-27'),
('informatica', '2014-11-17', '2014-11-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamentos_has_Asignaturas`
--

CREATE TABLE IF NOT EXISTS `Departamentos_has_Asignaturas` (
  `Departamentos_Cod_Dpto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Asignaturas_Cod_Asig` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Departamentos_Cod_Dpto`,`Asignaturas_Cod_Asig`),
  KEY `fk_Departamentos_has_Asignaturas_Asignaturas1_idx` (`Asignaturas_Cod_Asig`),
  KEY `fk_Departamentos_has_Asignaturas_Departamentos1_idx` (`Departamentos_Cod_Dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores`
--

CREATE TABLE IF NOT EXISTS `Profesores` (
  `Rut_Prof` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Departamento_Cod_Dpto` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Rut_Prof`),
  UNIQUE KEY `Rut_Prof_UNIQUE` (`Rut_Prof`),
  KEY `fk_Profesor_Departamento1_idx` (`Departamento_Cod_Dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores_has_Archivos`
--

CREATE TABLE IF NOT EXISTS `Profesores_has_Archivos` (
  `Profesores_Rut_Prof` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Archivos_Cod_Arch` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Profesores_Rut_Prof`,`Archivos_Cod_Arch`),
  KEY `fk_Profesores_has_Archivos_Archivos1_idx` (`Archivos_Cod_Arch`),
  KEY `fk_Profesores_has_Archivos_Profesores1_idx` (`Profesores_Rut_Prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores_has_Asignaturas`
--

CREATE TABLE IF NOT EXISTS `Profesores_has_Asignaturas` (
  `Profesores_Rut_Prof` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Asignaturas_Cod_Asig` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`Profesores_Rut_Prof`,`Asignaturas_Cod_Asig`),
  KEY `fk_Profesores_has_Asignaturas_Asignaturas1_idx` (`Asignaturas_Cod_Asig`),
  KEY `fk_Profesores_has_Asignaturas_Profesores1_idx` (`Profesores_Rut_Prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` int(8) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `update_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rut`, `nombre`, `created_at`, `update_at`) VALUES
(1, 18339805, '', '0000-00-00', '0000-00-00'),
(2, 18391612, '', '0000-00-00', '0000-00-00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
