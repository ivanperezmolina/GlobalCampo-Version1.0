-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2019 a las 18:06:00
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `globalcampo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cultivo`
--

CREATE TABLE `cultivo` (
  `CodCul` int(11) NOT NULL,
  `NomCul` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DesCul` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `RegCul` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `CopeCul` varchar(70) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cultivo`
--

INSERT INTO `cultivo` (`CodCul`, `NomCul`, `DesCul`, `RegCul`, `CopeCul`) VALUES
(1, 'Verea El Colmenar', 'Finca propiedad de Antonio Pérez.\r\nUbicada en Lucena (Córdoba)', '125478965', 'Cooperativa Olivarera \"San José\"'),
(2, 'Plantones', 'Finca propiedad de Antonio Pérez.\r\nUbicada en Lucena (Córdoba)', '568745215', 'Cooperativa Olivarera \"Cortijo Garay\"'),
(3, 'Pernalar', 'Finca propiedad de Antonio Pérez.\r\nUbicada en Llanos de Don Juan (Córdoba)', '987452103', 'Cooperativa Olivarera \"San José\"'),
(4, 'Capilla', 'Finca propiedad de Antonio Pérez.\r\nUbicada en Llanos de Don Juan (Córdoba)', '456456555', 'Cooperativa Olivarera \"San José\"'),
(5, 'Torca', 'Finca propiedad de Antonio Pérez.Ubicada en Cabra(Córdoba)', '568740333', 'Cooperativa Olivarera Virgen de la Sierra de Cabra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fertilizante`
--

CREATE TABLE `fertilizante` (
  `CodFer` int(11) NOT NULL,
  `NomFer` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DesFer` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `TipCulFer` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `UniFer` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fertilizante`
--

INSERT INTO `fertilizante` (`CodFer`, `NomFer`, `DesFer`, `TipCulFer`, `UniFer`) VALUES
(1, 'SULFATO POTASICO (POTASA) 25 KG', 'Recomendado en cultivos sensibles a cloruros y suelos con problemas de acidificación; ', 'SULFATO', '25KG'),
(2, 'NITRATO CALCICO CONCENTRADO GG S-25', 'Recomendado para prevenir y corregir deficiencias de calcio en cítricos', 'ABONO', '20KG'),
(3, 'SUPERFOSFATO DE CAL EN POLVO 25 KG.', 'Recomendado para suelos salinos y cultivos con exigencia de calcio', 'SULFATO', '25KG'),
(4, 'Abono orgánico peletizado 25 kg Ecocelta ', 'Recomendado para suelos salinosos', 'ABONO', '10L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poda`
--

CREATE TABLE `poda` (
  `CodPod` int(11) NOT NULL,
  `FecPod` date NOT NULL,
  `OliPod` int(11) NOT NULL,
  `DesPod` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CodCul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `poda`
--

INSERT INTO `poda` (`CodPod`, `FecPod`, `OliPod`, `DesPod`, `CodCul`) VALUES
(1, '2019-02-28', 2, 'Necesario para recolectar aceitunas. Olivos altos', 4),
(2, '2019-01-17', 25, 'Poda refrescativa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recolecta`
--

CREATE TABLE `recolecta` (
  `CodRec` int(11) NOT NULL,
  `FecRec` date NOT NULL,
  `KilRec` int(11) NOT NULL,
  `TraCul` int(11) NOT NULL,
  `DNIPerRec` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `DesRec` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CodCul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `recolecta`
--

INSERT INTO `recolecta` (`CodRec`, `FecRec`, `KilRec`, `TraCul`, `DNIPerRec`, `DesRec`, `CodCul`) VALUES
(10, '2019-02-26', 4895, 6, '52489879S', 'Aceitunas del ARBOL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `CodTra` int(11) NOT NULL,
  `FecTra` date NOT NULL,
  `DesTra` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `TipTra` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `CodCul` int(11) NOT NULL,
  `CodFer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`CodTra`, `FecTra`, `DesTra`, `TipTra`, `CodCul`, `CodFer`) VALUES
(1, '2019-02-11', 'Abono aplicado por prediccion de lluvia', 'ABONO', 5, 4),
(2, '2018-09-18', 'Sulfato de Otoño', 'SULFATO', 2, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  ADD PRIMARY KEY (`CodCul`);

--
-- Indices de la tabla `fertilizante`
--
ALTER TABLE `fertilizante`
  ADD PRIMARY KEY (`CodFer`);

--
-- Indices de la tabla `poda`
--
ALTER TABLE `poda`
  ADD PRIMARY KEY (`CodPod`),
  ADD KEY `CodCul` (`CodCul`);

--
-- Indices de la tabla `recolecta`
--
ALTER TABLE `recolecta`
  ADD PRIMARY KEY (`CodRec`),
  ADD KEY `CodCul` (`CodCul`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`CodTra`),
  ADD KEY `CodCul` (`CodCul`),
  ADD KEY `CodFer` (`CodFer`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cultivo`
--
ALTER TABLE `cultivo`
  MODIFY `CodCul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fertilizante`
--
ALTER TABLE `fertilizante`
  MODIFY `CodFer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `poda`
--
ALTER TABLE `poda`
  MODIFY `CodPod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recolecta`
--
ALTER TABLE `recolecta`
  MODIFY `CodRec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `CodTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `poda`
--
ALTER TABLE `poda`
  ADD CONSTRAINT `poda_ibfk_1` FOREIGN KEY (`CodCul`) REFERENCES `cultivo` (`CodCul`);

--
-- Filtros para la tabla `recolecta`
--
ALTER TABLE `recolecta`
  ADD CONSTRAINT `recolecta_ibfk_1` FOREIGN KEY (`CodCul`) REFERENCES `cultivo` (`CodCul`);

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`CodCul`) REFERENCES `cultivo` (`CodCul`),
  ADD CONSTRAINT `tratamiento_ibfk_2` FOREIGN KEY (`CodFer`) REFERENCES `fertilizante` (`CodFer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
