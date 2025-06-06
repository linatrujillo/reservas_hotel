-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 07-06-2025 a las 00:06:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--
-- Creación: 30-05-2025 a las 01:18:07
-- Última actualización: 06-06-2025 a las 21:34:54
--

CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL,
  `numero_habitacion` varchar(10) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `capacidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_habitacion`, `numero_habitacion`, `tipo`, `descripcion`, `capacidad`, `precio`, `disponible`) VALUES
(1, '100', 'doble', 'consta de 2 camas dobles ,1 ba?o', 4, 120000.00, 1),
(2, '101', 'doble', 'consta de 2 camas dobles ,1 ba?o', 4, 120000.00, 0),
(3, '102', 'sencilla', 'cama sencilla ', 2, 60.00, 1),
(4, '104', 'sencilla', 'cama sencilla ', 2, 60.00, 1),
(5, '107', 'suite', 'cama doble ', 2, 200000.00, 1),
(6, '108', 'sencilla', 'gg', 2, 60.00, 1),
(7, '205', 'suite', 'siute', 4, 300.00, 1),
(8, '205', 'suite', 'siute', 4, 300.00, 1),
(9, '250', 'suite', 'cuenta con vista al mar ba&#241;os privados, tv, nevera, lujos', 4, 500000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--
-- Creación: 31-05-2025 a las 03:50:20
-- Última actualización: 06-06-2025 a las 21:45:08
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_habitacion` int(5) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `metodo_pago` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_user`, `id_habitacion`, `fecha_inicio`, `fecha_fin`, `metodo_pago`) VALUES
(11, 1, 3, '0000-00-00', '0000-00-00', 'efectivo'),
(12, 4, 3, '2025-06-04', '2025-06-07', 'efectivo'),
(13, 4, 3, '2025-06-08', '2025-06-09', 'efectivo'),
(16, 7, 9, '2025-06-07', '2025-06-13', 'TARJETA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 30-05-2025 a las 01:09:05
-- Última actualización: 06-06-2025 a las 21:27:12
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `ciudad_origen` varchar(40) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `cedula`, `nombre`, `apellido`, `email`, `celular`, `ciudad_origen`, `fecha_nacimiento`) VALUES
(1, '1077855681', 'lina', 'garcia', 'linamarcela0217@hotmail.com', '3124989745', 'garzon', '2005-02-08'),
(3, '1077846088', 'alfonso', 'rojas', 'linamarcelatrujillo2020@gmail.com', '3124989745', 'pital', '1999-07-07'),
(4, '1077855689', 'daniel', 'trujillo', 'linamarcela0217@hotmail.com', '3124989745', 'neiva', '2007-07-17'),
(5, '55069928', 'lucia', 'coorea', 'luci@gmail.com', '321564874', 'bogota', '1987-02-28'),
(6, '55058488', 'daniela', 'roa', 'dani21@gmail.com', '6589147568', 'bogota', '2002-08-06'),
(7, '3698752167', 'juanita', 'lopez', 'juani@gmail.com', '3153568745', 'medelin', '1990-06-03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_habitacion`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
