-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-03-2024 a las 19:02:17
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'Dunlop', 'Llantas Dunlop', 'img_5c5a2b5c4ab0a2a5289aac80a45af598.jpg', '2021-08-20 03:04:04', 'Dunlop', 1),
(2, 'Falken', 'Llantas Falken', 'img_555e58825c846abb99a99d1f429f07b3.jpg', '2021-08-21 00:47:10', 'Falken', 1),
(3, 'Sumitomo', 'Llantas Sumitomo', 'img_b1a03789f05cd20d63e0c9daf87af0ba.jpg', '2021-08-21 00:47:10', 'Sumitomo', 1);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint NOT NULL,
  `productoid` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`),
  KEY `productoid` (`productoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
(1, 1, 2, '200.00', 1),
(2, 1, 1, '100.00', 2);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

DROP TABLE IF EXISTS `detalle_temp`;
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `personaid` bigint NOT NULL,
  `productoid` bigint NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  `transaccionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  KEY `personaid` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productoid` bigint NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(1, 27, 'dunlop direzza-dz102 sedan.png'),
(2, 26, 'dunlop direzza-ziii sedan.png'),
(3, 25, 'dunlop grandtrek-at3g pickup.png'),
(4, 24, 'dunlop grandtrek-at3gm pickup.png'),
(5, 23, 'dunlop grandtrek-mt1 pickup.png'),
(6,22, 'dunlop LM705 sedan.png'),
(7, 21, 'dunlop Sp320 camion.png'),
(8, 20, 'dunlop sp-lt5 camion.png'),
(9, 19, 'dunlop vantrek-v1 camion.png'), 
(10, 18, 'Falken azenis-fk452 sedan.png'),
(11, 17, 'Falken azenis-fk453cc sedan.png'),
(12, 16, 'Falken lat110 pick up.png'),
(13, 15, 'Falken la-ta camion.png'),
(14, 14, 'Falken wildpeak-a-t01 camion.png'),
(15, 13, 'Falken wildpeak-a-t02 pick up.png'),
(16, 12, 'Falken wildpeak-a-t3 camion.png'),
(17, 11, 'Falken ziex-s-tz05 pick up.png'),
(18, 10, 'Falken ziex-ze914 sedan.png'),
(19, 9, 'Sumitomo htr900 sedan.png'),
(20, 8, 'sumitomo htr-2000 sedan.png'),
(21, 7, 'Sumitomo htrt4 sedan.png'),
(22, 6, 'sumitomo sl725 camion.png'),
(23, 5, 'sumitomo sl726 pick up.png'),
(24, 4, 'Sumitomo sl825 camion.png'),
(25, 3, 'sumitomo sl840 pick up.png'),
(26, 2, 'sumitomo sl850 camion.png'),
(27, 1, 'sumitomo st948 camion.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(9, 'Páginas', 'Páginas del sitio web', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` bigint NOT NULL AUTO_INCREMENT,
  `referenciacobro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
  `personaid` bigint NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `costo_envio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint NOT NULL,
  `direccion_envio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `personaid` (`personaid`),
  KEY `tipopagoid` (`tipopagoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
(1, '4561654687', NULL, NULL, 3, '2021-08-20 03:41:57', '50.00', '450.00', 3, 'Antigua Guatemala, Antigua Guatemala', 'Completo'),
(2, NULL, '8XD37465755620710', '{\"id\":\"4S6284553D668511R\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"description\":\"Compra de artículos en Tienda Virtual por $350 \",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"id\":\"8XD37465755620710\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2021-08-20T09:48:38Z\",\"update_time\":\"2021-08-20T09:48:38Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"}},\"create_time\":\"2021-08-20T09:46:25Z\",\"update_time\":\"2021-08-20T09:48:38Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4S6284553D668511R\",\"rel\":\"self\",\"method\":\"GET\"}]}', 3, '2021-08-20 03:48:39', '50.00', '350.00', 1, 'Guatemala, Guatemala', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` bigint NOT NULL AUTO_INCREMENT,
  `rolid` bigint NOT NULL,
  `moduloid` bigint NOT NULL,
  `r` int NOT NULL DEFAULT '0',
  `w` int NOT NULL DEFAULT '0',
  `u` int NOT NULL DEFAULT '0',
  `d` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpermiso`),
  KEY `rolid` (`rolid`),
  KEY `moduloid` (`moduloid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(3, 1, 1, 1, 1, 1, 1),
(4, 1, 2, 1, 1, 1, 1),
(5, 1, 3, 1, 1, 1, 1),
(6, 1, 4, 1, 1, 1, 1),
(7, 1, 5, 1, 1, 1, 1),
(8, 1, 6, 1, 1, 1, 1),
(9, 1, 7, 1, 1, 1, 1),
(10, 1, 8, 1, 1, 1, 1),
(11, 1, 9, 1, 1, 1, 1),
(12, 2, 1, 1, 1, 1, 1),
(13, 2, 2, 0, 0, 0, 0),
(14, 2, 3, 1, 1, 1, 0),
(15, 2, 4, 1, 1, 1, 0),
(16, 2, 5, 1, 1, 1, 0),
(17, 2, 6, 1, 1, 1, 0),
(18, 2, 7, 1, 0, 0, 0),
(19, 2, 8, 1, 0, 0, 0),
(20, 2, 9, 1, 1, 1, 1),
(21, 3, 1, 0, 0, 0, 0),
(22, 3, 2, 0, 0, 0, 0),
(23, 3, 3, 0, 0, 0, 0),
(24, 3, 4, 0, 0, 0, 0),
(25, 3, 5, 1, 0, 0, 0),
(26, 3, 6, 0, 0, 0, 0),
(27, 3, 7, 0, 0, 0, 0),
(28, 3, 8, 0, 0, 0, 0),
(29, 3, 9, 0, 0, 0, 0),
(30, 4, 1, 1, 0, 0, 0),
(31, 4, 2, 0, 0, 0, 0),
(32, 4, 3, 1, 1, 1, 0),
(33, 4, 4, 1, 0, 0, 0),
(34, 4, 5, 1, 0, 1, 0),
(35, 4, 6, 0, 0, 0, 0),
(36, 4, 7, 1, 0, 0, 0),
(37, 4, 8, 1, 0, 0, 0),
(38, 4, 9, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` bigint NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `email_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  KEY `rolid` (`rolid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(2, '24091990', 'Alex', 'Arana', 456878977, 'alex@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 2, '2021-08-20 02:58:47', 1),
(3, '84654864', 'Ricardo', 'Hernández Pérez', 4687987, 'hr@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '468798', 'Ricardo HP', 'Ciudad de Guatemala', NULL, 3, '2021-08-20 03:41:28', 1),
(4, '798465877', 'Fernando', 'Guerra', 468498, 'fer@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 4, '2021-08-21 18:07:00', 1),
(5, '123456789', 'Jeanluca', 'Flores', 12345678, 'floresjeanluca@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', NULL, NULL, NULL, NULL, 1, '2024-03-24 09:37:54', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `idpost` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
(1, 'Inicio', '<div class=\"p-t-80\"> <h3 class=\"ltext-103 cl5\">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class=\"row\"> <div class=\"col-md-3\"><img src=\"Assets/images/m1.png\" alt=\"Marca 1\" width=\"110\" height=\"110\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m2.png\" alt=\"Marca 2\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m3.png\" alt=\"Marca 3\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m4.png\" alt=\"Marca 4\" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <h3 class=\"mtext-111 cl2 p-b-16\">Historia</h3> <p class=\"stext-113 cl6 p-b-26\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat consequat enim, non auctor massa ultrices non. Morbi sed odio massa. Quisque at vehicula tellus, sed tincidunt augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas varius egestas diam, eu sodales metus scelerisque congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas gravida justo eu arcu egestas convallis. Nullam eu erat bibendum, tempus ipsum eget, dictum enim. Donec non neque ut enim dapibus tincidunt vitae nec augue. Suspendisse potenti. Proin ut est diam. Donec condimentum euismod tortor, eget facilisis diam faucibus et. Morbi a tempor elit.</p> <p class=\"stext-113 cl6 p-b-26\">Donec gravida lorem elit, quis condimentum ex semper sit amet. Fusce eget ligula magna. Aliquam aliquam imperdiet sodales. Ut fringilla turpis in vehicula vehicula. Pellentesque congue ac orci ut gravida. Aliquam erat volutpat. Donec iaculis lectus a arcu facilisis, eu sodales lectus sagittis. Etiam pellentesque, magna vel dictum rutrum, neque justo eleifend elit, vel tincidunt erat arcu ut sem. Sed rutrum, turpis ut commodo efficitur, quam velit convallis ipsum, et maximus enim ligula ac ligula.</p> <p class=\"stext-113 cl6 p-b-26\">Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879</p> </div> </div> <div class=\"col-11 col-md-5 col-lg-4 m-lr-auto\"> <div class=\"how-bor1 \"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849825_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-2 col-md-7 col-lg-8 p-b-30\"> <div class=\"p-t-7 p-l-85 p-l-15-lg p-l-0-md\"> <h2 class=\"mtext-111 cl2 p-b-16\"><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113 cl6 p-b-26\">Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.</p> <div class=\"bor16 p-l-29 p-b-9 m-t-22\"> <p class=\"stext-114 cl6 p-r-40 p-b-11\">Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.</p> <span class=\"stext-111 cl8\"> - Steve Job&rsquo;s </span></div> </div> </div> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849822_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> </div> </section>', 'img_2f644b056a9fd3624c7595d24b1d9273.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt\" width=\"100%\" height=\"600\" allowfullscreen=\"allowfullscreen\" loading=\"lazy\"></iframe></div>', 'img_3024f13dc010ffab8c22da05ac6a32b9.jpg', '2021-08-09 03:11:08', 'contacto', 1),
(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style=\"color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
(8, 'Sucursales', '<section class=\"py-5 text-center\"> <div class=\"container\"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class=\"btn btn-info\" href=\"../../tienda_virtual/tienda\">VER PRODUCTOS</a></div> </section> <div class=\"py-5 bg-light\"> <div class=\"container\"> <div class=\"row\"> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s1.jpg\" alt=\"Tienda Uno\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s2.jpg\" alt=\"Sucural dos\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s3.jpg\" alt=\"Sucural tres\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'img_d72cb5712933863e051dc9c7fac5e253.jpg', '2021-08-11 02:26:45', 'sucursales', 1),
(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` bigint NOT NULL AUTO_INCREMENT,
  `categoriaid` bigint NOT NULL,
  `codigo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int NOT NULL,
  `imagen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproducto`),
  KEY `categoriaid` (`categoriaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`)VALUES
(27,1, '1234567890', 'Dunlop Direzza-DZ102 Sedan', 'El DIREZZA DZ102 posee un excelente desempeño en condiciones de lluvia. Desarrollado para usuarios de vehículos deportivos y sedanes, posee un atractivo diseño que combina estabilidad, maniobrabilidad y desempeño anti hidroplaneoEl DIREZZA DZ102 posee un excelente desempeño en condiciones de lluvia. Desarrollado para usuarios de vehículos deportivos y sedanes, posee un atractivo diseño que combina estabilidad, maniobrabilidad y desempeño anti hidroplaneoEl DIREZZA DZ102 posee un excelente desempeño en condiciones de lluvia. Desarrollado para usuarios de vehículos deportivos y sedanes, posee un atractivo diseño que combina estabilidad, maniobrabilidad y desempeño anti hidroplaneo', '89.99', 30,1, '2021-08-20 03:12:14', 'dunlop-direzza-dz102-sedan', 1),
(26,1, '1234567891', 'Dunlop Direzza-ZIII Sedan', 'Desempeño extremo en verano CARACTERÍSTICAS El DIREZZA ZIII es el neumático de rendimiento extremo de Dunlop, diseñado para los conductores de autos deportivos y sedanes de alto rendimiento que buscan niveles de tracción y manejo cercanos a los deportes de motor. Es un neumático que se puede utilizar en la calle y en circuitos.', '79.99', 25,2, '2021-08-21 04:23:15', 'dunlop-direzza-ziii-sedan', 1),
(25,1, '1234567892', 'Dunlop Grandtrek-AT3G Pickup', 'El GRANDTREK AT3GM tiene cuatro surcos rectos principales otorgan muy buen desempeño en superficies húmedas y estabilidad en alta velocidad. Surcos laterales alargados proporcionan un excelente desempeño
anti-hidroplaneo. Fabricado en Tailandia con tecnología japonesa.', '72', 23, 3, '2021-08-21 04:23:15', 'dunlop-grandtrek-at3g-pickup', 1),
(24, 1, '1234567893', 'Dunlop Grandtrek-AT3GM Pickup', 'LLANTA DE ALTA TRACCIÓN DENTRO Y FUERA DE CARRETERA, CON RESISTENCIA GARANTIZADA Y DE GRAN VERSATILIDAD PARA AFRONTAR CAMINOS EN MAL ESTADO O TERRENOS DE DIFÍCIL ACCESO', '109.99', 15, 4,'2021-08-23 06:45:17', 'dunlop-grandtrek-at3gm-pickup', 1),
(23,1, '1234567894', 'Dunlop Grandtrek-MT1 Pickup', 'Este neumático fue desarrollado para conductores de 4WD que disfrutan de la conducción fuera de carretera en condiciones pesadas. Cuenta con una carcasa extra fuerte para mayor protección y está diseñada para tener una tracción superior en barro y terreno', '119.99', 10,5, '2021-08-24 07:56:18', 'dunlop-grandtrek-mt1-pickup', 1),
(22,1, '1234567895', 'Dunlop LM705 Sedan', 'El Dunlop SP SPORT LM705 ha sido diseñado para proporcionar una cómoda sensación de manejo desde que te pones en marcha. Puede ser utilizado en una amplia gama de vehículos que incluyen sedan, wagon y mini-van. Gracias a SHINOBI, la nueva tecnología de Dunlop', '99.99', 30,6, '2021-08-25 08:12:19', 'dunlop-lm705-sedan', 1),
(21,1, '1234567896', 'Dunlop SP320 Camion', 'El nuevo diseño de su banda de rodado incrementa la resistencia al desgaste irregular al que se enfrentan los neumáticos/llanta en la dirección. Esta característica entrega mayor kilometraje de duración y menor costo por kilometro.', '89.99', 25,7, '2021-08-26 09:23:20', 'dunlop-sp320-camion', 1),
(20,1, '1234567897', 'Dunlop SP-LT5 Camion', 'DUNLOP SP LT5 LA BANDA DE RODAMIENTO DE ESTA LLANTA CUENTA CON UN DISEÑO DE RANURAS PROFUNDAS QUE SE ENCARGAN DE EXPULSAR EL AGUA DE MANERA EFICAZ, EVITANDO ASI DESLIZAMIENTOS O ACCIDENTES AL CIRCULAR SOBRE RUTAS MOJADAS.', '79.99', 20,8, '2021-08-27 10:34:21', 'dunlop-sp-lt5-camion', 1),
(19,1, '1234567898', 'Dunlop Vantrek-V1 Camion', 'DUNLOP VANTREK V1 LLANTA DE VERANO APTA PARA CIRCULAR EN CONDICIONES AMBIENTALES NORMALES Y DURANTE LOS MESES CON TEMPERATURAS ALTAS SIN TENER VARIACIONES EN EL AGARRE.', '69.99', 15,9, '2021-08-28 11:45:22', 'dunlop-vantrek-v1-camion', 1),
(18,2, '2234567890', 'Falken Azenis-FK452 Sedan', 'LLANTA DISEÑADA PARA LOS AUTOS DEPORTIVOS, DE GRAN CAPACIDAD Y POTENCIA DEL MOTOR. ESTE MODELO ES MUY POPULAR ENTRE LOS ENTUSIASTAS DEL TUNING. SU DISEÑO ATRACTIVO Y SU BAJO PERFIL MEJORAN EL ASPECTO DE CUALQUIER CARRO', '79.99', 30,10, '2021-08-29 12:56:23', 'falken-azenis-fk452-sedan', 1),
(17,2, '2234567891', 'Falken Azenis-FK453CC Sedan', 'LA DISTRIBUCIÓN ÓPTIMA DE LA PRESIÓN POR LA PARTE INTERNA HACE QUE LA BANDA DE RODADURA SE DESGASTE DE MANERA UNIFORME, DE TAL MODO QUE CONTRIBUYE CON CON LOS MÁXIMOS PARÁMETROS DE MANEJO TODO SU PERÍODO DE USO.', '89.99', 25,11, '2021-08-30 13:12:24', 'falken-azenis-fk453cc-sedan', 1),
(16,2, '2234567892', 'Falken LAT110 Pick Up', 'LLANTA PARA TODO TERRENO QUE MANTIENE SU EFICACIA EN CUALQUIER ÉPOCA DEL AÑO, POSEE UNA BUENA ADHERENCIA EN CURVA Y GRAN ESTABILIDAD DIRECCIONAL.', '99.99', 20, 12,'2021-08-31 14:23:25', 'falken-lat110-pickup', 1),
(15,2, '2234567893', 'Falken LA-TA Camion', 'LLANTA DISEÑADA PARA CONDICIONES PESADAS, CON UN EXCELENTE RENDIMIENTO Y DISEÑO AUTO LIMPIANTE DE LA BANDA DE RODADURA PARA ELIMINAR PIEDRAS', '109.99', 15,13, '2021-09-01 15:34:26', 'falken-la-ta-camion', 1),
(14,2, '2234567894', 'Falken Wildpeak-A-T01 Camion', 'LLANTA DE ALTO RENDIMIENTO PARA TODO TERRENO, CON UNA EXCELENTE ESTABILIDAD DE CONDUCCIÓN. BAJO RUIDO INCLUSO A ALTAS VELOCIDADES', '119.99', 10,14, '2021-09-02 16:45:27', 'falken-wildpeak-a-t01-camion', 1),
(13,2, '2234567895', 'Falken Wildpeak-A-T02 Pick Up', 'ES UNA LLANTA CON UNA POSTURA AGRESIVA Y UNA TRACCIÓN INCOMPARABLE. UN DISEÑO SIMÉTRICO DE CINCO COSTILLAS Y UN BLOQUE RÍGIDO PERMITE UNA MAYOR DURABILIDAD, Y UNA RESPUESTA EXCEPCIONAL EN CARRETERA', '129.99', 30,15, '2021-09-03 17:56:28', 'falken-wildpeak-a-t02-pickup', 1),
(12,2, '2234567896', 'Falken Wildpeak-A-T3 Camion', 'ESTA LLANTA HA SIDO DISEÑADA PARA LA AVENTURA, EN CUALQUIER MOMENTO Y EN CUALQUIER CLIMA; COMBINA UNA AGRESIVA HABILIDAD FUERA DE LA CARRETERA Y UNA CONDUCCIÓN EN TERRENO ACCIDENTADO SIN COMPROMETER EL AUTOMÓVIL. UN DISEÑO OPTIMIZADO DE LA BANDA DE RODADURA COMBINADO CON UN COMPUESTO DE SÍLICE PERMITE QUE LA LLANTA SE DESTAQUE EN DURABILIDAD, Y RENDIMIENTO EN MOJADO.', '139.99', 25,16, '2021-09-04 18:12:29', 'falken-wildpeak-a-t3-camion', 1),
(11,2, '2234567897', 'Falken Ziex-S-TZ05 Pick Up', 'PROPORCIONA UNA MAYOR ESTABILIDAD A ALTA VELOCIDAD CREANDO UNA APARIENCIA MODERNA AL TIEMPO QUE MAXIMIZA EL CONTROL DE RUIDO Y LA EVACUACIÓN DE AGUA.', '149.99', 20,17, '2021-09-05 19:23:30', 'falken-ziex-s-tz05-pickup', 1),
(10,2, '2234567898', 'Falken Ziex-ZE914 Sedan', 'ESTA LLANTA POSEE UN DISEÑO ASIMÉTRICO DE LA BANDA DE RODADURA QUE PERMITE AUMENTAR LA ESTABILIDAD Y LA ADHERENCIA AL TRAZAR LAS CURVAS DE FORMA RÁPIDA.', '59.99', 15,18, '2021-09-06 20:34:31', 'falken-ziex-ze914-sedan', 1),
(9,3, '3234567890', 'Sumitomo HTR900 Sedan', 'ESTA LLANTA SE DESARROLLO UTILIZANDO LA ÚLTIMA TECNOLOGÍA EN LLANTAS DE CONFORT Y CALIDADES DE GAMA ALTA. SU COMPUESTO ÚNICO DE LA BANDA DE RODADURA ES COMPATIBLE CON EL DESPLIEGUE DE ALL-SEASON PARA FACILITAR LA CONDUCCIÓN EN CONDICIONES CLIMÁTICAS VARIABLES.', '69.99', 30,19, '2021-09-07 21:45:32', 'sumitomo-htr900-sedan', 1),
(8,3, '3234567891', 'Sumitomo HTR-2000 Sedan', 'LLANTA CON GRABADO ASIMÉTRICO DE ALTO RENDIMIENTO CON UN COMPUESTO QUE BRINDA UNA LARGA VIDA ÚTIL.', '79.99', 25,20, '2021-09-08 22:56:33', 'sumitomo-htr-2000-sedan', 1),
(7,3, '3234567892', 'Sumitomo HTRT4 Sedan', 'ESTA LLANTA FUE DISEÑADA PARA SEDANES DE ALTO RENDIMIENTO. TIENE UN DISEÑO DE CINCO COSTILLAS QUE BRINDA UN BUEN AGARRE SOBRE CARRETERAS MOJADAS Y EVITA EL AQUAPLANNING. ADEMÁS, EL COMPUESTO DE ESTA LLANTA MEJORA LA RESISTENCIA AL DESGASTE PROVEYENDO UNA LLANTA DE LARGA DURACIÓN.', '89.99', 20,21, '2021-09-09 23:12:34', 'sumitomo-htrt4-sedan', 1),
(6,3, '3234567893', 'Sumitomo SL725 Camion', 'LA BANDA DE RODAMIENTO CONTIENE TRES GRANDES SURCOS PARA UNA EXCELENTE DISTRIBUCIÓN DE AGUA PARA MEJORAR LA TRACCIÓN SOBRE ASFALTO MOJADO.', '99.99', 15,22, '2021-09-10 00:23:35', 'sumitomo-sl725-camion', 1),
(5,3, '3234567894', 'Sumitomo SL726 Pick Up', 'LLANTA DISEÑADA PARA CAMIONETAS Y FURGONETAS DE REPARTO. LA LLANTA PRESENTA UNA EXCELENTE RESSISTENCIA AL DESGASTE Y ESTABILIDAD A ALTA VELOCIDAD, ASI COMO UN EXCELENTE FRENADO.', '109.99', 10,23, '2021-09-11 01:34:36', 'sumitomo-sl726-pickup', 1),
(4,3, '3234567895', 'Sumitomo SL825 Camion', 'ESTA LLANTA CUENTA CON EL RESPALDO Y LA TECNOLOGÍA DE SUMITOMO. TE BRINDA CAPACIDAD Y RENDIMIENTO EN CUALQUIER ESTACIÓN DEL AÑO Y ADEMAS OFRECE LA MEJOR COMODIDAD Y CONFORT.', '119.99', 30,24, '2021-09-12 02:45:37', 'sumitomo-sl825-camion', 1),
(3,3, '3234567896', 'Sumitomo SL840 Pick Up', 'EL DISEÑO AVANZADO DE LA BADE DE RODADURA Y EL COMPUESTO DE SILICE OFRECEN MÁXIMO RENDIMIENTO EN UNA AMPLIA GAMA DE CONDICIONES.', '129.99', 25, 25,'2021-09-13 03:56:38', 'sumitomo-sl840-pickup', 1),
(2,3, '3234567897', 'Sumitomo SL850 Camion', 'LLANTA CON UNA EXCELENTE ESTABILIDAD PARA EL EJE DIRECCIONAL INCLUYENDO UN BUEN DREJANE DE AGUA PARA UN MEJOR MANEJO..', '139.99', 20,26, '2021-09-14 04:12:39', 'sumitomo-sl850-camion', 1),
(1,3, '3234567898', 'Sumitomo ST948 Camion', 'ESTA LLANTA CUENTA CON EL RESPALDO Y LA TECNOLOGÍA DE SUMITOMO. TE BRINDA CAPACIDAD Y RENDIMIENTO EN CUALQUIER ESTACIÓN DEL AÑO Y ADEMAS OFRECE LA MEJOR COMODIDAD', '149.99', 15,27, '2021-09-15 05:23:40', 'sumitomo-st948-camion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

DROP TABLE IF EXISTS `reembolso`;
CREATE TABLE IF NOT EXISTS `reembolso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pedidoid` bigint NOT NULL,
  `idtransaccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidoid` (`pedidoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` bigint NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisor', 'Supervisor de tiendas', 1),
(3, 'Cliente', 'Clientes en general', 1),
(4, 'Vendedor', 'Operador de tienda', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
CREATE TABLE IF NOT EXISTS `suscripciones` (
  `idsuscripcion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsuscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
(1, 'Roberto', 'toolsfordeveloper@gmail.com', '2021-08-20 04:05:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
CREATE TABLE IF NOT EXISTS `tipopago` (
  `idtipopago` bigint NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
