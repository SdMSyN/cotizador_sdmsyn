-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2018 a las 23:20:09
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sdmsyn_cotizador`
--

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `nombre`, `direccion`, `rfc`, `cp`, `tel`, `num_sess`, `latitud`, `longitud`, `password`, `created`, `updated`, `activo`) VALUES
(14, 'Software de Mexico: Soluciones y Negocios', 'Avd. Tlapancalco Edif. 103, Depto. 8, Tlapancalco, Ocotlan, Tlaxcala', 'PECL891116U6', 90000, '2461231894', 2, '', '', '12345678', '2018-06-09', '2018-06-09', 1);

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `ap`, `am`, `user`, `password`, `perfil_id`, `rfc`, `direccion`, `num_int`, `num_ext`, `colonia`, `municipio`, `telefono`, `celular`, `created`, `updated`, `fec_nac`, `activo`) VALUES
(23, 'Luigi', 'Perez', 'Calzada', 'GianBros', 123, 1, 'PECL891116U6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-09', '2018-06-09', NULL, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
