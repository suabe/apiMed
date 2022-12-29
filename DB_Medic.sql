-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: database
-- Tiempo de generación: 28-12-2022 a las 20:49:40
-- Versión del servidor: 5.7.40
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apiTimClinic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `app_name` varchar(150) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `keys`
--

INSERT INTO `keys` (`id`, `app_id`, `app_name`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'LocalDev', '8BuhX75kJU01RtSBLWDRoAJeqyN17rrv', 1, 0, 0, NULL, 167106394);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'pacientes/paciente', 'put', 'a:19:{s:14:\"Content-Length\";s:3:\"318\";s:10:\"Connection\";s:10:\"keep-alive\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:4:\"Host\";s:14:\"localhost:8181\";s:13:\"Postman-Token\";s:36:\"e4afb9d4-e92c-49c3-b2a5-bcfd98ad8793\";s:6:\"Accept\";s:3:\"*/*\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.30.0\";s:12:\"Content-Type\";s:16:\"application/json\";s:9:\"X-Api-Key\";s:32:\"8BuhX75kJU01RtSBLWDRoAJeqyN17rrv\";s:9:\"NAME_USER\";s:7:\"Ernesto\";s:10:\"P_LASTNAME\";s:6:\"Suarez\";s:10:\"M_LASTNAME\";s:8:\"Gallegos\";s:5:\"EMAIL\";s:21:\"seiyasuabe@icloud.com\";s:12:\"PHONE_NUMBER\";s:10:\"5623714433\";s:9:\"BIRTHDATE\";s:10:\"24/07/1984\";s:6:\"GENDER\";s:6:\"Hombre\";s:14:\"PLACE_OF_BIRTH\";s:4:\"CDMX\";s:14:\"MARITAL_STATUS\";s:7:\"Soltero\";s:8:\"PASSWORD\";s:9:\"NETnet123\";}', '8BuhX75kJU01RtSBLWDRoAJeqyN17rrv', '172.19.0.1', 1672260214, 0.405097, '1', 200),
(2, 'login/paciente', 'post', 'a:11:{s:14:\"Content-Length\";s:2:\"72\";s:10:\"Connection\";s:10:\"keep-alive\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:4:\"Host\";s:14:\"localhost:8181\";s:13:\"Postman-Token\";s:36:\"ef23fb31-7812-4eb5-af5d-6134ffb3a4b9\";s:6:\"Accept\";s:3:\"*/*\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.30.0\";s:12:\"Content-Type\";s:16:\"application/json\";s:9:\"X-Api-Key\";s:32:\"8BuhX75kJU01RtSBLWDRoAJeqyN17rrv\";s:5:\"EMAIL\";s:21:\"seiyasuabe@icloud.com\";s:8:\"PASSWORD\";s:9:\"NETnet123\";}', '8BuhX75kJU01RtSBLWDRoAJeqyN17rrv', '172.19.0.1', 1672260281, 0.251414, '1', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_ADMINS`
--

CREATE TABLE `MA_ADMINS` (
  `ID_ADMIN` int(11) NOT NULL,
  `ADMIN_NAME` varchar(40) NOT NULL,
  `ADMIN_P_LASTNAME` varchar(40) NOT NULL,
  `ADMIN_M_LASTNAME` varchar(40) NOT NULL,
  `ADMIN_EMAIL` varchar(40) NOT NULL,
  `ADMIN_PHONE` varchar(40) NOT NULL,
  `ADMIN_PHONE_ALTER` varchar(40) NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `PLACE_OF_BIRTH` varchar(40) NOT NULL,
  `BIRTHDATE` varchar(40) NOT NULL,
  `PS_ADMIN` varchar(40) NOT NULL,
  `GENDER` varchar(40) NOT NULL,
  `DYNAMIC_KEY` varchar(40) NOT NULL,
  `ID_TYPE_USER` int(11) NOT NULL,
  `ID_SUSPENDED_BY` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `BRANCH_ARRAY` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_APPOINTMENTS`
--

CREATE TABLE `MA_APPOINTMENTS` (
  `ID_APPOINTMENT` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `A_DATE` datetime NOT NULL,
  `A_TIME` varchar(40) NOT NULL,
  `A_EMERGENCY` varchar(120) NOT NULL,
  `A_PAYMENT_REQUIRED` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_SERVICE_TYPE` int(11) NOT NULL,
  `ID_DOCTOR` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_APP_ICON_CATALOG`
--

CREATE TABLE `MA_APP_ICON_CATALOG` (
  `ID_ICON` int(11) NOT NULL,
  `ICON_CODE` varchar(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_APP_NAVIGATION`
--

CREATE TABLE `MA_APP_NAVIGATION` (
  `ID_ITEM` int(11) NOT NULL,
  `ITEM` varchar(40) NOT NULL,
  `ID_APP_TYPE` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_APP_SLIDER`
--

CREATE TABLE `MA_APP_SLIDER` (
  `ID_SLIDE` int(11) NOT NULL,
  `SLIDE_FILE` varchar(160) NOT NULL,
  `SLIDE_TYPE` varchar(120) NOT NULL,
  `SLIDE_POSITION` varchar(10) NOT NULL,
  `ID_TYPE_USER` int(11) NOT NULL,
  `CREATED_BY` varchar(40) NOT NULL,
  `EXPIRATION_DATE` datetime NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_APP_TYPE`
--

CREATE TABLE `MA_APP_TYPE` (
  `ID_APP_TYPE` int(11) NOT NULL,
  `APP_NAME` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_AUTH`
--

CREATE TABLE `MA_AUTH` (
  `ID` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `EMAIL` varchar(80) NOT NULL,
  `PICCTURE` varchar(255) NOT NULL,
  `TYPE` varchar(60) NOT NULL,
  `SALT` varchar(64) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `LAST_LOGIN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `MA_AUTH`
--

INSERT INTO `MA_AUTH` (`ID`, `ID_USER`, `EMAIL`, `PICCTURE`, `TYPE`, `SALT`, `PASSWORD`, `LAST_LOGIN`, `IP`) VALUES
(1, 1, 'seiyasuabe@icloud.com', 'none', 'paciente', '6650eff0e25026a5e48f1788881450c5', 'bef03131b976c2bd0222436fa9d5cd0b5e6955138ebd0c72c310651e1d17bc68', '2022-12-28 20:43:34', '0.0.0.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_BANK_TRANSFER`
--

CREATE TABLE `MA_BANK_TRANSFER` (
  `ID_BANK_TRANSFER` int(11) NOT NULL,
  `BANK_TRANSFER_REFERENCE` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_BRANCHES`
--

CREATE TABLE `MA_BRANCHES` (
  `ID_BRANCH` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_BRANCH_SERVICE_LIST` int(11) NOT NULL,
  `ID_RESPONSIBLE` int(11) NOT NULL,
  `ST_D_K` varchar(40) NOT NULL,
  `ST_P_K` varchar(40) NOT NULL,
  `OWN_PAYMENTS` varchar(40) NOT NULL,
  `DATA OF BRANCH…` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_BRANCH_SERVICE_LIST`
--

CREATE TABLE `MA_BRANCH_SERVICE_LIST` (
  `ID_BRANCH_SERVICE_LIST` int(11) NOT NULL,
  `SERVICE_ITEM` varchar(40) NOT NULL,
  `SERVICE_PRICE` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_CLINICAL_HISTORY_ANSWERS`
--

CREATE TABLE `MA_CLINICAL_HISTORY_ANSWERS` (
  `ID_QUIESTION` int(11) NOT NULL,
  `QUESTION_TEXT` varchar(150) NOT NULL,
  `ID_TYPE_QUESTION` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_CLINICAL_HISTORY_FORMS`
--

CREATE TABLE `MA_CLINICAL_HISTORY_FORMS` (
  `ID_CLINICAL_HISTORY` int(11) NOT NULL,
  `CLINICAL_HISTORY_NAME` varchar(40) NOT NULL,
  `ID_TEMPLATE` varchar(40) NOT NULL,
  `ANSWERS_ARRAY` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_DOCTOR` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_CLINICAL_HISTORY_QUESTIONS`
--

CREATE TABLE `MA_CLINICAL_HISTORY_QUESTIONS` (
  `ID_QUIESTION` int(11) NOT NULL,
  `QUESTION_TEXT` varchar(3200) NOT NULL,
  `ID_TYPE_QUESTION` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_CLINICAL_HISTORY_TEMPLATES`
--

CREATE TABLE `MA_CLINICAL_HISTORY_TEMPLATES` (
  `ID_CLINICAL_HISTORY_TEMPLATE` int(11) NOT NULL,
  `ID_BRANCH_ACCESS` varchar(40) NOT NULL,
  `QUESTION_ARRAY` varchar(200) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATE_UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_CLINICAL_HISTORY_TYPE_QUESTIONS`
--

CREATE TABLE `MA_CLINICAL_HISTORY_TYPE_QUESTIONS` (
  `ID_TYPE_QUIESTION` int(11) NOT NULL,
  `QUESTION_ALIAS` varchar(40) NOT NULL,
  `QUESTION_TYPE` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_DOCTORS`
--

CREATE TABLE `MA_DOCTORS` (
  `ID_DOCTOR` int(11) NOT NULL,
  `DOCTOR_NAME` varchar(40) NOT NULL,
  `DOCTOR_P_LASTNAME` varchar(40) NOT NULL,
  `DOCTOR_M_LASTNAME` varchar(40) NOT NULL,
  `DOCTOR_EMAIL` varchar(40) NOT NULL,
  `DOCTOR_PHONE` varchar(40) NOT NULL,
  `DOCTOR_PHONE_ALTER` varchar(40) NOT NULL,
  `PROFESSIONAL_ID_NUMBER` varchar(40) NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `PLACE_OF_BIRTH` varchar(40) NOT NULL,
  `BIRTHDATE` varchar(40) NOT NULL,
  `PS_DOCTOR` varchar(40) NOT NULL,
  `GENDER` varchar(40) NOT NULL,
  `E_C_PHONE_CONUTRY_PREFIX` varchar(40) NOT NULL,
  `E_C_PHONE_NUMBER` varchar(40) NOT NULL,
  `E_C_NAME` varchar(40) NOT NULL,
  `ID_SPECIALTY` varchar(40) NOT NULL,
  `DYNAMIC_KEY` varchar(40) NOT NULL,
  `ID_TYPE_USER` int(11) NOT NULL,
  `STATUS` varchar(40) NOT NULL,
  `ID_SUSPENDED_BY` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `BRANCH_ARRAY` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_GLOBAL_CONFIG`
--

CREATE TABLE `MA_GLOBAL_CONFIG` (
  `ID_APPOINTMENT_TYPE` int(11) NOT NULL,
  `BRANCH_PAYMENTS_ARRAY` varchar(40) NOT NULL,
  `GLOBAL_PAYMENTS` varchar(40) NOT NULL,
  `ST_D_K` varchar(40) NOT NULL,
  `ST_P_K` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_INVOICES`
--

CREATE TABLE `MA_INVOICES` (
  `ID_INVOICE` int(11) NOT NULL,
  `ID_QUOTE` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `FILE_URL` varchar(160) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(40) NOT NULL,
  `DATE_UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_NEWS`
--

CREATE TABLE `MA_NEWS` (
  `ID_NEWS` int(11) NOT NULL,
  `NEWS_TITLE` varchar(40) NOT NULL,
  `NEWS_DESCRIPTION` varchar(150) NOT NULL,
  `NEWS_IMG_FILE` varchar(240) NOT NULL,
  `ID_NEWS_TYPE_USER` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_NEWS_FAVORITE`
--

CREATE TABLE `MA_NEWS_FAVORITE` (
  `ID_N_FAVORITE` int(11) NOT NULL,
  `ID_NEWS` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_NOTIFICATIONS`
--

CREATE TABLE `MA_NOTIFICATIONS` (
  `ID_NOTIFICATION` int(11) NOT NULL,
  `N_TITLE` varchar(40) NOT NULL,
  `N_DESCRIPTION` varchar(40) NOT NULL,
  `N_EXPIRATION_DATE` datetime NOT NULL,
  `ID_NOTIFICATION_CONCEPT` int(11) NOT NULL,
  `ID_TYPE_NOTIFICATION` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_NOTIFICATION_CONCEPT`
--

CREATE TABLE `MA_NOTIFICATION_CONCEPT` (
  `ID_NOTIFICATION_CONCEPT` int(11) NOT NULL,
  `N_CONCEPT` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_NOTIFICATION_TYPE`
--

CREATE TABLE `MA_NOTIFICATION_TYPE` (
  `ID_NOTIFICATION_TYPE` int(11) NOT NULL,
  `N_TYPE` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_OXXO_PAY`
--

CREATE TABLE `MA_OXXO_PAY` (
  `ID_OXXO_PAY` int(11) NOT NULL,
  `OXXO_PAY_REFERENCE` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PAYMENTS`
--

CREATE TABLE `MA_PAYMENTS` (
  `ID_PAYMENT` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_QUOTE` int(11) NOT NULL,
  `ID_PAYMENTS_TYPE` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PAYMENTS_TYP`
--

CREATE TABLE `MA_PAYMENTS_TYP` (
  `ID_PAYMENT` int(11) NOT NULL,
  `ID_WALLET_PAYMENT` int(11) NOT NULL,
  `ID_BANK_TRANSFER` int(11) NOT NULL,
  `ID_OXXO_PAY` int(11) NOT NULL,
  `CASH` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PROMOTIONS`
--

CREATE TABLE `MA_PROMOTIONS` (
  `ID_PROMOTION` int(11) NOT NULL,
  `P_TITLE` varchar(40) NOT NULL,
  `P_DESCRIPTION` varchar(250) NOT NULL,
  `P_TERMS_AND_CONDITIONS` varchar(300) NOT NULL,
  `EXPIRATION_DATE` datetime NOT NULL,
  `VALID_DATE` datetime NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(40) NOT NULL,
  `ID_AVAILABLE_BRANCH` int(11) NOT NULL,
  `ID_ICON` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PROMOTIONS_USED`
--

CREATE TABLE `MA_PROMOTIONS_USED` (
  `ID_PROMOTION` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PROSPECTS`
--

CREATE TABLE `MA_PROSPECTS` (
  `ID_PROSPECT` int(11) NOT NULL,
  `PROSPECT_EMAIL` varchar(120) NOT NULL,
  `PROSPECTS_QUESTIONS_ARRAY` varchar(200) NOT NULL,
  `ID_SERVICE` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `REFERRED_ORIGIN` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PROSPECTS_FORM_QUESTIONS`
--

CREATE TABLE `MA_PROSPECTS_FORM_QUESTIONS` (
  `ID_PROSPECT_FORM_QUIESTION` int(11) NOT NULL,
  `QUESTION_TEXT` varchar(40) NOT NULL,
  `ID_TYPE_QUESTION` int(11) NOT NULL,
  `ID_CREATED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_PROSPECTS_FORM_QUESTIONS_TYPE`
--

CREATE TABLE `MA_PROSPECTS_FORM_QUESTIONS_TYPE` (
  `ID_TYPE_QUIESTION` int(11) NOT NULL,
  `QUESTION_ALIAS` varchar(40) NOT NULL,
  `QUESTION_TYPE` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_QUOTES`
--

CREATE TABLE `MA_QUOTES` (
  `ID_QUOTE` int(11) NOT NULL,
  `QUOTE_ALIAS` varchar(40) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_QUOTE_SERVICE_LIST`
--

CREATE TABLE `MA_QUOTE_SERVICE_LIST` (
  `ID_QUOTE_S_LIST` int(11) NOT NULL,
  `ID_QUOTE` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_SERVICE` int(11) NOT NULL,
  `ID_PROMO` int(11) NOT NULL,
  `PRICE` varchar(40) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_SERVICE_TYPE`
--

CREATE TABLE `MA_SERVICE_TYPE` (
  `ID_APPOINTMENT_TYPE` int(11) NOT NULL,
  `APPOINTMENT_TYPE` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_SPECIALTY_TYPE`
--

CREATE TABLE `MA_SPECIALTY_TYPE` (
  `ID_SPECIALTY_TYPE` int(11) NOT NULL,
  `SPECIALTY` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_STATE_RECORD`
--

CREATE TABLE `MA_STATE_RECORD` (
  `ID_STATE_RECORD` int(11) NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATE_RECORD` varchar(40) NOT NULL,
  `NOTE` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_TREATMENT_INDICATIONS`
--

CREATE TABLE `MA_TREATMENT_INDICATIONS` (
  `ID_TREATMENT` int(11) NOT NULL,
  `CUSTOM_TITLE` varchar(80) NOT NULL,
  `CUSTOM_DESCRIPTION` varchar(160) NOT NULL,
  `CUSTOM_SOURCE_FILE` varchar(180) NOT NULL,
  `ID_TYPE_SOURCE_FILE` int(11) NOT NULL,
  `ID_TREATMENT_INDICATIONS_CATALOG` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_DOCTOR` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `EXPIRATION_DATE` datetime NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_TREATMENT_INDICATIONS_CATALOG`
--

CREATE TABLE `MA_TREATMENT_INDICATIONS_CATALOG` (
  `ID_T_I_CATALOG` int(11) NOT NULL,
  `T_I_TITLE` varchar(40) NOT NULL,
  `T_I_DESCRIPTION` varchar(40) NOT NULL,
  `SORUCE_FILE` varchar(40) NOT NULL,
  `ID_TYPE_SOURCE_FILE` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_TYPE_SOURCE_FILES`
--

CREATE TABLE `MA_TYPE_SOURCE_FILES` (
  `ID_TYPE_SOURCE_FILE` int(11) NOT NULL,
  `TYPE_SOURCE_FILE` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_TYPE_USER`
--

CREATE TABLE `MA_TYPE_USER` (
  `ID_TYPE_USER` int(11) NOT NULL,
  `TYPE_USER` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_USERS`
--

CREATE TABLE `MA_USERS` (
  `ID_USER` int(11) NOT NULL,
  `NAME_USER` varchar(40) NOT NULL,
  `P_LASTNAME` varchar(40) NOT NULL,
  `M_LASTNAME` varchar(40) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PHONE_COUNTRY_PREFIX` varchar(6) NOT NULL,
  `PHONE_NUMBER` varchar(12) NOT NULL,
  `BIRTHDATE` datetime NOT NULL,
  `PROFILE_PICTURE` varchar(40) NOT NULL,
  `PS_US` varchar(40) NOT NULL,
  `GENDER` varchar(12) NOT NULL,
  `E_C_PHONE_CONUTRY_PREFIX` varchar(6) NOT NULL,
  `E_C_PHONE_NUMBER` varchar(12) NOT NULL,
  `E_C_NAME` varchar(40) NOT NULL,
  `PLACE_OF_BIRTH` varchar(150) NOT NULL,
  `EMPLOYMENT` varchar(40) NOT NULL,
  `MARITAL_STATUS` varchar(40) NOT NULL,
  `DYNAMIC_KEY` varchar(40) NOT NULL,
  `ID_BILLING_DATA` int(11) NOT NULL,
  `ID_TYPE_USER` int(11) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `STATUS` varchar(60) NOT NULL,
  `ID_SUSPENDED_BY` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `MA_USERS`
--

INSERT INTO `MA_USERS` (`ID_USER`, `NAME_USER`, `P_LASTNAME`, `M_LASTNAME`, `EMAIL`, `PHONE_COUNTRY_PREFIX`, `PHONE_NUMBER`, `BIRTHDATE`, `PROFILE_PICTURE`, `PS_US`, `GENDER`, `E_C_PHONE_CONUTRY_PREFIX`, `E_C_PHONE_NUMBER`, `E_C_NAME`, `PLACE_OF_BIRTH`, `EMPLOYMENT`, `MARITAL_STATUS`, `DYNAMIC_KEY`, `ID_BILLING_DATA`, `ID_TYPE_USER`, `ID_STATE_RECORD`, `STATUS`, `ID_SUSPENDED_BY`, `DATE_RECORD`) VALUES
(1, 'Ernesto', 'Suarez', 'Gallegos', 'seiyasuabe@icloud.com', '', '5623714433', '0000-00-00 00:00:00', '', '', 'Hombre', '', '', '', 'CDMX', '', 'Soltero', 'bd1beaf46b494d38cef9b4affa4f1aa3', 0, 0, 0, 'activo', 0, '2022-12-28 20:43:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_USER_BILLING_DATA`
--

CREATE TABLE `MA_USER_BILLING_DATA` (
  `ID_BILLING_DATA_LIST` int(11) NOT NULL,
  `RFC` varchar(40) NOT NULL,
  `BUSINESS_NAME` varchar(40) NOT NULL,
  `ADDRESS` varchar(160) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAIL` varchar(120) NOT NULL,
  `FISCAL_FILE` varchar(160) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MA_WALLET`
--

CREATE TABLE `MA_WALLET` (
  `ID_USER_WALLET` int(11) NOT NULL,
  `TOKEN` varchar(40) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_BRANCH` int(11) NOT NULL,
  `DATE_RECORD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SO_COMPANY_BUFFER`
--

CREATE TABLE `SO_COMPANY_BUFFER` (
  `ID_COMPANY_BUFFER` int(11) NOT NULL,
  `DOCTOR_BUFFER` varchar(40) NOT NULL,
  `BRANCH_BUFFER` varchar(40) NOT NULL,
  `USER_BUFFER` varchar(40) NOT NULL,
  `WA_REMINDERS_BUFFER` varchar(40) NOT NULL,
  `SMS_REMINDERS_BUFFER` varchar(40) NOT NULL,
  `NEWSLETTER_BUFFER` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SO_COMPANY_CONFIG`
--

CREATE TABLE `SO_COMPANY_CONFIG` (
  `ID_COMPANY` int(11) NOT NULL,
  `MEMBERSHIP` varchar(40) NOT NULL,
  `COMPANY_DATA` varchar(150) NOT NULL,
  `API_KEY` varchar(120) NOT NULL,
  `ID_STATE_RECORD` int(11) NOT NULL,
  `DATE_RECORD` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SO_COMPANY_MODULES`
--

CREATE TABLE `SO_COMPANY_MODULES` (
  `ID_COMPANY_MODULES` int(11) NOT NULL,
  `HOME` varchar(40) NOT NULL,
  `APPOINTMENTS` varchar(40) NOT NULL,
  `PROMOS` varchar(40) NOT NULL,
  `NEWS` varchar(40) NOT NULL,
  `TREATMENTS` varchar(40) NOT NULL,
  `CLINICAL_HISTORY` varchar(40) NOT NULL,
  `QUOTES` varchar(40) NOT NULL,
  `PUSH_NOTIFICATIONS` varchar(40) NOT NULL,
  `WA_NOTIFICATIONS` varchar(40) NOT NULL,
  `NEWSLETTERS` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MA_ADMINS`
--
ALTER TABLE `MA_ADMINS`
  ADD KEY `Key` (`ID_ADMIN`),
  ADD KEY `K` (`ID_SUSPENDED_BY`);

--
-- Indices de la tabla `MA_APPOINTMENTS`
--
ALTER TABLE `MA_APPOINTMENTS`
  ADD KEY `Key` (`ID_APPOINTMENT`);

--
-- Indices de la tabla `MA_APP_ICON_CATALOG`
--
ALTER TABLE `MA_APP_ICON_CATALOG`
  ADD KEY `Key` (`ID_ICON`);

--
-- Indices de la tabla `MA_APP_NAVIGATION`
--
ALTER TABLE `MA_APP_NAVIGATION`
  ADD KEY `Key` (`ID_ITEM`);

--
-- Indices de la tabla `MA_APP_SLIDER`
--
ALTER TABLE `MA_APP_SLIDER`
  ADD KEY `Key` (`ID_SLIDE`);

--
-- Indices de la tabla `MA_APP_TYPE`
--
ALTER TABLE `MA_APP_TYPE`
  ADD KEY `Key` (`ID_APP_TYPE`,`APP_NAME`);

--
-- Indices de la tabla `MA_AUTH`
--
ALTER TABLE `MA_AUTH`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indices de la tabla `MA_BANK_TRANSFER`
--
ALTER TABLE `MA_BANK_TRANSFER`
  ADD KEY `Key` (`ID_BANK_TRANSFER`);

--
-- Indices de la tabla `MA_BRANCHES`
--
ALTER TABLE `MA_BRANCHES`
  ADD KEY `Key` (`ID_BRANCH`);

--
-- Indices de la tabla `MA_BRANCH_SERVICE_LIST`
--
ALTER TABLE `MA_BRANCH_SERVICE_LIST`
  ADD KEY `Key` (`ID_BRANCH_SERVICE_LIST`);

--
-- Indices de la tabla `MA_CLINICAL_HISTORY_ANSWERS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_ANSWERS`
  ADD KEY `Key` (`ID_QUIESTION`);

--
-- Indices de la tabla `MA_CLINICAL_HISTORY_FORMS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_FORMS`
  ADD KEY `Key` (`ID_CLINICAL_HISTORY`);

--
-- Indices de la tabla `MA_CLINICAL_HISTORY_QUESTIONS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_QUESTIONS`
  ADD KEY `Key` (`ID_QUIESTION`);

--
-- Indices de la tabla `MA_CLINICAL_HISTORY_TEMPLATES`
--
ALTER TABLE `MA_CLINICAL_HISTORY_TEMPLATES`
  ADD KEY `Key` (`ID_CLINICAL_HISTORY_TEMPLATE`);

--
-- Indices de la tabla `MA_CLINICAL_HISTORY_TYPE_QUESTIONS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_TYPE_QUESTIONS`
  ADD KEY `Key` (`ID_TYPE_QUIESTION`);

--
-- Indices de la tabla `MA_DOCTORS`
--
ALTER TABLE `MA_DOCTORS`
  ADD KEY `Key` (`ID_DOCTOR`);

--
-- Indices de la tabla `MA_GLOBAL_CONFIG`
--
ALTER TABLE `MA_GLOBAL_CONFIG`
  ADD KEY `Key` (`ID_APPOINTMENT_TYPE`);

--
-- Indices de la tabla `MA_INVOICES`
--
ALTER TABLE `MA_INVOICES`
  ADD KEY `Key` (`ID_INVOICE`);

--
-- Indices de la tabla `MA_NEWS`
--
ALTER TABLE `MA_NEWS`
  ADD KEY `Key` (`ID_NEWS`);

--
-- Indices de la tabla `MA_NEWS_FAVORITE`
--
ALTER TABLE `MA_NEWS_FAVORITE`
  ADD KEY `Key` (`ID_N_FAVORITE`);

--
-- Indices de la tabla `MA_NOTIFICATIONS`
--
ALTER TABLE `MA_NOTIFICATIONS`
  ADD KEY `Key` (`ID_NOTIFICATION`);

--
-- Indices de la tabla `MA_NOTIFICATION_CONCEPT`
--
ALTER TABLE `MA_NOTIFICATION_CONCEPT`
  ADD KEY `Key` (`ID_NOTIFICATION_CONCEPT`);

--
-- Indices de la tabla `MA_NOTIFICATION_TYPE`
--
ALTER TABLE `MA_NOTIFICATION_TYPE`
  ADD KEY `Key` (`ID_NOTIFICATION_TYPE`);

--
-- Indices de la tabla `MA_OXXO_PAY`
--
ALTER TABLE `MA_OXXO_PAY`
  ADD KEY `Key` (`ID_OXXO_PAY`);

--
-- Indices de la tabla `MA_PAYMENTS`
--
ALTER TABLE `MA_PAYMENTS`
  ADD KEY `Key` (`ID_PAYMENT`);

--
-- Indices de la tabla `MA_PAYMENTS_TYP`
--
ALTER TABLE `MA_PAYMENTS_TYP`
  ADD KEY `Key` (`ID_PAYMENT`);

--
-- Indices de la tabla `MA_PROMOTIONS`
--
ALTER TABLE `MA_PROMOTIONS`
  ADD KEY `Key` (`ID_PROMOTION`);

--
-- Indices de la tabla `MA_PROMOTIONS_USED`
--
ALTER TABLE `MA_PROMOTIONS_USED`
  ADD KEY `Key` (`ID_PROMOTION`);

--
-- Indices de la tabla `MA_PROSPECTS`
--
ALTER TABLE `MA_PROSPECTS`
  ADD KEY `Key` (`ID_PROSPECT`);

--
-- Indices de la tabla `MA_PROSPECTS_FORM_QUESTIONS`
--
ALTER TABLE `MA_PROSPECTS_FORM_QUESTIONS`
  ADD KEY `Key` (`ID_PROSPECT_FORM_QUIESTION`);

--
-- Indices de la tabla `MA_PROSPECTS_FORM_QUESTIONS_TYPE`
--
ALTER TABLE `MA_PROSPECTS_FORM_QUESTIONS_TYPE`
  ADD KEY `Key` (`ID_TYPE_QUIESTION`);

--
-- Indices de la tabla `MA_QUOTES`
--
ALTER TABLE `MA_QUOTES`
  ADD KEY `Key` (`ID_QUOTE`);

--
-- Indices de la tabla `MA_QUOTE_SERVICE_LIST`
--
ALTER TABLE `MA_QUOTE_SERVICE_LIST`
  ADD KEY `Key` (`ID_QUOTE_S_LIST`);

--
-- Indices de la tabla `MA_SERVICE_TYPE`
--
ALTER TABLE `MA_SERVICE_TYPE`
  ADD KEY `Key` (`ID_APPOINTMENT_TYPE`);

--
-- Indices de la tabla `MA_SPECIALTY_TYPE`
--
ALTER TABLE `MA_SPECIALTY_TYPE`
  ADD KEY `Key` (`ID_SPECIALTY_TYPE`);

--
-- Indices de la tabla `MA_STATE_RECORD`
--
ALTER TABLE `MA_STATE_RECORD`
  ADD KEY `Key` (`ID_STATE_RECORD`);

--
-- Indices de la tabla `MA_TREATMENT_INDICATIONS`
--
ALTER TABLE `MA_TREATMENT_INDICATIONS`
  ADD KEY `Key` (`ID_TREATMENT`);

--
-- Indices de la tabla `MA_TREATMENT_INDICATIONS_CATALOG`
--
ALTER TABLE `MA_TREATMENT_INDICATIONS_CATALOG`
  ADD KEY `Key` (`ID_T_I_CATALOG`);

--
-- Indices de la tabla `MA_TYPE_SOURCE_FILES`
--
ALTER TABLE `MA_TYPE_SOURCE_FILES`
  ADD KEY `Key` (`ID_TYPE_SOURCE_FILE`);

--
-- Indices de la tabla `MA_TYPE_USER`
--
ALTER TABLE `MA_TYPE_USER`
  ADD KEY `Key` (`ID_TYPE_USER`);

--
-- Indices de la tabla `MA_USERS`
--
ALTER TABLE `MA_USERS`
  ADD PRIMARY KEY (`ID_USER`) USING BTREE;

--
-- Indices de la tabla `MA_USER_BILLING_DATA`
--
ALTER TABLE `MA_USER_BILLING_DATA`
  ADD KEY `Key` (`ID_BILLING_DATA_LIST`);

--
-- Indices de la tabla `MA_WALLET`
--
ALTER TABLE `MA_WALLET`
  ADD KEY `Key` (`ID_USER_WALLET`);

--
-- Indices de la tabla `SO_COMPANY_BUFFER`
--
ALTER TABLE `SO_COMPANY_BUFFER`
  ADD KEY `Key` (`ID_COMPANY_BUFFER`);

--
-- Indices de la tabla `SO_COMPANY_CONFIG`
--
ALTER TABLE `SO_COMPANY_CONFIG`
  ADD KEY `Key` (`ID_COMPANY`);

--
-- Indices de la tabla `SO_COMPANY_MODULES`
--
ALTER TABLE `SO_COMPANY_MODULES`
  ADD KEY `Key` (`ID_COMPANY_MODULES`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MA_ADMINS`
--
ALTER TABLE `MA_ADMINS`
  MODIFY `ID_ADMIN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_APPOINTMENTS`
--
ALTER TABLE `MA_APPOINTMENTS`
  MODIFY `ID_APPOINTMENT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_APP_ICON_CATALOG`
--
ALTER TABLE `MA_APP_ICON_CATALOG`
  MODIFY `ID_ICON` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_APP_NAVIGATION`
--
ALTER TABLE `MA_APP_NAVIGATION`
  MODIFY `ID_ITEM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_APP_SLIDER`
--
ALTER TABLE `MA_APP_SLIDER`
  MODIFY `ID_SLIDE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_APP_TYPE`
--
ALTER TABLE `MA_APP_TYPE`
  MODIFY `ID_APP_TYPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_AUTH`
--
ALTER TABLE `MA_AUTH`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `MA_BANK_TRANSFER`
--
ALTER TABLE `MA_BANK_TRANSFER`
  MODIFY `ID_BANK_TRANSFER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_BRANCHES`
--
ALTER TABLE `MA_BRANCHES`
  MODIFY `ID_BRANCH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_BRANCH_SERVICE_LIST`
--
ALTER TABLE `MA_BRANCH_SERVICE_LIST`
  MODIFY `ID_BRANCH_SERVICE_LIST` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_CLINICAL_HISTORY_ANSWERS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_ANSWERS`
  MODIFY `ID_QUIESTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_CLINICAL_HISTORY_FORMS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_FORMS`
  MODIFY `ID_CLINICAL_HISTORY` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_CLINICAL_HISTORY_QUESTIONS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_QUESTIONS`
  MODIFY `ID_QUIESTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_CLINICAL_HISTORY_TEMPLATES`
--
ALTER TABLE `MA_CLINICAL_HISTORY_TEMPLATES`
  MODIFY `ID_CLINICAL_HISTORY_TEMPLATE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_CLINICAL_HISTORY_TYPE_QUESTIONS`
--
ALTER TABLE `MA_CLINICAL_HISTORY_TYPE_QUESTIONS`
  MODIFY `ID_TYPE_QUIESTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_DOCTORS`
--
ALTER TABLE `MA_DOCTORS`
  MODIFY `ID_DOCTOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_GLOBAL_CONFIG`
--
ALTER TABLE `MA_GLOBAL_CONFIG`
  MODIFY `ID_APPOINTMENT_TYPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_INVOICES`
--
ALTER TABLE `MA_INVOICES`
  MODIFY `ID_INVOICE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_NEWS`
--
ALTER TABLE `MA_NEWS`
  MODIFY `ID_NEWS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_NEWS_FAVORITE`
--
ALTER TABLE `MA_NEWS_FAVORITE`
  MODIFY `ID_N_FAVORITE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_NOTIFICATIONS`
--
ALTER TABLE `MA_NOTIFICATIONS`
  MODIFY `ID_NOTIFICATION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_NOTIFICATION_CONCEPT`
--
ALTER TABLE `MA_NOTIFICATION_CONCEPT`
  MODIFY `ID_NOTIFICATION_CONCEPT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_NOTIFICATION_TYPE`
--
ALTER TABLE `MA_NOTIFICATION_TYPE`
  MODIFY `ID_NOTIFICATION_TYPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_OXXO_PAY`
--
ALTER TABLE `MA_OXXO_PAY`
  MODIFY `ID_OXXO_PAY` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PAYMENTS`
--
ALTER TABLE `MA_PAYMENTS`
  MODIFY `ID_PAYMENT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PAYMENTS_TYP`
--
ALTER TABLE `MA_PAYMENTS_TYP`
  MODIFY `ID_PAYMENT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PROMOTIONS`
--
ALTER TABLE `MA_PROMOTIONS`
  MODIFY `ID_PROMOTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PROMOTIONS_USED`
--
ALTER TABLE `MA_PROMOTIONS_USED`
  MODIFY `ID_PROMOTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PROSPECTS`
--
ALTER TABLE `MA_PROSPECTS`
  MODIFY `ID_PROSPECT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PROSPECTS_FORM_QUESTIONS`
--
ALTER TABLE `MA_PROSPECTS_FORM_QUESTIONS`
  MODIFY `ID_PROSPECT_FORM_QUIESTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_PROSPECTS_FORM_QUESTIONS_TYPE`
--
ALTER TABLE `MA_PROSPECTS_FORM_QUESTIONS_TYPE`
  MODIFY `ID_TYPE_QUIESTION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_QUOTES`
--
ALTER TABLE `MA_QUOTES`
  MODIFY `ID_QUOTE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_QUOTE_SERVICE_LIST`
--
ALTER TABLE `MA_QUOTE_SERVICE_LIST`
  MODIFY `ID_QUOTE_S_LIST` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_SERVICE_TYPE`
--
ALTER TABLE `MA_SERVICE_TYPE`
  MODIFY `ID_APPOINTMENT_TYPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_SPECIALTY_TYPE`
--
ALTER TABLE `MA_SPECIALTY_TYPE`
  MODIFY `ID_SPECIALTY_TYPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_STATE_RECORD`
--
ALTER TABLE `MA_STATE_RECORD`
  MODIFY `ID_STATE_RECORD` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_TREATMENT_INDICATIONS`
--
ALTER TABLE `MA_TREATMENT_INDICATIONS`
  MODIFY `ID_TREATMENT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_TREATMENT_INDICATIONS_CATALOG`
--
ALTER TABLE `MA_TREATMENT_INDICATIONS_CATALOG`
  MODIFY `ID_T_I_CATALOG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_TYPE_SOURCE_FILES`
--
ALTER TABLE `MA_TYPE_SOURCE_FILES`
  MODIFY `ID_TYPE_SOURCE_FILE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_TYPE_USER`
--
ALTER TABLE `MA_TYPE_USER`
  MODIFY `ID_TYPE_USER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_USERS`
--
ALTER TABLE `MA_USERS`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `MA_USER_BILLING_DATA`
--
ALTER TABLE `MA_USER_BILLING_DATA`
  MODIFY `ID_BILLING_DATA_LIST` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MA_WALLET`
--
ALTER TABLE `MA_WALLET`
  MODIFY `ID_USER_WALLET` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SO_COMPANY_BUFFER`
--
ALTER TABLE `SO_COMPANY_BUFFER`
  MODIFY `ID_COMPANY_BUFFER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SO_COMPANY_CONFIG`
--
ALTER TABLE `SO_COMPANY_CONFIG`
  MODIFY `ID_COMPANY` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SO_COMPANY_MODULES`
--
ALTER TABLE `SO_COMPANY_MODULES`
  MODIFY `ID_COMPANY_MODULES` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
