-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2020 a las 07:59:49
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `green_rose`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id_Categoria` int(255) NOT NULL,
  `Codigo_Categoria` varchar(50) NOT NULL,
  `Nombre_Categoria` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_Cliente` int(255) NOT NULL,
  `Nombres` varchar(200) NOT NULL,
  `Apellidos` varchar(200) NOT NULL,
  `Tipo_Doc` varchar(50) NOT NULL,
  `Num_Doc` varchar(20) NOT NULL,
  `Celular` varchar(100) DEFAULT NULL,
  `eMail` varchar(200) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Id_Usuario` int(255) NOT NULL,
  `Fecha_Creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `Id_Compra` int(255) NOT NULL,
  `Id_Usuario` int(255) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `Total` decimal(18,0) NOT NULL,
  `Id_Detalle_Compra` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `Id_Detalle_Compra` int(255) NOT NULL,
  `Cod_Prod_Serv` varchar(50) NOT NULL,
  `Cantidad` int(255) NOT NULL,
  `Valor_Unitario` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `Id_Detalle_Venta` int(255) NOT NULL,
  `Valor_Unitario` decimal(18,0) NOT NULL,
  `Cantidad` int(255) NOT NULL,
  `Codigo_Prod_Serv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garden`
--

CREATE TABLE `garden` (
  `Id_Garden` int(255) NOT NULL,
  `Id_Cliente` int(255) NOT NULL,
  `Id_Usuario` int(255) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Final` date NOT NULL,
  `Tipo_Planta` varchar(100) NOT NULL,
  `Observaciones` varchar(100) NOT NULL,
  `Codigo_Prod_Serv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta`
--

CREATE TABLE `planta` (
  `Id_Planta` int(255) NOT NULL,
  `Id_Garden` int(255) NOT NULL,
  `Humedad_Suelo` float NOT NULL,
  `Humedad_Aire` float NOT NULL,
  `Intensidad_Luminica` float NOT NULL,
  `Temperatura_Ambiente` float NOT NULL,
  `Fecha_Monitoreo` date NOT NULL,
  `Id_Usuario` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_servicios`
--

CREATE TABLE `productos_servicios` (
  `Id_Prod_Serv` int(255) NOT NULL,
  `Codigo_Prod_serv` varchar(50) NOT NULL,
  `Cantidad` int(50) NOT NULL,
  `Nombre_Prod_Serv` varchar(200) NOT NULL,
  `Precio` decimal(18,0) NOT NULL,
  `Id_Categoria` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `privilegio` int(255) NOT NULL,
  `nombre_privilegio` varchar(200) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`privilegio`, `nombre_privilegio`, `estado`) VALUES
(1, 'ADMINISTRADOR', '1'),
(2, 'CLIENTE', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `privilegio` int(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `email`, `password`, `privilegio`, `fecha_registro`) VALUES
(9, 'pruebas', 'pruebas', 'pruebas@gmail.com', 'pruebas', 1, '2020-09-05 17:55:06'),
(10, 'Jecika León', 'jleon', 'jleonli@uninpahu.edu.co', 'jleon', 2, '2020-09-05 21:59:38'),
(11, 'Brenda León', 'bleon', 'bleon@gmail.com', 'bleon', 2, '2020-09-05 22:04:49'),
(13, 'Albert Pinilla', 'apinilla', 'apinillato@uninpahu.edu.co', 'apinilla', 2, '2020-09-06 03:46:09'),
(14, 'Pedro Torres', 'ptorres', 'ptorres@gmail.com', 'ptorres', 2, '2020-09-06 04:27:46'),
(15, 'll', 'll', 'll@ll.com', 'll', 2, '2020-09-06 05:23:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Id_Venta` int(255) NOT NULL,
  `Id_Cliente` int(255) NOT NULL,
  `Id_Usuario` int(255) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `Total` decimal(18,0) NOT NULL,
  `Id_Detalle_Venta` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`Id_Compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`Id_Detalle_Compra`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`Id_Detalle_Venta`);

--
-- Indices de la tabla `garden`
--
ALTER TABLE `garden`
  ADD PRIMARY KEY (`Id_Garden`);

--
-- Indices de la tabla `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`Id_Planta`);

--
-- Indices de la tabla `productos_servicios`
--
ALTER TABLE `productos_servicios`
  ADD PRIMARY KEY (`Id_Prod_Serv`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`privilegio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Id_Venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `privilegio` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
