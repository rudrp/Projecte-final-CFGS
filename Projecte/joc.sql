-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-02-2015 a las 20:57:05
-- Versión del servidor: 5.5.38
-- Versión de PHP: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `joc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authassignment`
--

CREATE TABLE IF NOT EXISTS `cruge_authassignment` (
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  `itemname` varchar(64) NOT NULL,
  PRIMARY KEY (`userid`,`itemname`),
  KEY `fk_cruge_authassignment_cruge_authitem1` (`itemname`),
  KEY `fk_cruge_authassignment_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_authassignment`
--

INSERT INTO `cruge_authassignment` (`userid`, `bizrule`, `data`, `itemname`) VALUES
(3, NULL, 'N;', 'jugadors'),
(5, NULL, 'N;', 'jugadors'),
(6, NULL, 'N;', 'jugadors'),
(7, NULL, 'N;', 'jugadors'),
(8, NULL, 'N;', 'jugadors'),
(9, NULL, 'N;', 'jugadors');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authitem`
--

CREATE TABLE IF NOT EXISTS `cruge_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_authitem`
--

INSERT INTO `cruge_authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('action_joc_actualitza', 0, '', NULL, 'N;'),
('action_joc_index', 0, '', NULL, 'N;'),
('action_joc_reload', 0, '', NULL, 'N;'),
('action_partida_admin', 0, '', NULL, 'N;'),
('action_partida_create', 0, '', NULL, 'N;'),
('action_partida_delete', 0, '', NULL, 'N;'),
('action_partida_index', 0, '', NULL, 'N;'),
('action_partida_update', 0, '', NULL, 'N;'),
('action_partida_view', 0, '', NULL, 'N;'),
('action_ranking_admin', 0, '', NULL, 'N;'),
('action_ranking_create', 0, '', NULL, 'N;'),
('action_ranking_delete', 0, '', NULL, 'N;'),
('action_ranking_index', 0, '', NULL, 'N;'),
('action_ranking_update', 0, '', NULL, 'N;'),
('action_ranking_view', 0, '', NULL, 'N;'),
('action_site_benvingut', 0, '', NULL, 'N;'),
('action_site_contact', 0, '', NULL, 'N;'),
('action_site_error', 0, '', NULL, 'N;'),
('action_site_index', 0, '', NULL, 'N;'),
('action_site_login', 0, '', NULL, 'N;'),
('action_site_logout', 0, '', NULL, 'N;'),
('action_usuaris_admin', 0, '', NULL, 'N;'),
('action_usuaris_create', 0, '', NULL, 'N;'),
('action_usuaris_delete', 0, '', NULL, 'N;'),
('action_usuaris_index', 0, '', NULL, 'N;'),
('action_usuaris_update', 0, '', NULL, 'N;'),
('action_usuaris_view', 0, '', NULL, 'N;'),
('controller_joc', 0, '', NULL, 'N;'),
('controller_partida', 0, '', NULL, 'N;'),
('controller_ranking', 0, '', NULL, 'N;'),
('controller_site', 0, '', NULL, 'N;'),
('controller_usuaris', 0, '', NULL, 'N;'),
('jugadors', 2, 'iniciar partida', '', 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authitemchild`
--

CREATE TABLE IF NOT EXISTS `cruge_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_authitemchild`
--

INSERT INTO `cruge_authitemchild` (`parent`, `child`) VALUES
('jugadors', 'action_joc_actualitza'),
('jugadors', 'action_joc_index'),
('jugadors', 'action_joc_reload'),
('jugadors', 'controller_joc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_field`
--

CREATE TABLE IF NOT EXISTS `cruge_field` (
  `idfield` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(20) NOT NULL,
  `longname` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `required` int(11) DEFAULT '0',
  `fieldtype` int(11) DEFAULT '0',
  `fieldsize` int(11) DEFAULT '20',
  `maxlength` int(11) DEFAULT '45',
  `showinreports` int(11) DEFAULT '0',
  `useregexp` varchar(512) DEFAULT NULL,
  `useregexpmsg` varchar(512) DEFAULT NULL,
  `predetvalue` mediumblob,
  PRIMARY KEY (`idfield`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_fieldvalue`
--

CREATE TABLE IF NOT EXISTS `cruge_fieldvalue` (
  `idfieldvalue` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idfield` int(11) NOT NULL,
  `value` blob,
  PRIMARY KEY (`idfieldvalue`),
  KEY `fk_cruge_fieldvalue_cruge_user1` (`iduser`),
  KEY `fk_cruge_fieldvalue_cruge_field1` (`idfield`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_session`
--

CREATE TABLE IF NOT EXISTS `cruge_session` (
  `idsession` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `created` bigint(30) DEFAULT NULL,
  `expire` bigint(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ipaddress` varchar(45) DEFAULT NULL,
  `usagecount` int(11) DEFAULT '0',
  `lastusage` bigint(30) DEFAULT NULL,
  `logoutdate` bigint(30) DEFAULT NULL,
  `ipaddressout` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsession`),
  KEY `crugesession_iduser` (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=207 ;

--
-- Volcado de datos para la tabla `cruge_session`
--

INSERT INTO `cruge_session` (`idsession`, `iduser`, `created`, `expire`, `status`, `ipaddress`, `usagecount`, `lastusage`, `logoutdate`, `ipaddressout`) VALUES
(1, 1, 1399498061, 1399499861, 0, '192.168.1.33', 1, 1399498061, 1399498134, '192.168.1.33'),
(2, 1, 1399557711, 1399559511, 0, '10.5.10.27', 1, 1399557711, 1399557795, '10.5.10.27'),
(3, 1, 1399557820, 1399559620, 0, '10.5.10.27', 1, 1399557820, 1399558846, '10.5.10.27'),
(4, 1, 1399558891, 1399560691, 0, '10.5.10.27', 1, 1399558891, NULL, NULL),
(5, 1, 1399561747, 1399563547, 1, '10.5.10.27', 1, 1399561747, NULL, NULL),
(6, 1, 1399564764, 1399566564, 0, '10.5.10.27', 1, 1399564764, 1399564769, '10.5.10.27'),
(7, 1, 1399569432, 1399571232, 1, '10.5.34.15', 1, 1399569432, NULL, NULL),
(8, 1, 1400010387, 1400012187, 0, '::1', 1, 1400010387, NULL, NULL),
(9, 1, 1400012304, 1400014104, 0, '127.0.0.1', 2, 1400013427, NULL, NULL),
(10, 1, 1400014172, 1400015972, 0, '::1', 2, 1400014351, 1400015105, '::1'),
(11, 1, 1400015208, 1400017008, 0, '::1', 1, 1400015208, 1400015525, '::1'),
(12, 1, 1400015530, 1400017330, 0, '::1', 1, 1400015530, 1400015537, '::1'),
(13, 1, 1400015548, 1400017348, 0, '::1', 1, 1400015548, 1400015555, '::1'),
(14, 1, 1400015563, 1400017363, 0, '::1', 1, 1400015563, 1400016000, '::1'),
(15, 1, 1400016674, 1400018474, 0, '::1', 1, 1400016674, NULL, NULL),
(16, 3, 1400017207, 1400019007, 1, '::1', 1, 1400017207, NULL, NULL),
(17, 1, 1400018575, 1400020375, 1, '::1', 1, 1400018575, NULL, NULL),
(18, 1, 1400082785, 1400084585, 0, '127.0.0.1', 1, 1400082785, 1400082824, '127.0.0.1'),
(19, 1, 1400083219, 1400085019, 0, '127.0.0.1', 1, 1400083219, 1400083559, '127.0.0.1'),
(20, 1, 1400084185, 1400085985, 0, '127.0.0.1', 1, 1400084185, 1400084189, '127.0.0.1'),
(21, 1, 1400084631, 1400086431, 0, '127.0.0.1', 1, 1400084631, 1400084655, '127.0.0.1'),
(22, 1, 1400084741, 1400086541, 0, '127.0.0.1', 1, 1400084741, 1400084811, '127.0.0.1'),
(23, 1, 1400084835, 1400086635, 0, '127.0.0.1', 1, 1400084835, 1400084864, '127.0.0.1'),
(24, 1, 1400084874, 1400086674, 0, '127.0.0.1', 3, 1400086269, 1400086668, '127.0.0.1'),
(25, 4, 1400086761, 1400088561, 1, '127.0.0.1', 1, 1400086761, NULL, NULL),
(26, 1, 1400086796, 1400088596, 0, '127.0.0.1', 1, 1400086796, NULL, NULL),
(27, 3, 1400086987, 1400088787, 0, '127.0.0.1', 1, 1400086987, 1400087371, '127.0.0.1'),
(28, 3, 1400087377, 1400089177, 1, '127.0.0.1', 1, 1400087377, NULL, NULL),
(29, 1, 1400091915, 1400093715, 0, '127.0.0.1', 2, 1400092087, 1400092089, '127.0.0.1'),
(30, 3, 1400092096, 1400093896, 0, '127.0.0.1', 1, 1400092096, NULL, NULL),
(31, 1, 1400092120, 1400093920, 0, '127.0.0.1', 1, 1400092120, NULL, NULL),
(32, 1, 1400094001, 1400095801, 0, '127.0.0.1', 2, 1400094183, 1400094251, '127.0.0.1'),
(33, 3, 1400094263, 1400096063, 0, '127.0.0.1', 1, 1400094263, NULL, NULL),
(34, 1, 1400094300, 1400096100, 0, '127.0.0.1', 2, 1400096100, NULL, NULL),
(35, 1, 1400096110, 1400097910, 1, '127.0.0.1', 1, 1400096110, NULL, NULL),
(36, 3, 1400096136, 1400097936, 1, '127.0.0.1', 1, 1400096136, NULL, NULL),
(37, 1, 1400105225, 1400107025, 0, '::1', 1, 1400105225, 1400105422, '::1'),
(38, 1, 1400167839, 1400169639, 0, '10.5.10.27', 2, 1400168662, NULL, NULL),
(39, 3, 1400167969, 1400169769, 0, '10.5.34.15', 2, 1400168809, NULL, NULL),
(40, 1, 1400169673, 1400171473, 0, '10.5.34.15', 2, 1400170350, 1400170364, '10.5.34.15'),
(41, 3, 1400169948, 1400171748, 0, '10.5.34.15', 1, 1400169948, 1400170338, '10.5.34.15'),
(42, 3, 1400170375, 1400172175, 0, '10.5.34.15', 1, 1400170375, NULL, NULL),
(43, 1, 1400170393, 1400172193, 0, '10.5.34.15', 3, 1400170774, NULL, NULL),
(44, 1, 1400174567, 1400176367, 0, '10.5.10.27', 3, 1400174787, 1400174998, '10.5.10.27'),
(45, 3, 1400174626, 1400176426, 0, '10.5.34.15', 1, 1400174626, NULL, NULL),
(46, 1, 1400175005, 1400176805, 0, '10.5.10.27', 1, 1400175005, 1400175135, '10.5.10.27'),
(47, 1, 1400176643, 1400178443, 0, '10.5.34.15', 1, 1400176643, 1400178442, '10.5.34.15'),
(48, 1, 1400178451, 1400180251, 0, '10.5.34.15', 1, 1400178451, 1400178528, '10.5.34.15'),
(49, 1, 1400178702, 1400180502, 0, '10.5.34.15', 1, 1400178702, 1400180400, '10.5.34.15'),
(50, 1, 1400180565, 1400182365, 0, '10.5.34.15', 1, 1400180565, 1400180829, '10.5.34.15'),
(51, 1, 1400180844, 1400182644, 0, '10.5.34.15', 1, 1400180844, 1400180848, '10.5.34.15'),
(52, 1, 1400180909, 1400182709, 0, '10.5.34.15', 1, 1400180909, 1400181424, '10.5.34.15'),
(53, 1, 1400181879, 1400183679, 0, '10.5.34.15', 1, 1400181879, 1400182351, '10.5.34.15'),
(54, 1, 1400182489, 1400184289, 1, '10.5.34.15', 1, 1400182489, NULL, NULL),
(55, 1, 1400248325, 1400250125, 0, '10.5.34.15', 1, 1400248325, NULL, NULL),
(56, 1, 1400251980, 1400253780, 0, '10.5.34.15', 1, 1400251980, NULL, NULL),
(57, 1, 1400254088, 1400255888, 0, '10.5.34.15', 2, 1400254221, 1400255222, '10.5.10.27'),
(58, 1, 1400255390, 1400257190, 0, '10.5.34.15', 2, 1400255404, 1400255764, '10.5.10.27'),
(59, 1, 1400255965, 1400257765, 0, '10.5.10.27', 2, 1400256005, 1400256202, '10.5.34.15'),
(60, 1, 1400256217, 1400258017, 0, '10.5.34.15', 2, 1400256535, 1400256537, '10.5.34.15'),
(61, 3, 1400256239, 1400258039, 0, '10.5.34.15', 3, 1400256545, 1400256613, '10.5.34.15'),
(62, 1, 1400256547, 1400258347, 0, '10.5.10.27', 1, 1400256547, 1400256614, '10.5.10.27'),
(63, 3, 1400256673, 1400258473, 0, '10.5.34.15', 1, 1400256673, NULL, NULL),
(64, 1, 1400256675, 1400258475, 0, '10.5.10.27', 1, 1400256675, NULL, NULL),
(65, 1, 1400260678, 1400262478, 0, '10.5.34.15', 1, 1400260678, 1400260684, '10.5.34.15'),
(66, 1, 1400260693, 1400262493, 0, '10.5.10.27', 1, 1400260693, 1400260938, '10.5.10.27'),
(67, 3, 1400260842, 1400262642, 0, '10.5.34.15', 1, 1400260842, 1400260854, '10.5.34.15'),
(68, 5, 1400260975, 1400262775, 0, '10.5.34.15', 2, 1400261337, 1400262041, '10.5.10.27'),
(69, 1, 1400261032, 1400262832, 0, '10.5.34.15', 1, 1400261032, 1400261221, '10.5.34.15'),
(70, 1, 1400261324, 1400263124, 0, '10.5.34.15', 1, 1400261324, 1400261327, '10.5.34.15'),
(71, 1, 1400262050, 1400263850, 0, '10.5.10.27', 1, 1400262050, 1400262070, '10.5.10.27'),
(72, 5, 1400262055, 1400263855, 0, '10.5.34.15', 1, 1400262055, 1400262230, '10.5.34.15'),
(73, 1, 1400262082, 1400263882, 0, '10.5.10.27', 1, 1400262082, 1400262630, '10.5.10.27'),
(74, 3, 1400262237, 1400264037, 0, '10.5.34.15', 1, 1400262237, 1400262278, '10.5.34.15'),
(75, 5, 1400262295, 1400264095, 0, '10.5.34.15', 1, 1400262295, 1400262402, '10.5.34.15'),
(76, 6, 1400262496, 1400264296, 0, '10.5.34.15', 1, 1400262496, 1400262553, '10.5.34.15'),
(77, 7, 1400262606, 1400264406, 0, '10.5.34.15', 1, 1400262606, NULL, NULL),
(78, 6, 1400262663, 1400264463, 0, '10.5.10.27', 1, 1400262663, 1400263529, '10.5.10.27'),
(79, 8, 1400263106, 1400264906, 0, '10.5.10.27', 2, 1400264071, 1400264192, '10.5.10.27'),
(80, 9, 1400263285, 1400265085, 0, '10.5.34.15', 1, 1400263285, 1400263319, '10.5.34.15'),
(81, 9, 1400263349, 1400265149, 0, '10.5.34.15', 1, 1400263349, 1400263371, '10.5.34.15'),
(82, 9, 1400263397, 1400265197, 1, '10.5.34.15', 1, 1400263397, NULL, NULL),
(83, 8, 1400264208, 1400266008, 0, '10.5.10.27', 1, 1400264208, NULL, NULL),
(84, 7, 1400264733, 1400266533, 0, '10.5.34.15', 1, 1400264733, 1400266032, '10.5.34.15'),
(85, 7, 1400266046, 1400267846, 1, '10.5.34.15', 1, 1400266046, NULL, NULL),
(86, 7, 1400415512, 1400417312, 0, '192.168.1.37', 2, 1400415909, NULL, NULL),
(87, 9, 1400415530, 1400417330, 0, '192.168.1.33', 2, 1400417170, NULL, NULL),
(88, 9, 1400419463, 1400421263, 0, '192.168.1.33', 1, 1400419463, NULL, NULL),
(89, 7, 1400419498, 1400421298, 0, '192.168.1.37', 1, 1400419498, NULL, NULL),
(90, 7, 1400421356, 1400423156, 0, '192.168.1.37', 1, 1400421356, NULL, NULL),
(91, 9, 1400421363, 1400423163, 0, '192.168.1.33', 1, 1400421363, 1400421693, '192.168.1.33'),
(92, 9, 1400421705, 1400423505, 1, '192.168.1.33', 1, 1400421705, NULL, NULL),
(93, 9, 1400425309, 1400427109, 0, '192.168.1.33', 1, 1400425309, NULL, NULL),
(94, 7, 1400425349, 1400427149, 1, '192.168.1.37', 1, 1400425349, NULL, NULL),
(95, 7, 1400427555, 1400429355, 1, '127.0.0.1', 2, 1400428934, NULL, NULL),
(96, 9, 1400427613, 1400429413, 0, '192.168.1.37', 4, 1400428730, NULL, NULL),
(97, 7, 1400429376, 1400431176, 0, '192.168.1.33', 3, 1400429949, NULL, NULL),
(98, 9, 1400429530, 1400431330, 0, '192.168.1.37', 1, 1400429530, NULL, NULL),
(99, 7, 1400431285, 1400433085, 0, '192.168.1.33', 2, 1400431683, NULL, NULL),
(100, 9, 1400431370, 1400433170, 0, '192.168.1.37', 1, 1400431370, NULL, NULL),
(101, 7, 1400437686, 1400439486, 0, '192.168.1.33', 1, 1400437686, NULL, NULL),
(102, 9, 1400437988, 1400439788, 0, '192.168.1.37', 1, 1400437988, NULL, NULL),
(103, 7, 1400439499, 1400441299, 1, '192.168.1.33', 1, 1400439499, NULL, NULL),
(104, 9, 1400439831, 1400441631, 1, '192.168.1.37', 1, 1400439831, NULL, NULL),
(105, 7, 1400441833, 1400443633, 0, '192.168.1.44', 3, 1400442712, NULL, NULL),
(106, 9, 1400441846, 1400443646, 0, '192.168.1.40', 1, 1400441846, NULL, NULL),
(107, 7, 1400443766, 1400445566, 0, '192.168.1.44', 1, 1400443766, NULL, NULL),
(108, 9, 1400443781, 1400445581, 0, '192.168.1.40', 1, 1400443781, NULL, NULL),
(109, 7, 1400445826, 1400447626, 0, '192.168.1.44', 1, 1400445826, NULL, NULL),
(110, 9, 1400445841, 1400447641, 0, '192.168.1.40', 1, 1400445841, NULL, NULL),
(111, 7, 1400447660, 1400449460, 0, '192.168.1.44', 1, 1400447660, NULL, NULL),
(112, 9, 1400447679, 1400449479, 0, '192.168.1.40', 1, 1400447679, NULL, NULL),
(113, 7, 1400449482, 1400451282, 0, '192.168.1.44', 1, 1400449482, NULL, NULL),
(114, 9, 1400449700, 1400451500, 0, '192.168.1.40', 1, 1400449700, NULL, NULL),
(115, 7, 1400451306, 1400453106, 0, '192.168.1.44', 1, 1400451306, NULL, NULL),
(116, 9, 1400451582, 1400453382, 0, '192.168.1.40', 1, 1400451582, NULL, NULL),
(117, 7, 1400455355, 1400457155, 1, '192.168.1.44', 1, 1400455355, NULL, NULL),
(118, 9, 1400456113, 1400457913, 1, '192.168.1.41', 1, 1400456113, NULL, NULL),
(119, 7, 1400497172, 1400498972, 0, '192.168.1.44', 1, 1400497172, NULL, NULL),
(120, 9, 1400497182, 1400498982, 0, '192.168.1.40', 1, 1400497182, NULL, NULL),
(121, 7, 1400498981, 1400500781, 0, '192.168.1.44', 1, 1400498981, NULL, NULL),
(122, 9, 1400499059, 1400500859, 1, '192.168.1.40', 1, 1400499059, NULL, NULL),
(123, 7, 1400509470, 1400511270, 0, '10.5.34.15', 1, 1400509470, 1400509570, '10.5.34.15'),
(124, 9, 1400509527, 1400511327, 1, '10.5.34.15', 2, 1400509576, NULL, NULL),
(125, 8, 1400510212, 1400512012, 1, '10.5.10.27', 1, 1400510212, NULL, NULL),
(126, 7, 1400514030, 1400515830, 0, '10.5.34.15', 1, 1400514030, 1400514118, '10.5.34.15'),
(127, 8, 1400514041, 1400515841, 0, '10.5.10.27', 1, 1400514041, NULL, NULL),
(128, 9, 1400514125, 1400515925, 0, '10.5.34.15', 1, 1400514125, NULL, NULL),
(129, 9, 1400532858, 1400534658, 0, '192.168.1.40', 2, 1400533415, NULL, NULL),
(130, 7, 1400532863, 1400534663, 0, '192.168.1.44', 2, 1400533420, NULL, NULL),
(131, 9, 1400534684, 1400536484, 0, '192.168.1.40', 1, 1400534684, NULL, NULL),
(132, 7, 1400534700, 1400536500, 0, '192.168.1.44', 1, 1400534700, NULL, NULL),
(133, 9, 1400536724, 1400538524, 0, '192.168.1.40', 1, 1400536724, NULL, NULL),
(134, 7, 1400536729, 1400538529, 0, '192.168.1.44', 1, 1400536729, NULL, NULL),
(135, 7, 1400538559, 1400540359, 0, '192.168.1.40', 1, 1400538559, NULL, NULL),
(136, 9, 1400538574, 1400540374, 0, '192.168.1.44', 1, 1400538574, NULL, NULL),
(137, 7, 1400540435, 1400542235, 1, '192.168.1.44', 1, 1400540435, NULL, NULL),
(138, 9, 1400540445, 1400542245, 1, '192.168.1.40', 1, 1400540445, NULL, NULL),
(139, 8, 1400606641, 1400608441, 1, '10.5.10.27', 1, 1400606641, NULL, NULL),
(140, 7, 1400606643, 1400608443, 0, '10.5.34.15', 1, 1400606643, NULL, NULL),
(141, 7, 1400677145, 1400678945, 1, '10.182.28.30', 1, 1400677145, NULL, NULL),
(142, 8, 1400693425, 1400695225, 1, '10.5.10.27', 1, 1400693425, NULL, NULL),
(143, 7, 1400693549, 1400695349, 1, '10.5.34.15', 1, 1400693549, NULL, NULL),
(144, 8, 1400699697, 1400701497, 1, '10.5.10.27', 1, 1400699697, NULL, NULL),
(145, 7, 1400699700, 1400701500, 1, '10.5.34.15', 1, 1400699700, NULL, NULL),
(146, 7, 1400769595, 1400771395, 0, '10.5.34.15', 1, 1400769595, NULL, NULL),
(147, 7, 1400773312, 1400775112, 0, '10.5.34.15', 1, 1400773312, 1400775075, '10.5.34.15'),
(148, 9, 1400773598, 1400775398, 0, '10.5.34.15', 5, 1400775082, 1400775369, '10.5.34.15'),
(149, 8, 1400774800, 1400776600, 0, '10.5.34.15', 1, 1400774800, 1400774804, '10.5.34.15'),
(150, 8, 1400774918, 1400776718, 0, '10.5.34.15', 2, 1400775376, NULL, NULL),
(151, 7, 1400775408, 1400777208, 1, '10.5.34.15', 2, 1400775447, NULL, NULL),
(152, 7, 1400786750, 1400788550, 0, '192.168.1.40', 2, 1400787321, 1400787332, '192.168.1.44'),
(153, 9, 1400787338, 1400789138, 0, '192.168.1.44', 1, 1400787338, NULL, NULL),
(154, 7, 1400787379, 1400789179, 0, '192.168.1.40', 1, 1400787379, NULL, NULL),
(155, 7, 1400865756, 1400867556, 0, '10.5.34.15', 1, 1400865756, NULL, NULL),
(156, 8, 1400866894, 1400868694, 1, '10.5.10.27', 1, 1400866894, NULL, NULL),
(157, 7, 1400868532, 1400870332, 1, '10.5.34.15', 1, 1400868532, NULL, NULL),
(158, 7, 1400949126, 1400950926, 0, '192.168.1.44', 2, 1400949888, NULL, NULL),
(159, 9, 1400949143, 1400950943, 0, '192.168.1.40', 1, 1400949143, NULL, NULL),
(160, 7, 1400950954, 1400952754, 0, '192.168.1.44', 1, 1400950954, NULL, NULL),
(161, 9, 1400951876, 1400953676, 0, '192.168.1.40', 1, 1400951876, NULL, NULL),
(162, 7, 1400953009, 1400954809, 0, '192.168.1.44', 1, 1400953009, NULL, NULL),
(163, 9, 1400953708, 1400955508, 0, '192.168.1.40', 1, 1400953708, NULL, NULL),
(164, 7, 1400955067, 1400956867, 0, '192.168.1.44', 1, 1400955067, NULL, NULL),
(165, 9, 1400955601, 1400957401, 0, '192.168.1.40', 1, 1400955601, NULL, NULL),
(166, 7, 1400957097, 1400958897, 0, '192.168.1.44', 1, 1400957097, NULL, NULL),
(167, 9, 1400957417, 1400959217, 0, '192.168.1.40', 1, 1400957417, NULL, NULL),
(168, 7, 1400959117, 1400960917, 0, '192.168.1.44', 1, 1400959117, NULL, NULL),
(169, 9, 1400959265, 1400961065, 0, '192.168.1.40', 1, 1400959265, NULL, NULL),
(170, 7, 1400961947, 1400963747, 0, '192.168.1.44', 1, 1400961947, NULL, NULL),
(171, 9, 1400961957, 1400963757, 0, '192.168.1.40', 1, 1400961957, NULL, NULL),
(172, 9, 1401016028, 1401017828, 0, '192.168.1.40', 1, 1401016028, NULL, NULL),
(173, 7, 1401016042, 1401017842, 0, '192.168.1.44', 1, 1401016042, NULL, NULL),
(174, 9, 1401017947, 1401019747, 0, '192.168.1.40', 1, 1401017947, NULL, NULL),
(175, 7, 1401017972, 1401019772, 0, '192.168.1.44', 1, 1401017972, NULL, NULL),
(176, 9, 1401019818, 1401021618, 0, '192.168.1.40', 1, 1401019818, NULL, NULL),
(177, 7, 1401019827, 1401021627, 0, '192.168.1.44', 1, 1401019827, NULL, NULL),
(178, 7, 1401021645, 1401023445, 0, '192.168.1.44', 1, 1401021645, 1401022333, '192.168.1.44'),
(179, 9, 1401021659, 1401023459, 0, '192.168.1.40', 1, 1401021659, NULL, NULL),
(180, 8, 1401022340, 1401024140, 0, '192.168.1.44', 1, 1401022340, NULL, NULL),
(181, 7, 1401025538, 1401027338, 0, '192.168.1.44', 1, 1401025538, 1401026524, '192.168.1.44'),
(182, 9, 1401026529, 1401028329, 0, '192.168.1.44', 1, 1401026529, 1401026531, '192.168.1.44'),
(183, 8, 1401026539, 1401028339, 0, '192.168.1.44', 1, 1401026539, NULL, NULL),
(184, 9, 1401026777, 1401028577, 0, '192.168.1.40', 1, 1401026777, NULL, NULL),
(185, 7, 1401028369, 1401030169, 0, '192.168.1.44', 2, 1401029611, NULL, NULL),
(186, 9, 1401028612, 1401030412, 0, '192.168.1.40', 1, 1401028612, NULL, NULL),
(187, 7, 1401030269, 1401032069, 0, '192.168.1.40', 2, 1401030450, 1401030496, '192.168.1.44'),
(188, 9, 1401030503, 1401032303, 0, '192.168.1.44', 1, 1401030503, NULL, NULL),
(189, 7, 1401030513, 1401032313, 0, '192.168.1.40', 1, 1401030513, 1401032056, '192.168.1.40'),
(190, 8, 1401032095, 1401033895, 0, '192.168.1.40', 2, 1401032877, NULL, NULL),
(191, 9, 1401032371, 1401034171, 0, '192.168.1.41', 2, 1401033286, NULL, NULL),
(192, 7, 1401039479, 1401041279, 0, '192.168.1.44', 1, 1401039479, NULL, NULL),
(193, 7, 1401056947, 1401058747, 1, '192.168.1.40', 1, 1401056947, NULL, NULL),
(194, 7, 1401118955, 1401120755, 0, '10.5.34.15', 2, 1401119017, NULL, NULL),
(195, 7, 1401120821, 1401122621, 0, '10.5.34.15', 1, 1401120821, NULL, NULL),
(196, 7, 1401123934, 1401125734, 0, '10.5.34.15', 1, 1401123934, NULL, NULL),
(197, 7, 1401125767, 1401127567, 0, '10.5.34.15', 1, 1401125767, NULL, NULL),
(198, 7, 1401127580, 1401129380, 0, '10.5.34.15', 1, 1401127580, NULL, NULL),
(199, 7, 1401129460, 1401131260, 0, '10.5.34.15', 1, 1401129460, NULL, NULL),
(200, 7, 1401131491, 1401133291, 0, '10.5.34.15', 1, 1401131491, NULL, NULL),
(201, 7, 1401139133, 1401140933, 0, '192.168.1.44', 1, 1401139133, NULL, NULL),
(202, 7, 1401140972, 1401142772, 0, '192.168.1.44', 1, 1401140972, NULL, NULL),
(203, 7, 1401142796, 1401144596, 0, '192.168.1.44', 1, 1401142796, NULL, NULL),
(204, 8, 1401144093, 1401145893, 1, '192.168.1.40', 1, 1401144093, NULL, NULL),
(205, 7, 1401144676, 1401146476, 0, '192.168.1.44', 1, 1401144676, NULL, NULL),
(206, 7, 1423770945, 1423772745, 1, '::1', 1, 1423770945, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_system`
--

CREATE TABLE IF NOT EXISTS `cruge_system` (
  `idsystem` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `largename` varchar(45) DEFAULT NULL,
  `sessionmaxdurationmins` int(11) DEFAULT '30',
  `sessionmaxsameipconnections` int(11) DEFAULT '10',
  `sessionreusesessions` int(11) DEFAULT '1' COMMENT '1yes 0no',
  `sessionmaxsessionsperday` int(11) DEFAULT '-1',
  `sessionmaxsessionsperuser` int(11) DEFAULT '-1',
  `systemnonewsessions` int(11) DEFAULT '0' COMMENT '1yes 0no',
  `systemdown` int(11) DEFAULT '0',
  `registerusingcaptcha` int(11) DEFAULT '0',
  `registerusingterms` int(11) DEFAULT '0',
  `terms` blob,
  `registerusingactivation` int(11) DEFAULT '1',
  `defaultroleforregistration` varchar(64) DEFAULT NULL,
  `registerusingtermslabel` varchar(100) DEFAULT NULL,
  `registrationonlogin` int(11) DEFAULT '1',
  PRIMARY KEY (`idsystem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cruge_system`
--

INSERT INTO `cruge_system` (`idsystem`, `name`, `largename`, `sessionmaxdurationmins`, `sessionmaxsameipconnections`, `sessionreusesessions`, `sessionmaxsessionsperday`, `sessionmaxsessionsperuser`, `systemnonewsessions`, `systemdown`, `registerusingcaptcha`, `registerusingterms`, `terms`, `registerusingactivation`, `defaultroleforregistration`, `registerusingtermslabel`, `registrationonlogin`) VALUES
(1, 'default', NULL, 30, 10, 1, -1, -1, 0, 0, 1, 1, 0x4163657065726572, 0, 'jugadors', 'Hola', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_user`
--

CREATE TABLE IF NOT EXISTS `cruge_user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `regdate` bigint(30) DEFAULT NULL,
  `actdate` bigint(30) DEFAULT NULL,
  `logondate` bigint(30) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'Hashed password',
  `authkey` varchar(100) DEFAULT NULL COMMENT 'llave de autentificacion',
  `state` int(11) DEFAULT '0',
  `totalsessioncounter` int(11) DEFAULT '0',
  `currentsessioncounter` int(11) DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `cruge_user`
--

INSERT INTO `cruge_user` (`iduser`, `hash`, `regdate`, `actdate`, `logondate`, `username`, `email`, `password`, `authkey`, `state`, `totalsessioncounter`, `currentsessioncounter`) VALUES
(1, '', NULL, NULL, 1400262082, 'adminbck', 'admin@tucorreo.com', '123456', NULL, 1, 0, 0),
(2, '', NULL, NULL, NULL, 'invitado', 'invitado', 'nopassword', NULL, 1, 0, 0),
(3, '', 1400017169, NULL, 1400262237, 'sara', 'sara@daw.com', '94d0f8cf', 'c5ea1a721c25a62a97cf74449a04533f', 1, 0, 0),
(5, '', 1400260962, NULL, 1400262295, 'kaka', 'kaka@kaka.com', '123456', 'b6e5e94e62d5d83104ada653ad2b9d24', 1, 0, 0),
(6, '', 1400262489, NULL, 1400262663, 'manolo', 'manolo@manolo.com', 'e10adc3949ba59abbe56e057f20f883e', '140375e90464cc6746aaabeb4a0420a8', 1, 0, 0),
(7, '2gemvaml0u0oogvi', 1400262600, NULL, 1423770945, 'admin', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', '30f76a200bd10b24d9360110ea94dfa7', 1, 0, 0),
(8, 'cr8avelnj5v4e7b9', 1400263084, NULL, 1401144093, 'guille', 'guille@tucorreo.com', '63b4f252da3eb0e674b7298aeee97d9b', '73f562935e04dadf4772d18450cbe489', 1, 0, 0),
(9, 'u7wb0zwlomt2o6r', 1400263275, NULL, 1401033286, 'marisa', 'marisa@marisa.com', 'c21b6a13d68b58cd46df1f0c60d157fa', 'be546b6ebf031ae57ff394ca307f2c71', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE IF NOT EXISTS `partida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `enemics` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL,
  `loser_id` int(11) NOT NULL,
  `temps` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuari_id` int(11) NOT NULL,
  `usuari_guanyades_id` int(11) NOT NULL,
  `usuari_perdudes_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ranking`
--

INSERT INTO `ranking` (`id`, `usuari_id`, `usuari_guanyades_id`, `usuari_perdudes_id`, `score`) VALUES
(1, 1, 2, 1, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE IF NOT EXISTS `usuaris` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `cognom` text NOT NULL,
  `nick` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `permis` int(2) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id`, `nom`, `cognom`, `nick`, `email`, `password`, `permis`, `hash`) VALUES
(1, 'Pepe', 'Aldillo', 'pepito', 'cabeza@gmail.com', '123456', 1, '8bpf8jsxiwtrzfr'),
(3, 'marc', 'marc', 'marc', '', 'sda', 1, 'reooradvdp5pnwmi');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cruge_authassignment`
--
ALTER TABLE `cruge_authassignment`
  ADD CONSTRAINT `fk_cruge_authassignment_cruge_authitem1` FOREIGN KEY (`itemname`) REFERENCES `cruge_authitem` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_authassignment_user` FOREIGN KEY (`userid`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cruge_authitemchild`
--
ALTER TABLE `cruge_authitemchild`
  ADD CONSTRAINT `crugeauthitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crugeauthitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cruge_fieldvalue`
--
ALTER TABLE `cruge_fieldvalue`
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_field1` FOREIGN KEY (`idfield`) REFERENCES `cruge_field` (`idfield`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_user1` FOREIGN KEY (`iduser`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
