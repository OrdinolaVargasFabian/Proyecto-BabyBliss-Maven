-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 06:11:24
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `babybliss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletacompra`
--

CREATE TABLE `boletacompra` (
  `idCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `total` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletasuscripcion`
--

CREATE TABLE `boletasuscripcion` (
  `idCompraSuscripcion` int(11) NOT NULL,
  `idSuscripcion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinalizacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `boletasuscripcion`
--

INSERT INTO `boletasuscripcion` (`idCompraSuscripcion`, `idSuscripcion`, `idUsuario`, `fechaCreacion`, `fechaInicio`, `fechaFinalizacion`) VALUES
(1, 2, 1, '2024-06-05 08:31:58', '2024-06-05', '2024-07-05'),
(2, 2, 1, '2024-06-16 21:49:06', '2024-06-16', '2024-07-16'),
(3, 2, 1, '2024-06-16 21:52:48', '2024-06-16', '2024-07-16'),
(4, 2, 2, '2024-06-17 00:01:05', '2024-06-17', '2024-07-17'),
(5, 2, 8, '2024-06-17 08:09:40', '2024-06-17', '2024-07-17'),
(6, 2, 1, '2024-06-17 08:23:57', '2024-06-17', '2024-07-17'),
(7, 2, 1, '2024-06-17 08:27:21', '2024-06-17', '2024-07-17'),
(8, 2, 1, '2024-06-17 08:31:55', '2024-06-17', '2024-07-17'),
(9, 2, 1, '2024-06-17 08:32:57', '2024-06-17', '2024-07-17'),
(10, 2, 8, '2024-06-17 08:35:06', '2024-06-17', '2024-07-17'),
(11, 2, 9, '2024-06-17 08:53:40', '2024-06-17', '2024-07-17'),
(12, 2, 11, '2024-06-18 21:50:19', '2024-06-18', '2024-07-18'),
(13, 2, 11, '2024-06-18 21:54:42', '2024-06-18', '2024-07-18'),
(14, 2, 11, '2024-06-19 08:41:49', '2024-06-19', '2024-07-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarioforo`
--

CREATE TABLE `comentarioforo` (
  `idComentario` int(11) NOT NULL,
  `idForo` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `comentario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compradetalles`
--

CREATE TABLE `compradetalles` (
  `idDetalles` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`idEspecialidad`, `nombre`, `estado`) VALUES
(1, 'Pediatría General', 1),
(2, 'Neurología Pediátrica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialista`
--

CREATE TABLE `especialista` (
  `idEspecialista` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `appat` varchar(20) NOT NULL,
  `apmat` varchar(20) NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(250) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  `telefono` int(11) NOT NULL,
  `especialidad` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialista`
--

INSERT INTO `especialista` (`idEspecialista`, `nombre`, `appat`, `apmat`, `dni`, `fecha_nacimiento`, `correo`, `contraseña`, `telefono`, `especialidad`, `foto`, `estado`) VALUES
(1, 'Hugo', 'Zapata', 'Martinez', 85475248, '1990-08-14', 'especialista@babybliss.com', '456', 987654335, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foroapoyo`
--

CREATE TABLE `foroapoyo` (
  `idForo` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `contenido` varchar(250) NOT NULL,
  `likes` int(11) DEFAULT 0,
  `estado` int(11) NOT NULL,
  `fechaAprobacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia`
--

CREATE TABLE `guia` (
  `idGuia` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `idEspecialista` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `contenido` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likesforo`
--

CREATE TABLE `likesforo` (
  `id` int(11) NOT NULL,
  `idPublicacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`) VALUES
(1, 'Conjunto de niña', 'Conjunto para niña de 2 años, de color rosa con amarillo', 20.00, 12, 'conjuntobabybliss.jpeg'),
(2, 'shampoo johmsons', 'Producto para hidratar el cuero cabelludo de su bebe', 25.00, 20, 'shampoo.babybliss.png'),
(3, 'Formula BEBA', 'Formula premium para el desarrollo de su bebe recién nacido', 35.00, 50, 'FormulaBEBA.png'),
(4, 'Pañales Babysec', 'Pañales para sus bebes recien nacido superabsorbente', 55.00, 75, 'babysec_recien_nacido.png'),
(5, 'Pack 1 para recien nacido', 'Paquete completo con los siguientes artículos: \r\nbiberon, pañales, shampo, talco, etc.', 155.00, 20, 'megapack2.png'),
(6, 'pack de shampoos johnsons baby', 'Paquete completo de variados shampoos que ayudaran al cuidado del cuero cabelludo de su bebe', 90.00, 25, 'johnsonbabyPACK.png'),
(7, 'Coche babybliss', 'Coches funcional para bebes recien nacidos hasta los 2 años', 180.00, 60, 'cochebabybliss.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunionprivada`
--

CREATE TABLE `reunionprivada` (
  `idReunion` int(11) NOT NULL,
  `fechaReunion` date NOT NULL,
  `horaReunion` time NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEspecialista` int(11) NOT NULL,
  `duracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `idSuscripcion` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `duracion/mes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`idSuscripcion`, `nombre`, `precio`, `duracion/mes`) VALUES
(1, 'Gratis', 0.00, NULL),
(2, 'BabyGold', 9.99, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `appat` varchar(20) NOT NULL,
  `apmat` varchar(20) NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(250) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  `telefono` int(11) NOT NULL,
  `membresia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `appat`, `apmat`, `dni`, `fecha_nacimiento`, `correo`, `contraseña`, `telefono`, `membresia`) VALUES
(1, 'Fabian', 'Ordinola', 'Vargas', 75962993, '2003-07-25', 'fabian25@gmail.com', 'fabian123', 987654321, 2),
(2, 'Prueba', 'Usuario', 'Premium', 741852963, '2002-05-01', 'prueba@gmail.com', 'prueba', 963852741, 2),
(8, 'fabiola', 'gallegos', 'pacheco', 12345789, '2024-06-17', 'fpgallegos@gmail.com', '123', 923412425, 2),
(9, 'Juana', 'NuÃ±ez', 'Soliz', 12345789, '2002-02-13', 'Soliz@gmail.com', '12345', 72823283, 2),
(11, 'fabrizzio', 'gallegos', 'pacheco', 92344245, '2024-06-18', 'U21311196@utp.edu.pe', 'Silvia152324', 12412424, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletacompra`
--
ALTER TABLE `boletacompra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `boletasuscripcion`
--
ALTER TABLE `boletasuscripcion`
  ADD PRIMARY KEY (`idCompraSuscripcion`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idSuscripcion` (`idSuscripcion`);

--
-- Indices de la tabla `comentarioforo`
--
ALTER TABLE `comentarioforo`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idForo` (`idForo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `compradetalles`
--
ALTER TABLE `compradetalles`
  ADD PRIMARY KEY (`idDetalles`),
  ADD KEY `idCompra` (`idCompra`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD PRIMARY KEY (`idEspecialista`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `foroapoyo`
--
ALTER TABLE `foroapoyo`
  ADD PRIMARY KEY (`idForo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `guia`
--
ALTER TABLE `guia`
  ADD PRIMARY KEY (`idGuia`),
  ADD KEY `idEspecialista` (`idEspecialista`);

--
-- Indices de la tabla `likesforo`
--
ALTER TABLE `likesforo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPublicacion` (`idPublicacion`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `reunionprivada`
--
ALTER TABLE `reunionprivada`
  ADD PRIMARY KEY (`idReunion`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idEspecialista` (`idEspecialista`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`idSuscripcion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `suscripcion` (`membresia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletacompra`
--
ALTER TABLE `boletacompra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletasuscripcion`
--
ALTER TABLE `boletasuscripcion`
  MODIFY `idCompraSuscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `comentarioforo`
--
ALTER TABLE `comentarioforo`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compradetalles`
--
ALTER TABLE `compradetalles`
  MODIFY `idDetalles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especialista`
--
ALTER TABLE `especialista`
  MODIFY `idEspecialista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `foroapoyo`
--
ALTER TABLE `foroapoyo`
  MODIFY `idForo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guia`
--
ALTER TABLE `guia`
  MODIFY `idGuia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likesforo`
--
ALTER TABLE `likesforo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reunionprivada`
--
ALTER TABLE `reunionprivada`
  MODIFY `idReunion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `idSuscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletacompra`
--
ALTER TABLE `boletacompra`
  ADD CONSTRAINT `boletacompra_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `boletasuscripcion`
--
ALTER TABLE `boletasuscripcion`
  ADD CONSTRAINT `boletasuscripcion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `boletasuscripcion_ibfk_2` FOREIGN KEY (`idSuscripcion`) REFERENCES `suscripcion` (`idSuscripcion`);

--
-- Filtros para la tabla `comentarioforo`
--
ALTER TABLE `comentarioforo`
  ADD CONSTRAINT `comentarioforo_ibfk_1` FOREIGN KEY (`idForo`) REFERENCES `foroapoyo` (`idForo`),
  ADD CONSTRAINT `comentarioforo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `compradetalles`
--
ALTER TABLE `compradetalles`
  ADD CONSTRAINT `compradetalles_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `boletacompra` (`idCompra`),
  ADD CONSTRAINT `compradetalles_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD CONSTRAINT `especialista_ibfk_1` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`idEspecialidad`);

--
-- Filtros para la tabla `foroapoyo`
--
ALTER TABLE `foroapoyo`
  ADD CONSTRAINT `foroapoyo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `guia`
--
ALTER TABLE `guia`
  ADD CONSTRAINT `guia_ibfk_1` FOREIGN KEY (`idEspecialista`) REFERENCES `especialista` (`idEspecialista`);

--
-- Filtros para la tabla `likesforo`
--
ALTER TABLE `likesforo`
  ADD CONSTRAINT `likesforo_ibfk_1` FOREIGN KEY (`idPublicacion`) REFERENCES `foroapoyo` (`idForo`),
  ADD CONSTRAINT `likesforo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `reunionprivada`
--
ALTER TABLE `reunionprivada`
  ADD CONSTRAINT `reunionprivada_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `reunionprivada_ibfk_2` FOREIGN KEY (`idEspecialista`) REFERENCES `especialista` (`idEspecialista`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`membresia`) REFERENCES `suscripcion` (`idSuscripcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
