-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2019 a las 06:38:53
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(1, 'H.P. Lovecraft'),
(2, 'George R.R'),
(3, 'J.R.R Tolkien'),
(4, 'J.K. Rowling'),
(5, 'Hajime Isayama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `editorial_id` int(11) NOT NULL,
  `speciality_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `name`, `description`, `isbn`, `price`, `stock`, `author_id`, `editorial_id`, `speciality_id`) VALUES
(1, 'Necromicon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 90-12345', 200000, 20, 1, 1, 1),
(2, 'Lord of the Rings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 91-123456', 150000, 15, 2, 2, 2),
(3, 'Harry Potter', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 92-1234567', 250000, 40, 3, 3, 3),
(4, 'Game of Throne', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donecin elit interdum, accumsan est et, consectetur justo.', 'ISBN 93-12345678', 100000, 30, 4, 4, 4),
(5, 'Shingeky no Kyojin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donecin elit interdum, accumsan est et, consectetur justo.', 'ISBN 94-123456789', 50000, 70, 5, 5, 5),
(6, 'Tales of Cthulhu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donecin elit interdum, accumsan est et, consectetur justo.', 'ISBN 90-1234511', 230000, 30, 1, 1, 1),
(7, 'The Hobbit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donecin elit interdum, accumsan est et, consectetur justo.', 'ISBN 91-12345611', 180000, 46, 2, 2, 2),
(8, 'Fantastic Beasts', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donecin elit interdum, accumsan est et, consectetur justo.', 'ISBN 92-123456711', 140000, 14, 3, 3, 3),
(9, 'BloodMoon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 93-1234567811', 70000, 55, 4, 4, 4),
(10, 'Dragon Ball Z', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 94-12345678911', 25000, 100, 5, 5, 5),
(11, 'the Rat in the Wall', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 90-1234555', 40000, 30, 1, 1, 1),
(12, 'The Silmarillion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 91-12345666', 350000, 10, 2, 2, 2),
(13, 'Beedle the Bard', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 92-123456777', 30000, 5, 3, 3, 3),
(14, 'Fire and blood', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 93-1234567888', 180000, 80, 4, 4, 4),
(15, 'Tate No Yusha', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 94-12345678999', 5000, 150, 5, 5, 5),
(16, 'Tangananica book', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet loremelit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 5', 15000, 15, 1, 1, 1),
(17, 'el libro rojo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 4', 40000, 25, 2, 2, 2),
(18, 'el libro verde', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 3', 10000, 35, 3, 3, 3),
(19, 'Tanganana Book', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 2', 8000, 10, 4, 4, 4),
(20, 'Cronicas Kai', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec in elit interdum, accumsan est et, consectetur justo.', 'ISBN 1', 5000, 120, 5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_category`
--

CREATE TABLE `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(16, 5),
(17, 2),
(17, 3),
(18, 3),
(18, 4),
(19, 2),
(19, 4),
(20, 1),
(20, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Best Seller'),
(2, 'Novelas'),
(3, 'Revistas'),
(4, 'Ensayos'),
(5, 'Documentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Leticia'),
(2, 'Medellin'),
(3, 'Arauca'),
(4, 'Barranquilla'),
(5, 'Santa Marta'),
(6, 'Bogotá'),
(7, 'Cartagena'),
(8, 'Tunja'),
(9, 'Valledupar'),
(10, 'Neiva'),
(11, 'Armenia'),
(12, 'Ibague'),
(13, 'Cúcuta'),
(14, 'Bucaramanga'),
(15, 'Riohacha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `areacode` int(11) DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `shippingpreference` varchar(45) DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id`, `username`, `password`, `name`, `lastname`, `address`, `areacode`, `phone`, `email`, `shippingpreference`, `speciality_id`, `city_id`) VALUES
(1, 'admin', '$2a$10$XjyBni4/IyVmGhIPQckWu.2bxeedYSD0eqkN.nlk9diuMtfNPdRQy', 'Kevin', 'Urieles', 'Cra 7', 65656, 23265, 'admikouta@gmail.com', 'tierra', 2, 5),
(9, 'carmig', '$2a$10$RBrMi7Jm457ewODfqcTP5OoHdR/D2Anv8MRtYiQOdX3K2SRsFlMHq', 'Carlos', 'Campo', 'cra 7', 465656, 1545645, 'admikouta@gmail.com', 'aire', 3, 5),
(10, 'sin', '$2a$10$J2n7YAsiHeNtZLaS8tTOaOIi858L2ZjCCsR.i79FVQuwV2PIlQTba', 'Don', 'sin especial', 'Cra sin especial', 36262556, 20366, 'sinespecialidad@gmail.com', 'aire', NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_orders`
--

CREATE TABLE `client_orders` (
  `client_id` bigint(20) NOT NULL,
  `orders_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditcard`
--

CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `number` varchar(45) NOT NULL,
  `expiration` varchar(45) NOT NULL,
  `ccv` varchar(45) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `creditcard`
--

INSERT INTO `creditcard` (`id`, `client_id`, `number`, `expiration`, `ccv`, `type_id`) VALUES
(2, 1, '2635656', '12/96', '132', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `name`) VALUES
(1, 'Ariel'),
(2, 'Alianza'),
(3, 'McGrawnHill'),
(4, 'Universidad del Magdalena'),
(5, 'Quijote');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(11),
(11),
(11),
(11),
(11),
(11),
(11),
(11),
(11),
(11),
(11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `speciality`
--

CREATE TABLE `speciality` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `speciality`
--

INSERT INTO `speciality` (`id`, `name`) VALUES
(1, 'Quimica'),
(2, 'Historia'),
(3, 'Geografia'),
(4, 'Literatura'),
(5, 'Ficción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Visa'),
(2, 'Master Card'),
(3, 'American Express');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_libro_author1_idx` (`author_id`),
  ADD KEY `fk_libro_editorial1_idx` (`editorial_id`),
  ADD KEY `fk_libro_specialty1_idx` (`speciality_id`);

--
-- Indices de la tabla `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_id`,`category_id`),
  ADD KEY `fk_libro_has_category_category1_idx` (`category_id`),
  ADD KEY `fk_libro_has_category_libro1_idx` (`book_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD KEY `fk_Client_specialty1_idx` (`speciality_id`),
  ADD KEY `fk_Client_city1_idx` (`city_id`);

--
-- Indices de la tabla `client_orders`
--
ALTER TABLE `client_orders`
  ADD PRIMARY KEY (`client_id`,`orders_id`),
  ADD UNIQUE KEY `UK_h6x1ubqvgqnj82atuvlpeiijc` (`orders_id`);

--
-- Indices de la tabla `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`id`,`client_id`),
  ADD KEY `fk_creditCard_Client_idx` (`client_id`),
  ADD KEY `fk_creditCard_type1_idx` (`type_id`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_Client1_idx` (`client_id`);

--
-- Indices de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderDetails_order1_idx` (`order_id`),
  ADD KEY `fk_orderDetails_libro1_idx` (`book_id`);

--
-- Indices de la tabla `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `speciality`
--
ALTER TABLE `speciality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_libro_author1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_editorial1` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_specialty1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `fk_libro_has_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_has_category_libro1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Client_specialty1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `fk_creditCard_Client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_creditCard_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_order_Client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_orderDetails_libro1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderDetails_order1` FOREIGN KEY (`order_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
