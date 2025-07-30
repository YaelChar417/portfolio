-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2025 a las 19:57:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiences`
--

CREATE TABLE `experiences` (
  `start_date` year(4) NOT NULL,
  `end_date` year(4) NOT NULL,
  `ID_type` varchar(40) NOT NULL,
  `ID_generic` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generics`
--

CREATE TABLE `generics` (
  `media` varchar(400) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails`
--

CREATE TABLE `mails` (
  `message` varchar(2000) NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_user` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privileges`
--

CREATE TABLE `privileges` (
  `privilege` varchar(100) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilege_rol`
--

CREATE TABLE `privilege_rol` (
  `ID_rol` varchar(40) NOT NULL,
  `ID_privilege` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `start_date` year(4) NOT NULL,
  `end_date` year(4) DEFAULT NULL,
  `ID_generic` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `title` varchar(20) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE `skills` (
  `experience` tinyint(3) UNSIGNED NOT NULL,
  `ID_generic` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `technologies`
--

CREATE TABLE `technologies` (
  `ID_project` varchar(40) NOT NULL,
  `ID_skill` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_of`
--

CREATE TABLE `type_of` (
  `name` varchar(80) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `mail` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creation_date` date NOT NULL DEFAULT current_timestamp(),
  `name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_rol`
--

CREATE TABLE `user_rol` (
  `ID_rol` varchar(40) NOT NULL,
  `ID_user` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_generic` (`ID_generic`),
  ADD UNIQUE KEY `ID_type` (`ID_type`);

--
-- Indices de la tabla `generics`
--
ALTER TABLE `generics`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_user` (`ID_user`);

--
-- Indices de la tabla `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `privilege_rol`
--
ALTER TABLE `privilege_rol`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_privilege` (`ID_privilege`),
  ADD UNIQUE KEY `ID_rol` (`ID_rol`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_generic` (`ID_generic`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_generic` (`ID_generic`);

--
-- Indices de la tabla `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_skill` (`ID_skill`),
  ADD UNIQUE KEY `ID_project` (`ID_project`);

--
-- Indices de la tabla `type_of`
--
ALTER TABLE `type_of`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `user_rol`
--
ALTER TABLE `user_rol`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_user` (`ID_user`),
  ADD UNIQUE KEY `ID_rol` (`ID_rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_ibfk_1` FOREIGN KEY (`ID_generic`) REFERENCES `generics` (`ID`);

--
-- Filtros para la tabla `mails`
--
ALTER TABLE `mails`
  ADD CONSTRAINT `mails_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID`);

--
-- Filtros para la tabla `privilege_rol`
--
ALTER TABLE `privilege_rol`
  ADD CONSTRAINT `privilege_rol_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rols` (`ID`),
  ADD CONSTRAINT `privilege_rol_ibfk_2` FOREIGN KEY (`ID_privilege`) REFERENCES `privileges` (`ID`);

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`ID_generic`) REFERENCES `generics` (`ID`);

--
-- Filtros para la tabla `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`ID_generic`) REFERENCES `generics` (`ID`);

--
-- Filtros para la tabla `technologies`
--
ALTER TABLE `technologies`
  ADD CONSTRAINT `technologies_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `projects` (`ID`),
  ADD CONSTRAINT `technologies_ibfk_2` FOREIGN KEY (`ID_skill`) REFERENCES `skills` (`ID`);

--
-- Filtros para la tabla `type_of`
--
ALTER TABLE `type_of`
  ADD CONSTRAINT `type_of_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `experiences` (`ID_type`);

--
-- Filtros para la tabla `user_rol`
--
ALTER TABLE `user_rol`
  ADD CONSTRAINT `user_rol_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `user_rol_ibfk_2` FOREIGN KEY (`ID_rol`) REFERENCES `rols` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
