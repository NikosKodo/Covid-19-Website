-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 17 Σεπ 2022 στις 15:37:27
-- Έκδοση διακομιστή: 10.4.14-MariaDB
-- Έκδοση PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `dogamai`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(12345, 'kodogiorgis', 'a123'),
(13425, 'andrikopoulos', 'andri123'),
(17894, 'papadopoulos', 'papa123');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `episkepseis`
--

CREATE TABLE `episkepseis` (
  `id_episkepshs` int(11) NOT NULL,
  `visit` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `episkepsh_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `episkepseis`
--

INSERT INTO `episkepseis` (`id_episkepshs`, `visit`, `number`, `episkepsh_time`) VALUES
(102, 'Coffee Stay', 8, '2022-09-16 15:27:41'),
(103, 'Petite Boutique', 5, '2022-09-16 15:45:59'),
(105, 'Relax', 11, '2022-09-17 13:25:22'),
(106, 'Coffebox STR', 9, '2022-09-17 13:25:36'),
(107, 'Constantino Creperie', 5, '2022-09-17 13:25:47'),
(108, 'Σινιάλο', 8, '2022-09-17 13:26:00'),
(109, 'CAFE STATHMOS', 5, '2022-09-17 13:26:12'),
(110, 'Pink Woman', 5, '2022-09-17 13:26:22');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `krousma`
--

CREATE TABLE `krousma` (
  `id_krousma` int(11) NOT NULL,
  `krousma_visit` varchar(255) NOT NULL,
  `date2` datetime NOT NULL,
  `cases` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `krousma`
--

INSERT INTO `krousma` (`id_krousma`, `krousma_visit`, `date2`, `cases`) VALUES
(16, 'My market', '2022-09-25 18:25:00', b'1'),
(17, 'Zara', '2022-09-26 18:26:00', b'1'),
(18, 'Petite Boutique', '2022-09-11 18:49:00', b'1'),
(19, 'Batter Buttlers', '2022-09-26 17:24:00', b'1'),
(20, 'Panachaico', '2022-09-30 16:26:00', b'1'),
(21, 'Banco', '2022-09-25 16:24:00', b'1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pois`
--

CREATE TABLE `pois` (
  `id_pois` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `types` varchar(255) NOT NULL,
  `rating` float NOT NULL,
  `rating_n` float NOT NULL,
  `current_popularity` int(11) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `pois_date` datetime NOT NULL,
  `krousmata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `pois`
--

INSERT INTO `pois` (`id_pois`, `name`, `address`, `types`, `rating`, `rating_n`, `current_popularity`, `lat`, `lng`, `pois_date`, `krousmata`) VALUES
('ChIJ0a4YHeBJXhMRgESyasas', 'Cooper Cafe', 'asdsadsda', 'asdasdsdasda', 4, 4, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 3),
('ChIJ71wmUS82XhMRKso4jVV3SaI', 'Λαβύρινθος', 'Solomous 148, Patra', 'restaurant', 4.5, 4.3, 7, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJ7SdGoCg2XhMRGcnVpa4dU0g', 'Petite Boutique', 'Akti Dimeon 35, Patra', 'cafe', 4, 4.4, 5, 38.2368, 21.7259, '2022-09-03 16:06:00', 4),
('ChIJ8e14Y_k3XhMRwkBFeA4sA44', 'Coffee Stay', 'Dimitriou Maximou 6, Patra', 'cafe', 4.5, 4.3, 14, 38.2315, 21.7296, '2021-12-09 18:12:00', 1),
('ChIJa4Go5yc2XhMR-30hKzhbx_c', 'My market', '12, Akti Dimeon 14, Patra', 'supermarket', 4.2, 4.1, 5, 38.2393, 21.7263, '2021-12-09 18:12:00', 0),
('ChIJaeHBPuBJXhMRuNbzVocLWWA', 'Coffee Brands', 'Solomous 72-76, Patra', 'cafe', 4.3, 4.3, 4, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJESBMBBk2XhMRi2SbsZ_zvMU', 'Pink Woman', 'Solomous 86, Patra', 'store', 4.1, 4.3, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 1),
('ChIJGyYZay82XhMRYIH_uvIjIH8', 'Zara', 'Dimitriou Maximou 54, Patra', 'store', 4.6, 4.3, 8, 38.2315, 21.7296, '2021-12-09 18:12:00', 3),
('ChIJk0zmsB82XhMRaUVxT1MhpGY', 'Ghetto', 'Souniou 119, Patra', 'restaurant', 4.7, 4.3, 9, 38.2315, 21.7296, '2021-12-09 18:12:00', 4),
('ChIJkRhinSg2XhMRipOQ12_hPzI', 'CAFE STATHMOS', 'Selefkias 14, Patra', 'cafe', 4.3, 4.3, 2, 38.2315, 21.7296, '2021-12-09 18:12:00', 3),
('ChIJOztsXBk2XhMRIu0EEdF27js', 'Σινιάλο', 'Alexandrou Papanastasiou 16, Patra', 'restaurant', 4.8, 4.3, 6, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJP1bzTS82XhMRKDyRa4_p-j4', 'El Greco', 'Selefkias 11, Patra', 'restaurant', 4.7, 4.3, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 3),
('ChIJSWbYERM3XhMRX5qduCDaczY', 'Constantino Creperie', 'Akti Dimeon 17, Patra', 'restaurant', 4.4, 4.3, 11, 38.2315, 21.7296, '2021-12-09 18:12:00', 4),
('ChIJu-vWGU03XhMRQPtHWoqT688', 'Banco', 'Maizonos 313, Patra', 'cafe', 4, 4.3, 3, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJu8vyBuJJXhMRfm0zkEgJDWU', 'Cafe Cinema', 'Solomous 30, Patra', 'cafe', 4.6, 4.3, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 1),
('ChIJU9lb5SQ2XhMRC-mT4k-qJ5I', 'MrBurger', 'Solomous 68, Patra', 'restaurant', 4.4, 4.3, 12, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJVeODuCE2XhMRcDFqFETdzdw', 'Batter Buttlers', 'Themistokleous 56, Patra', 'restaurant', 4.9, 4.3, 4, 38.2315, 21.7296, '2021-12-09 18:12:00', 1),
('ChIJVfLnrMVJXhMRkzUAT7CxG4U', 'Relax', 'Alexandrou Papanastasiou 16, Patra', 'cafe', 4.2, 4.3, 7, 38.2315, 21.7296, '2021-12-09 18:12:00', 3),
('ChIJVzAMZC82XhMRbhndkrdgnck', 'Coffebox STR', 'Maizonos 313, Patra', 'cafe', 4.1, 4.3, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 1),
('ChIJZSZOWxk2XhMRx_ZGHpVteCc', 'Everest', 'Akti Dimeon 17, Patra', 'restaurant', 4.3, 4.3, 8, 38.2315, 21.7296, '2021-12-09 18:12:00', 2),
('ChIJ_cM58sE3XhMRCHVgkJkjUeQ', 'Panachaico', 'Selefkias 11, Patra', 'establishment', 4.7, 4.3, 5, 38.2315, 21.7296, '2021-12-09 18:12:00', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'User1', 'zofos2000@gmail.com', '12213ASDASDASD%'),
(4, 'user2', 'user2@gmail.com', '123123ASDASD&^'),
(5, 'user3', 'user3@gmail.com', 'asd11231ASDASD^'),
(6, 'user4', 'user4@gmail.com', '432523asdASDAS^^'),
(7, 'user5', 'user5@gmail.com', 'asdasdASD123123&&');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Ευρετήρια για πίνακα `episkepseis`
--
ALTER TABLE `episkepseis`
  ADD PRIMARY KEY (`id_episkepshs`);

--
-- Ευρετήρια για πίνακα `krousma`
--
ALTER TABLE `krousma`
  ADD PRIMARY KEY (`id_krousma`);

--
-- Ευρετήρια για πίνακα `pois`
--
ALTER TABLE `pois`
  ADD PRIMARY KEY (`id_pois`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17895;

--
-- AUTO_INCREMENT για πίνακα `episkepseis`
--
ALTER TABLE `episkepseis`
  MODIFY `id_episkepshs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT για πίνακα `krousma`
--
ALTER TABLE `krousma`
  MODIFY `id_krousma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
