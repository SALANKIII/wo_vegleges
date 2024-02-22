-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 21. 08:25
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szakdoga`
--
CREATE DATABASE IF NOT EXISTS `szakdoga` DEFAULT CHARACTER SET utf32 COLLATE utf32_hungarian_ci;
USE `szakdoga`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `account`
--

CREATE TABLE `account` (
  `accountID` int(11) NOT NULL COMMENT 'a felhasználó azonosítója',
  `username` varchar(255) NOT NULL COMMENT 'a felhasználónév',
  `email` varchar(255) NOT NULL COMMENT 'a felhasználó email címe',
  `pwd` varchar(255) NOT NULL COMMENT 'a felhasználó jelszava',
  `gender` varchar(255) NOT NULL COMMENT 'a felhasználó neme',
  `weight` int(11) NOT NULL COMMENT 'a felhasználó súlya',
  `height` int(11) NOT NULL COMMENT 'a felhasználó magassága',
  `role` tinyint(4) NOT NULL COMMENT 'a fehasználó szerepköre',
  `birthDate` date DEFAULT NULL COMMENT 'a felhasználó születési dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `account`
--

INSERT INTO `account` (`accountID`, `username`, `email`, `pwd`, `gender`, `weight`, `height`, `role`, `birthDate`) VALUES
(1, 'egy', 'egy@egy.hu', '$2b$10$G7t4aOUX.k8H3FRe3kcYhOE5j4086VlKOm.dRR0Um8z0.CLkgPvby', 'male', 0, 0, 0, NULL),
(2, 'admin', 'admin@admin.hu', '$2b$10$nXnWUblcWI2RDaK5CJUj7uxe4SennYEg0qopgWjs6uZDRH75inUnC', 'female', 0, 0, 1, '2023-09-17'),
(8, 'elek teszt', 'teszt@teszt.hu', '$2b$10$oACvCA3IAtfj7ObHXrj5juLhLQf5PjzAxfOMeeehW.8iE4xcgdyZG', 'férfi', 70, 170, 0, '2024-02-16');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `allexercise`
--

CREATE TABLE `allexercise` (
  `allExerciseID` int(11) NOT NULL,
  `exercise_name` varchar(255) NOT NULL,
  `exercise_category` varchar(255) NOT NULL,
  `exercise_bodypart` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `measure`
--

CREATE TABLE `measure` (
  `measureID` int(11) NOT NULL COMMENT 'a mérés azonosítója',
  `accountID` int(11) NOT NULL COMMENT 'a felhasználó azonosítója',
  `weight` int(11) DEFAULT NULL COMMENT 'a méréskor megadott súly',
  `bodyFatPercentage` int(11) DEFAULT NULL COMMENT 'a méréskor kalkulált testzsír százalék',
  `caloricIntake` int(11) DEFAULT NULL COMMENT 'a napi kalóriabevitel',
  `neck` int(11) DEFAULT NULL COMMENT 'a nyak mérete',
  `shoulders` int(11) DEFAULT NULL COMMENT 'a váll mérete',
  `chest` int(11) DEFAULT NULL COMMENT 'a mellkas mérete',
  `leftBicep` int(11) DEFAULT NULL COMMENT 'a bal bicepsz mérete',
  `rightBicep` int(11) DEFAULT NULL COMMENT 'a jobb bicepsz mérete',
  `leftForeArm` int(11) DEFAULT NULL COMMENT 'a bal alkar mérete',
  `rightForeArm` int(11) DEFAULT NULL COMMENT 'a jobb alkar mérete',
  `upperAbs` int(11) DEFAULT NULL COMMENT 'a felső has kerülete',
  `waist` int(11) DEFAULT NULL COMMENT 'a derékmérete',
  `lowerAbs` int(11) DEFAULT NULL COMMENT 'alsó has kerülete',
  `hips` int(11) DEFAULT NULL COMMENT 'a csípő mérete',
  `leftThigh` int(11) DEFAULT NULL COMMENT 'a bal comb mérete',
  `rightThigh` int(11) DEFAULT NULL COMMENT 'a jobb comb mérete',
  `leftCalf` int(11) DEFAULT NULL COMMENT 'a bal vádli mérete',
  `rightCalf` int(11) DEFAULT NULL COMMENT 'a jobb vádli mérete',
  `measureDate` date NOT NULL COMMENT 'a mérés dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `measure`
--

INSERT INTO `measure` (`measureID`, `accountID`, `weight`, `bodyFatPercentage`, `caloricIntake`, `neck`, `shoulders`, `chest`, `leftBicep`, `rightBicep`, `leftForeArm`, `rightForeArm`, `upperAbs`, `waist`, `lowerAbs`, `hips`, `leftThigh`, `rightThigh`, `leftCalf`, `rightCalf`, `measureDate`) VALUES
(1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, '0000-00-00'),
(2, 8, 12, 12324, 1210, 123234, 114, 42354, 24235, 24235, 2312, 12, 23234, 133124, 1312, 2341, 231, 231, 2312, 13, '0000-00-00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `usertoworkout`
--

CREATE TABLE `usertoworkout` (
  `userToWorkoutID` int(11) NOT NULL,
  `exerciseID` int(11) NOT NULL,
  `workoutID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `workouts`
--

CREATE TABLE `workouts` (
  `workoutID` int(11) NOT NULL,
  `wname` varchar(255) NOT NULL,
  `e_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `w_exercises`
--

CREATE TABLE `w_exercises` (
  `exerciesID` int(11) NOT NULL,
  `ename` int(11) NOT NULL,
  `sets` int(11) NOT NULL,
  `repetitions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`);

--
-- A tábla indexei `allexercise`
--
ALTER TABLE `allexercise`
  ADD PRIMARY KEY (`allExerciseID`);

--
-- A tábla indexei `measure`
--
ALTER TABLE `measure`
  ADD PRIMARY KEY (`measureID`),
  ADD KEY `accountID` (`accountID`);

--
-- A tábla indexei `usertoworkout`
--
ALTER TABLE `usertoworkout`
  ADD PRIMARY KEY (`userToWorkoutID`),
  ADD KEY `exerciseID` (`exerciseID`),
  ADD KEY `workoutID` (`workoutID`),
  ADD KEY `acoountID` (`accountID`);

--
-- A tábla indexei `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`workoutID`);

--
-- A tábla indexei `w_exercises`
--
ALTER TABLE `w_exercises`
  ADD PRIMARY KEY (`exerciesID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'a felhasználó azonosítója', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `allexercise`
--
ALTER TABLE `allexercise`
  MODIFY `allExerciseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `measure`
--
ALTER TABLE `measure`
  MODIFY `measureID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'a mérés azonosítója', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `usertoworkout`
--
ALTER TABLE `usertoworkout`
  MODIFY `userToWorkoutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `workouts`
--
ALTER TABLE `workouts`
  MODIFY `workoutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `measure`
--
ALTER TABLE `measure`
  ADD CONSTRAINT `measure_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`);

--
-- Megkötések a táblához `usertoworkout`
--
ALTER TABLE `usertoworkout`
  ADD CONSTRAINT `usertoworkout_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usertoworkout_ibfk_2` FOREIGN KEY (`workoutID`) REFERENCES `workouts` (`workoutID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usertoworkout_ibfk_3` FOREIGN KEY (`exerciseID`) REFERENCES `w_exercises` (`exerciesID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
