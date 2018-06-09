-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2018 a las 23:03:53
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
-- Base de datos: `sthogar_cotizador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `id` int(11) NOT NULL,
  `created` date NOT NULL,
  `user_create` int(11) NOT NULL,
  `updated` date NOT NULL,
  `user_update` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created` date NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap` varchar(50) NOT NULL,
  `am` varchar(50) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rfc` varchar(15) NOT NULL,
  `porc_desc` int(11) NOT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costales`
--

CREATE TABLE `costales` (
  `id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_info`
--

CREATE TABLE `cotizacion_info` (
  `id` int(11) NOT NULL,
  `folio` varchar(15) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tienda_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL,
  `cotizador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_prod`
--

CREATE TABLE `cotizacion_prod` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cotizacion_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo_unitario` float NOT NULL,
  `costo_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizador`
--

CREATE TABLE `cotizador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `creado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`) VALUES
(1, 'ACTIVO'),
(2, 'DESACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_info`
--

CREATE TABLE `pedidos_info` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `nombre_cliente` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `total` float(8,2) NOT NULL,
  `est_pedido_id` int(11) NOT NULL,
  `est_pedido_pago_id` int(11) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora_entrega_inicial` time NOT NULL,
  `hora_entrega_final` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_pagos`
--

CREATE TABLE `pedidos_pagos` (
  `id` int(11) NOT NULL,
  `pedido_info_id` int(11) NOT NULL,
  `pago` float(8,2) NOT NULL,
  `recibido` float(8,2) NOT NULL,
  `cambio` float(8,2) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_prod`
--

CREATE TABLE `pedidos_prod` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `pedido_info_id` int(11) NOT NULL,
  `cantidad` int(7) NOT NULL,
  `costo_unitario` float(8,2) NOT NULL,
  `costo_total` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_est`
--

CREATE TABLE `pedido_est` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_est_pago`
--

CREATE TABLE `pedido_est_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `perfil`) VALUES
(1, 'GERENTE'),
(2, 'COTIZADOR'),
(3, 'VENDEDOR'),
(4, 'FRANQUICIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio_raiz` float(8,2) NOT NULL,
  `precio_franquicia` float(8,2) NOT NULL,
  `precio_cotizador` float(8,2) NOT NULL,
  `precio_publico` float(8,2) NOT NULL,
  `cant_minima` int(11) NOT NULL,
  `img` varchar(20) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `codigo_barras` varchar(20) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `subcategoria_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `updated_by_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sobrantes`
--

CREATE TABLE `sobrantes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `tienda_ida` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `create_by` int(11) NOT NULL,
  `updated` date NOT NULL,
  `update_by` int(11) NOT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `cp` int(5) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `num_sess` int(2) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `activo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap` varchar(30) NOT NULL,
  `am` varchar(30) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  `password` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `num_int` varchar(10) DEFAULT NULL,
  `num_ext` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `municipio` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `fec_nac` date DEFAULT NULL,
  `activo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_mensajes`
--

CREATE TABLE `usuarios_mensajes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `creado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_info`
--

CREATE TABLE `ventas_info` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `pago` float(8,2) NOT NULL,
  `total` float(8,2) NOT NULL,
  `cambio` float(8,2) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_prod`
--

CREATE TABLE `ventas_prod` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `venta_info_id` int(11) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `costo_unitario` varchar(10) NOT NULL,
  `costo_total` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `tienda_id` (`tienda_id`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `user_create` (`user_create`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `created_by_user_id` (`created_by_user_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costales`
--
ALTER TABLE `costales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `cotizacion_info`
--
ALTER TABLE `cotizacion_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`,`tienda_id`,`cotizador_id`),
  ADD KEY `tienda_id` (`tienda_id`),
  ADD KEY `cotizador_id` (`cotizador_id`);

--
-- Indices de la tabla `cotizacion_prod`
--
ALTER TABLE `cotizacion_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`,`cotizacion_id`),
  ADD KEY `cotizacion_id` (`cotizacion_id`);

--
-- Indices de la tabla `cotizador`
--
ALTER TABLE `cotizador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos_info`
--
ALTER TABLE `pedidos_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `pedidos_pagos`
--
ALTER TABLE `pedidos_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos_prod`
--
ALTER TABLE `pedidos_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `venta__info_id` (`pedido_info_id`);

--
-- Indices de la tabla `pedido_est`
--
ALTER TABLE `pedido_est`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido_est_pago`
--
ALTER TABLE `pedido_est_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `sobrantes`
--
ALTER TABLE `sobrantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`),
  ADD KEY `perfil_id` (`perfil_id`);

--
-- Indices de la tabla `usuarios_mensajes`
--
ALTER TABLE `usuarios_mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas_info`
--
ALTER TABLE `ventas_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `ventas_prod`
--
ALTER TABLE `ventas_prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `venta__info_id` (`venta_info_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `costales`
--
ALTER TABLE `costales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion_info`
--
ALTER TABLE `cotizacion_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `cotizacion_prod`
--
ALTER TABLE `cotizacion_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=579;

--
-- AUTO_INCREMENT de la tabla `cotizador`
--
ALTER TABLE `cotizador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos_info`
--
ALTER TABLE `pedidos_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_pagos`
--
ALTER TABLE `pedidos_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_prod`
--
ALTER TABLE `pedidos_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_est`
--
ALTER TABLE `pedido_est`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_est_pago`
--
ALTER TABLE `pedido_est_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sobrantes`
--
ALTER TABLE `sobrantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios_mensajes`
--
ALTER TABLE `usuarios_mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas_info`
--
ALTER TABLE `ventas_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ventas_prod`
--
ALTER TABLE `ventas_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `almacenes_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `costales`
--
ALTER TABLE `costales`
  ADD CONSTRAINT `costales_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`);

--
-- Filtros para la tabla `cotizacion_info`
--
ALTER TABLE `cotizacion_info`
  ADD CONSTRAINT `cotizacion_info_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cotizacion_info_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cotizacion_info_ibfk_3` FOREIGN KEY (`cotizador_id`) REFERENCES `cotizador` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cotizacion_prod`
--
ALTER TABLE `cotizacion_prod`
  ADD CONSTRAINT `cotizacion_prod_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cotizacion_prod_ibfk_2` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizacion_info` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `sobrantes`
--
ALTER TABLE `sobrantes`
  ADD CONSTRAINT `sobrantes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `subcategorias_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `subcategorias_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`);

--
-- Filtros para la tabla `ventas_info`
--
ALTER TABLE `ventas_info`
  ADD CONSTRAINT `ventas_info_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ventas_info_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`);

--
-- Filtros para la tabla `ventas_prod`
--
ALTER TABLE `ventas_prod`
  ADD CONSTRAINT `ventas_prod_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ventas_prod_ibfk_2` FOREIGN KEY (`venta_info_id`) REFERENCES `ventas_info` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
