
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for archiwum_oplat
-- ----------------------------
DROP TABLE IF EXISTS `archiwum_oplat`;
CREATE TABLE `archiwum_oplat`  (
  `ID_oplaty` int(10) UNSIGNED NOT NULL,
  `ID_wypozyczenia` int(10) UNSIGNED NOT NULL,
  `data_naliczenia` date NOT NULL,
  `kwota` double UNSIGNED NOT NULL,
  `termin_zaplaty` date NULL DEFAULT NULL,
  `data_zaplaty` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_oplaty`, `data_naliczenia`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic PARTITION BY LIST (year(`data_naliczenia`))
PARTITIONS 5
(PARTITION `rok_2019` VALUES IN (2019) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `rok_2020` VALUES IN (2020) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `rok_2021` VALUES IN (2021) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `rok_2022` VALUES IN (2022) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `rok_2023` VALUES IN (2023) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of archiwum_oplat
-- ----------------------------
INSERT INTO `archiwum_oplat` VALUES (101, 7, '2023-06-04', 2.5, '2023-07-04', '2023-06-04');
INSERT INTO `archiwum_oplat` VALUES (116, 29, '2023-06-04', 15.5, '2023-07-04', '2023-06-04');

-- ----------------------------
-- Table structure for audiobooki
-- ----------------------------
DROP TABLE IF EXISTS `audiobooki`;
CREATE TABLE `audiobooki`  (
  `ID_audiobooka` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_autora` int(250) UNSIGNED NOT NULL,
  `tytul` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_wydania` date NULL DEFAULT NULL,
  `ilosc_egzemplarzy` int(250) NOT NULL,
  `czas_trwania` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_audiobooka`, `ID_autora`) USING BTREE,
  INDEX `ID_autora`(`ID_autora`) USING BTREE,
  INDEX `ID_audiobooka`(`ID_audiobooka`) USING BTREE,
  CONSTRAINT `audiobooki_ibfk_1` FOREIGN KEY (`ID_autora`) REFERENCES `autorzy` (`ID_autora`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `czas_trwania` CHECK (`czas_trwania` > 0)
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audiobooki
-- ----------------------------
INSERT INTO `audiobooki` VALUES (1, 1, 'Siłaczka', '2023-06-14', 8, 180);
INSERT INTO `audiobooki` VALUES (2, 3, 'Potop', '2008-06-11', 20, 480);
INSERT INTO `audiobooki` VALUES (3, 4, 'Lalka', '2020-06-10', 100, 400);
INSERT INTO `audiobooki` VALUES (4, 3, 'Latarnik', '1988-06-08', 13, 120);
INSERT INTO `audiobooki` VALUES (5, 2, 'Kocie historie', '2021-11-03', 44, 240);
INSERT INTO `audiobooki` VALUES (6, 1, 'Romeo i Julia', '1979-06-13', 27, 240);
INSERT INTO `audiobooki` VALUES (7, 16, 'Zła królowa', '2022-06-15', 20, 350);
INSERT INTO `audiobooki` VALUES (8, 1, 'Hamlet', '1980-01-30', 12, 200);
INSERT INTO `audiobooki` VALUES (9, 7, 'Behawiorysta', '2014-06-11', 12, 300);
INSERT INTO `audiobooki` VALUES (10, 7, 'Kasacja', '2019-01-01', 9, 312);
INSERT INTO `audiobooki` VALUES (11, 19, 'Szukając Alaske', '2004-06-16', 4, 340);
INSERT INTO `audiobooki` VALUES (12, 19, 'Papierowe Miasta', '2005-07-14', 5, 340);
INSERT INTO `audiobooki` VALUES (13, 15, 'Kosogłos', '2003-05-13', 18, 300);
INSERT INTO `audiobooki` VALUES (14, 15, 'Igrzyska Śmierci', '2003-05-13', 25, 380);
INSERT INTO `audiobooki` VALUES (15, 17, 'Ania z Zielonego Wzgórza', '2003-06-10', 15, 270);
INSERT INTO `audiobooki` VALUES (16, 17, 'Ania z Avonella', '1994-06-02', 12, 390);
INSERT INTO `audiobooki` VALUES (17, 17, 'Ania z Szumiących Topoli', '2004-06-16', 13, 450);
INSERT INTO `audiobooki` VALUES (18, 18, 'Gildia Magów ', '2013-06-12', 15, 500);
INSERT INTO `audiobooki` VALUES (19, 18, 'Nowicjuszka', '2000-06-14', 12, 540);
INSERT INTO `audiobooki` VALUES (20, 18, 'Misja Ambasadora', '2004-06-09', 14, 600);

-- ----------------------------
-- Table structure for autorzy
-- ----------------------------
DROP TABLE IF EXISTS `autorzy`;
CREATE TABLE `autorzy`  (
  `ID_autora` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imie` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nazwisko` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_autora`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of autorzy
-- ----------------------------
INSERT INTO `autorzy` VALUES (1, 'William', 'Shakespeare');
INSERT INTO `autorzy` VALUES (2, 'Tomasz', 'Trojanowski');
INSERT INTO `autorzy` VALUES (3, 'Henryk ', 'Sienkiewicz');
INSERT INTO `autorzy` VALUES (4, 'Bolesław', 'Prus');
INSERT INTO `autorzy` VALUES (5, 'Olga', 'Tokarczuk');
INSERT INTO `autorzy` VALUES (6, 'Blanka', 'Lipińska');
INSERT INTO `autorzy` VALUES (7, 'Remigiusz', 'Mróz');
INSERT INTO `autorzy` VALUES (8, 'Katarzyna', 'Bonda');
INSERT INTO `autorzy` VALUES (9, 'Paulina ', 'Świst');
INSERT INTO `autorzy` VALUES (10, 'Jacek', 'Piekara');
INSERT INTO `autorzy` VALUES (11, 'Stephen ', 'King');
INSERT INTO `autorzy` VALUES (12, 'Cassandra', 'Clare');
INSERT INTO `autorzy` VALUES (13, 'Stanisław', 'Lem ');
INSERT INTO `autorzy` VALUES (14, 'Rick', 'Riordan');
INSERT INTO `autorzy` VALUES (15, 'Suzanne', 'Collins ');
INSERT INTO `autorzy` VALUES (16, 'Holly', 'Black');
INSERT INTO `autorzy` VALUES (17, 'Lucy Maud', 'Montgomery');
INSERT INTO `autorzy` VALUES (18, 'Trudi', 'Canavan');
INSERT INTO `autorzy` VALUES (19, 'John', 'Green');
INSERT INTO `autorzy` VALUES (20, 'Jane', 'Austen');
INSERT INTO `autorzy` VALUES (21, 'Jean', 'Van Hamme');
INSERT INTO `autorzy` VALUES (22, 'Janusz', 'Christa');
INSERT INTO `autorzy` VALUES (23, 'Henryk', 'Chmielewski');
INSERT INTO `autorzy` VALUES (24, 'John', 'Byrne');
INSERT INTO `autorzy` VALUES (25, 'Alan', 'Moore');
INSERT INTO `autorzy` VALUES (26, 'J.M', 'DeMatteis');
INSERT INTO `autorzy` VALUES (27, 'Greg', 'Rucka');
INSERT INTO `autorzy` VALUES (28, 'Chris', 'Claremont');
INSERT INTO `autorzy` VALUES (29, 'Grant', 'Morrison');
INSERT INTO `autorzy` VALUES (30, 'Brian', 'Posehn');
INSERT INTO `autorzy` VALUES (31, 'Robert', 'Kirkman');
INSERT INTO `autorzy` VALUES (32, 'Brian K.', 'Vaughan');
INSERT INTO `autorzy` VALUES (33, 'Neil', 'Gaiman');

-- ----------------------------
-- Table structure for czasopisma
-- ----------------------------
DROP TABLE IF EXISTS `czasopisma`;
CREATE TABLE `czasopisma`  (
  `ID_czasopisma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wydawnictwo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tytul` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_wydania` date NULL DEFAULT NULL,
  `ilosc_egzemplarzy` int(250) NOT NULL,
  PRIMARY KEY (`ID_czasopisma`) USING BTREE,
  INDEX `ID_autora`(`wydawnictwo`) USING BTREE,
  INDEX `ID_czasopisma`(`ID_czasopisma`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of czasopisma
-- ----------------------------
INSERT INTO `czasopisma` VALUES (1, 'Bauer', 'Top Gear Polska', '2023-06-10', 151);
INSERT INTO `czasopisma` VALUES (2, 'Bauer', 'Swiat wiedzy', '2021-11-03', 120);
INSERT INTO `czasopisma` VALUES (3, 'Bauer', 'National Geographic Polska', '2023-05-15', 99);
INSERT INTO `czasopisma` VALUES (4, 'Burda', 'Gala', '2023-06-01', 200);
INSERT INTO `czasopisma` VALUES (5, 'Polityka', 'Polityka', '2023-04-20', 150);
INSERT INTO `czasopisma` VALUES (6, 'Axel Springer', 'Newsweek Polska', '2023-05-10', 80);
INSERT INTO `czasopisma` VALUES (7, 'Motor-Presse Polska', 'Auto Świat', '2023-06-02', 120);
INSERT INTO `czasopisma` VALUES (8, 'Bauer', 'Gazeta Wyborcza', '2023-05-15', 100);
INSERT INTO `czasopisma` VALUES (9, 'Bauer', 'Viva!', '2023-06-01', 200);
INSERT INTO `czasopisma` VALUES (10, 'Polityka', 'Wprost', '2023-04-20', 149);
INSERT INTO `czasopisma` VALUES (11, 'Ringier Axel Springer', 'Forbes Polska', '2023-05-10', 80);
INSERT INTO `czasopisma` VALUES (12, 'Agora', 'Przekrój', '2023-06-02', 120);
INSERT INTO `czasopisma` VALUES (13, 'Bauer', 'Twoje Imperium', '2023-05-15', 100);
INSERT INTO `czasopisma` VALUES (14, 'Bauer', 'Kuchnia', '2023-06-01', 200);
INSERT INTO `czasopisma` VALUES (15, 'Bauer', 'Komputer Świat', '2023-04-20', 150);
INSERT INTO `czasopisma` VALUES (16, 'Ringier Axel Springer', 'Fakt', '2023-05-10', 80);
INSERT INTO `czasopisma` VALUES (17, 'Motor-Presse Polska', '4x4 Magazine', '2023-06-02', 120);
INSERT INTO `czasopisma` VALUES (18, 'Bauer', 'National Geographic Traveler', '2023-05-15', 100);
INSERT INTO `czasopisma` VALUES (19, 'Burda', 'Przegląd Sportowy', '2023-06-01', 200);
INSERT INTO `czasopisma` VALUES (20, 'Bauer', 'Wiedza i Życie', '2023-04-20', 150);

-- ----------------------------
-- Table structure for komiksy
-- ----------------------------
DROP TABLE IF EXISTS `komiksy`;
CREATE TABLE `komiksy`  (
  `ID_komiksy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tytul` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_wydania` date NULL DEFAULT NULL,
  `ilosc_egzemplarzy` int(250) NOT NULL,
  PRIMARY KEY (`ID_komiksy`) USING BTREE,
  INDEX `ID_komiksy`(`ID_komiksy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komiksy
-- ----------------------------
INSERT INTO `komiksy` VALUES (1, 'Szninkiel', '1988-01-03', 14);
INSERT INTO `komiksy` VALUES (2, 'Kajko i Kokosz. Na wczasach', '1983-02-08', 25);
INSERT INTO `komiksy` VALUES (3, 'Kajko i Kokosz. Złoty Puchar', '1983-07-10', 154);
INSERT INTO `komiksy` VALUES (4, 'Kajko i Kokosz. Wielki Turniej', '1976-01-11', 21);
INSERT INTO `komiksy` VALUES (5, 'Kajko i Kokosz. Szkoła Latania', '1975-09-01', 53);
INSERT INTO `komiksy` VALUES (6, 'Tytus, Romek i A\'Tomek. Księga I', '1966-01-01', 31);
INSERT INTO `komiksy` VALUES (7, 'Tytus, Romek i A\'Tomek. Księga II', '1967-01-01', 52);
INSERT INTO `komiksy` VALUES (8, 'Tytus, Romek i A\'Tomek. Księga III', '1968-01-01', 43);
INSERT INTO `komiksy` VALUES (9, 'Tytus, Romek i A\'Tomek. Księga IV', '1969-01-01', 64);
INSERT INTO `komiksy` VALUES (10, 'Tytus, Romek i A\'Tomek. Księga V', '1970-01-01', 34);
INSERT INTO `komiksy` VALUES (11, 'Superman: Czerwony Syn', '2022-01-15', 312);
INSERT INTO `komiksy` VALUES (12, 'Batman: Tajemnica Arkham', '2021-07-22', 321);
INSERT INTO `komiksy` VALUES (13, 'Spider-Man: Kraven\'s Last Hunt', '2020-05-10', 201);
INSERT INTO `komiksy` VALUES (14, 'Wonder Woman: The Hiketeia', '2019-11-05', 153);
INSERT INTO `komiksy` VALUES (15, 'X-Men: Dark Phoenix Saga', '2018-03-18', 115);
INSERT INTO `komiksy` VALUES (16, 'Superman: All-Star Superman', '2017-09-02', 93);
INSERT INTO `komiksy` VALUES (17, 'Deadpool: The Good, the Band and the Ugly', '2016-12-11', 103);
INSERT INTO `komiksy` VALUES (18, 'The Walking Dead: Days Gone Bye', '2015-08-28', 93);
INSERT INTO `komiksy` VALUES (19, 'Watchmen', '2013-02-05', 183);
INSERT INTO `komiksy` VALUES (20, 'Sandman: Preludia i nokturny', '2012-06-20', 1);

-- ----------------------------
-- Table structure for komiksy_autorzy_wiele_do_wielu
-- ----------------------------
DROP TABLE IF EXISTS `komiksy_autorzy_wiele_do_wielu`;
CREATE TABLE `komiksy_autorzy_wiele_do_wielu`  (
  `ID_komiksy` int(10) UNSIGNED NOT NULL,
  `ID_autora` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_komiksy`, `ID_autora`) USING BTREE,
  INDEX `ID_autora`(`ID_autora`) USING BTREE,
  CONSTRAINT `komiksy_autorzy_wiele_do_wielu_ibfk_1` FOREIGN KEY (`ID_komiksy`) REFERENCES `komiksy` (`ID_komiksy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `komiksy_autorzy_wiele_do_wielu_ibfk_2` FOREIGN KEY (`ID_autora`) REFERENCES `autorzy` (`ID_autora`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komiksy_autorzy_wiele_do_wielu
-- ----------------------------
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (1, 21);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (1, 22);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (3, 21);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (3, 22);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (5, 22);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (6, 23);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (7, 23);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (8, 23);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (9, 23);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (10, 23);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (11, 24);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (12, 25);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (13, 26);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (14, 27);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (15, 28);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (16, 29);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (17, 30);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (18, 31);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (19, 25);
INSERT INTO `komiksy_autorzy_wiele_do_wielu` VALUES (20, 33);

-- ----------------------------
-- Table structure for ksiazki
-- ----------------------------
DROP TABLE IF EXISTS `ksiazki`;
CREATE TABLE `ksiazki`  (
  `ID_ksiazki` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_autora` int(11) UNSIGNED NOT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'International Standard Book Number',
  `tytul` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_wydania` date NULL DEFAULT NULL,
  `ilosc_egzemplarzy` int(250) NOT NULL,
  PRIMARY KEY (`ID_ksiazki`, `ID_autora`) USING BTREE,
  UNIQUE INDEX `isbn`(`ISBN`) USING BTREE,
  INDEX `ID_autora`(`ID_autora`) USING BTREE,
  INDEX `ID_ksiazki`(`ID_ksiazki`) USING BTREE,
  CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`ID_autora`) REFERENCES `autorzy` (`ID_autora`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ksiazki
-- ----------------------------
INSERT INTO `ksiazki` VALUES (1, 1, '9788377916384', 'Romeo i Julia', '1983-06-04', 49);
INSERT INTO `ksiazki` VALUES (2, 1, '8373272526', 'Hamlet', '1989-06-04', 39);
INSERT INTO `ksiazki` VALUES (3, 5, '978-83-08-07523-4', 'Księgi Jakubowe', '2014-10-01', 23);
INSERT INTO `ksiazki` VALUES (4, 7, '978-83-819-5845-5', 'Behawiorysta', '2016-10-01', 0);

-- ----------------------------
-- Table structure for oplaty
-- ----------------------------
DROP TABLE IF EXISTS `oplaty`;
CREATE TABLE `oplaty`  (
  `ID_oplaty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_wypozyczenia` int(10) UNSIGNED NOT NULL,
  `data_naliczenia` date NULL DEFAULT NULL,
  `kwota` double UNSIGNED NULL DEFAULT NULL,
  `termin_zaplaty` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_oplaty`) USING BTREE,
  INDEX `oplaty`(`ID_wypozyczenia`) USING BTREE,
  CONSTRAINT `oplaty` FOREIGN KEY (`ID_wypozyczenia`) REFERENCES `wypozyczenia_uzytkownicy` (`ID_wypozyczenia`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oplaty
-- ----------------------------
INSERT INTO `oplaty` VALUES (119, 38, '2023-06-04', 9, '2023-07-04');
INSERT INTO `oplaty` VALUES (120, 40, '2023-06-04', 0.2, '2023-07-04');

-- ----------------------------
-- Table structure for rezerwacje
-- ----------------------------
DROP TABLE IF EXISTS `rezerwacje`;
CREATE TABLE `rezerwacje`  (
  `ID_rezerwacji` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_uzytkownicy` int(10) UNSIGNED NOT NULL,
  `ID_ksiazki` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_audiobooka` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_czasopisma` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_komiksy` int(10) UNSIGNED NULL DEFAULT NULL,
  `data_rezerwacji` datetime NOT NULL,
  PRIMARY KEY (`ID_rezerwacji`) USING BTREE,
  INDEX `ID_uzytkownicy`(`ID_uzytkownicy`) USING BTREE,
  INDEX `ID_ksiazki`(`ID_ksiazki`) USING BTREE,
  INDEX `ID_audiobooka`(`ID_audiobooka`) USING BTREE,
  INDEX `ID_czasopisma`(`ID_czasopisma`) USING BTREE,
  INDEX `ID_komiksy`(`ID_komiksy`) USING BTREE,
  CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`ID_uzytkownicy`) REFERENCES `uzytkownicy` (`ID_uzytkownicy`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`ID_ksiazki`) REFERENCES `ksiazki` (`ID_ksiazki`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rezerwacje_ibfk_3` FOREIGN KEY (`ID_audiobooka`) REFERENCES `audiobooki` (`ID_audiobooka`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rezerwacje_ibfk_4` FOREIGN KEY (`ID_czasopisma`) REFERENCES `czasopisma` (`ID_czasopisma`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rezerwacje_ibfk_5` FOREIGN KEY (`ID_komiksy`) REFERENCES `komiksy` (`ID_komiksy`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rezerwacje
-- ----------------------------
INSERT INTO `rezerwacje` VALUES (2, 5, NULL, NULL, NULL, NULL, '2023-06-02 15:19:21');
INSERT INTO `rezerwacje` VALUES (3, 5, NULL, NULL, NULL, NULL, '2023-06-02 15:20:07');

-- ----------------------------
-- Table structure for typ_konta
-- ----------------------------
DROP TABLE IF EXISTS `typ_konta`;
CREATE TABLE `typ_konta`  (
  `ID_typ_konta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_typu_konta` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_konta`) USING BTREE,
  UNIQUE INDEX `nazwa_typu_konta`(`nazwa_typu_konta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typ_konta
-- ----------------------------
INSERT INTO `typ_konta` VALUES (2, 'Pracownik');
INSERT INTO `typ_konta` VALUES (1, 'Student');
INSERT INTO `typ_konta` VALUES (3, 'Użytkownik');

-- ----------------------------
-- Table structure for uzytkownicy
-- ----------------------------
DROP TABLE IF EXISTS `uzytkownicy`;
CREATE TABLE `uzytkownicy`  (
  `ID_uzytkownicy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imie` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nazwisko` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `ilosc_wypozyczen` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_uzytkownicy`) USING BTREE,
  UNIQUE INDEX `login_unique`(`login`) USING BTREE,
  CONSTRAINT `haslo` CHECK (char_length(`haslo`) > 8),
  CONSTRAINT `ilosc_wypozyczen` CHECK (`ilosc_wypozyczen` < 15)
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uzytkownicy
-- ----------------------------
INSERT INTO `uzytkownicy` VALUES (5, 'Dominika', 'domek', 'dominika123', 'Hojniak', '2002-11-14', 11);
INSERT INTO `uzytkownicy` VALUES (6, 'Kinga', 'kiniol', 'dominika123', 'Furmanek', '2002-11-14', 2);
INSERT INTO `uzytkownicy` VALUES (7, 'Lukasz', 'llech', 'dominika1', 'Lech', '2002-11-01', NULL);
INSERT INTO `uzytkownicy` VALUES (8, 'Gerard', 'Gerardzik', 'ggggggggg', 'Grzyb', '2001-07-10', NULL);
INSERT INTO `uzytkownicy` VALUES (9, 'Ania', 'ankaa', 'Misio12345', 'Nowak', '2004-06-16', NULL);
INSERT INTO `uzytkownicy` VALUES (10, 'Jan', 'janek', 'jaaaaktoooo', 'Ostrowski', '1989-01-02', NULL);
INSERT INTO `uzytkownicy` VALUES (11, 'Ola', 'olkaaa', '123olaalaaa', 'Kowalska', '1979-05-15', NULL);
INSERT INTO `uzytkownicy` VALUES (12, 'Tomek', 'tomeczek', 'halooo13111', 'Nowak', '1988-12-26', NULL);
INSERT INTO `uzytkownicy` VALUES (13, 'Rafał', 'rafał999', 'rorrreee798', 'Podgórski', '1999-06-24', NULL);

-- ----------------------------
-- Table structure for uzytkownicy_typ_konta
-- ----------------------------
DROP TABLE IF EXISTS `uzytkownicy_typ_konta`;
CREATE TABLE `uzytkownicy_typ_konta`  (
  `ID_uzytkownicy` int(10) UNSIGNED NOT NULL,
  `ID_typ_konta` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_uzytkownicy`, `ID_typ_konta`) USING BTREE,
  INDEX `ID_typ_konta`(`ID_typ_konta`) USING BTREE,
  CONSTRAINT `uzytkownicy_typ_konta_ibfk_1` FOREIGN KEY (`ID_uzytkownicy`) REFERENCES `uzytkownicy` (`ID_uzytkownicy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uzytkownicy_typ_konta_ibfk_2` FOREIGN KEY (`ID_typ_konta`) REFERENCES `typ_konta` (`ID_typ_konta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uzytkownicy_typ_konta
-- ----------------------------
INSERT INTO `uzytkownicy_typ_konta` VALUES (6, 1);
INSERT INTO `uzytkownicy_typ_konta` VALUES (6, 2);
INSERT INTO `uzytkownicy_typ_konta` VALUES (9, 2);
INSERT INTO `uzytkownicy_typ_konta` VALUES (10, 3);
INSERT INTO `uzytkownicy_typ_konta` VALUES (13, 1);

-- ----------------------------
-- Table structure for wypozyczenia_uzytkownicy
-- ----------------------------
DROP TABLE IF EXISTS `wypozyczenia_uzytkownicy`;
CREATE TABLE `wypozyczenia_uzytkownicy`  (
  `ID_wypozyczenia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_uzytkownicy` int(10) UNSIGNED NOT NULL,
  `data_wypozyczenia` date NOT NULL,
  `termin_oddania` date NULL DEFAULT NULL,
  `data_oddania` date NULL DEFAULT NULL,
  `ID_ksiazki` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_audiobooka` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_czasopisma` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_komiksy` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_wypozyczenia`) USING BTREE,
  INDEX `ID_uzytkownicy`(`ID_uzytkownicy`) USING BTREE,
  INDEX `ksiazki`(`ID_ksiazki`) USING BTREE,
  INDEX `audiobook`(`ID_audiobooka`) USING BTREE,
  INDEX `czasopisma`(`ID_czasopisma`) USING BTREE,
  INDEX `komiks`(`ID_komiksy`) USING BTREE,
  CONSTRAINT `audiobook` FOREIGN KEY (`ID_audiobooka`) REFERENCES `audiobooki` (`ID_audiobooka`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `czasopisma` FOREIGN KEY (`ID_czasopisma`) REFERENCES `czasopisma` (`ID_czasopisma`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `komiks` FOREIGN KEY (`ID_komiksy`) REFERENCES `komiksy` (`ID_komiksy`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ksiazki` FOREIGN KEY (`ID_ksiazki`) REFERENCES `ksiazki` (`ID_ksiazki`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wypozyczenia_uzytkownicy_ibfk_1` FOREIGN KEY (`ID_uzytkownicy`) REFERENCES `uzytkownicy` (`ID_uzytkownicy`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_wypozyczenia` CHECK (`data_wypozyczenia` < `termin_oddania`)
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic WITH SYSTEM VERSIONING;

-- ----------------------------
-- Records of wypozyczenia_uzytkownicy
-- ----------------------------
INSERT INTO `wypozyczenia_uzytkownicy` VALUES (38, 5, '2023-04-01', '2023-04-20', NULL, 3, NULL, NULL, NULL);
INSERT INTO `wypozyczenia_uzytkownicy` VALUES (40, 10, '2023-06-02', '2023-06-03', NULL, 3, NULL, NULL, NULL);
INSERT INTO `wypozyczenia_uzytkownicy` VALUES (41, 10, '2023-06-04', '2023-07-04', NULL, NULL, 6, NULL, NULL);
INSERT INTO `wypozyczenia_uzytkownicy` VALUES (42, 12, '2023-06-04', '2023-07-04', NULL, NULL, 12, NULL, NULL);
INSERT INTO `wypozyczenia_uzytkownicy` VALUES (43, 5, '2023-06-04', '2023-07-04', NULL, 1, NULL, NULL, NULL);

-- ----------------------------
-- View structure for view_liczba_wypozyczen
-- ----------------------------
DROP VIEW IF EXISTS `view_liczba_wypozyczen`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_liczba_wypozyczen` AS select coalesce(`k`.`tytul`,`a`.`tytul`,`c`.`tytul`,`ko`.`tytul`) AS `wypozyczony_tytul`,count(0) AS `liczba_wypozyczen` from ((((`wypozyczenia_uzytkownicy` `w` left join `ksiazki` `k` on(`w`.`ID_ksiazki` = `k`.`ID_ksiazki`)) left join `audiobooki` `a` on(`w`.`ID_audiobooka` = `a`.`ID_audiobooka`)) left join `czasopisma` `c` on(`w`.`ID_czasopisma` = `c`.`ID_czasopisma`)) left join `komiksy` `ko` on(`w`.`ID_komiksy` = `ko`.`ID_komiksy`)) group by coalesce(`k`.`tytul`,`a`.`tytul`,`c`.`tytul`,`ko`.`tytul`);

-- ----------------------------
-- View structure for view_uzytkownicy_rezerwacje
-- ----------------------------
DROP VIEW IF EXISTS `view_uzytkownicy_rezerwacje`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_uzytkownicy_rezerwacje` AS select `u`.`imie` AS `imie`,`u`.`nazwisko` AS `nazwisko`,coalesce(`k`.`tytul`,`a`.`tytul`,`c`.`tytul`,`ko`.`tytul`) AS `zarezerwowany_tytul` from (((((`uzytkownicy` `u` left join `rezerwacje` `r` on(`u`.`ID_uzytkownicy` = `r`.`ID_uzytkownicy`)) left join `ksiazki` `k` on(`r`.`ID_ksiazki` = `k`.`ID_ksiazki`)) left join `audiobooki` `a` on(`r`.`ID_audiobooka` = `a`.`ID_audiobooka`)) left join `czasopisma` `c` on(`r`.`ID_czasopisma` = `c`.`ID_czasopisma`)) left join `komiksy` `ko` on(`r`.`ID_komiksy` = `ko`.`ID_komiksy`));

-- ----------------------------
-- View structure for view_uzytkownicy_typ_konta
-- ----------------------------
DROP VIEW IF EXISTS `view_uzytkownicy_typ_konta`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_uzytkownicy_typ_konta` AS select `u`.`imie` AS `imie`,`u`.`nazwisko` AS `nazwisko`,`tk`.`nazwa_typu_konta` AS `nazwa_typu_konta` from ((`uzytkownicy` `u` join `uzytkownicy_typ_konta` `utk` on(`u`.`ID_uzytkownicy` = `utk`.`ID_uzytkownicy`)) join `typ_konta` `tk` on(`utk`.`ID_typ_konta` = `tk`.`ID_typ_konta`));

-- ----------------------------
-- View structure for view_uzytkownicy_wypozyczenia
-- ----------------------------
DROP VIEW IF EXISTS `view_uzytkownicy_wypozyczenia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_uzytkownicy_wypozyczenia` AS select `u`.`imie` AS `imie`,`u`.`nazwisko` AS `nazwisko`,group_concat(coalesce(`k`.`tytul`,`a`.`tytul`,`c`.`tytul`,`ko`.`tytul`) separator ',') AS `wypozyczony_tytul` from (((((`uzytkownicy` `u` left join `wypozyczenia_uzytkownicy` `w` on(`u`.`ID_uzytkownicy` = `w`.`ID_uzytkownicy`)) left join `ksiazki` `k` on(`w`.`ID_ksiazki` = `k`.`ID_ksiazki`)) left join `audiobooki` `a` on(`w`.`ID_audiobooka` = `a`.`ID_audiobooka`)) left join `czasopisma` `c` on(`w`.`ID_czasopisma` = `c`.`ID_czasopisma`)) left join `komiksy` `ko` on(`w`.`ID_komiksy` = `ko`.`ID_komiksy`)) group by `u`.`imie`;

-- ----------------------------
-- Procedure structure for DodajAudiobook
-- ----------------------------
DROP PROCEDURE IF EXISTS `DodajAudiobook`;
delimiter ;;
CREATE PROCEDURE `DodajAudiobook`(IN p_ID_autora int,
    IN p_tytul varchar(250),
    IN p_data_wydania date,
    IN p_ilosc_egzemplarzy int,
		IN p_czas_trwania int(250))
BEGIN
    INSERT INTO audiobooki (ID_autora, tytul, data_wydania, ilosc_egzemplarzy, czas_trwania)
    VALUES (p_ID_autora, p_tytul, p_data_wydania, p_ilosc_egzemplarzy, p_czas_trwania);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DodajCzasopismo
-- ----------------------------
DROP PROCEDURE IF EXISTS `DodajCzasopismo`;
delimiter ;;
CREATE PROCEDURE `DodajCzasopismo`(IN p_wydawnictwo varchar(250),
    IN p_tytul varchar(250),
    IN p_data_wydania date,
    IN p_ilosc_egzemplarzy int(250))
BEGIN
    INSERT INTO czasopisma (wydawnictwo, tytul, data_wydania, ilosc_egzemplarzy)
    VALUES (p_wydawnictwo, p_tytul, p_data_wydania, p_ilosc_egzemplarzy);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DodajKomiks
-- ----------------------------
DROP PROCEDURE IF EXISTS `DodajKomiks`;
delimiter ;;
CREATE PROCEDURE `DodajKomiks`(IN p_ID_autora int,
                               IN p_tytul varchar(250),
                               IN p_data_wydania date,
                               IN p_ilosc_egzemplarzy int
)
BEGIN
INSERT INTO komiksy (ID_komiksy, tytul, data_wydania, ilosc_egzemplarzy)
VALUES (NULL, p_tytul, p_data_wydania, p_ilosc_egzemplarzy);

SET @last_id = LAST_INSERT_ID();  -- Retrieve the last inserted ID in the table

INSERT INTO komiksy_autorzy_wiele_do_wielu (ID_komiksy, ID_autora)
VALUES (@last_id, p_ID_autora);
END;

;;
delimiter ;

-- ----------------------------
-- Procedure structure for DodajKsiazke
-- ----------------------------
DROP PROCEDURE IF EXISTS `DodajKsiazke`;
delimiter ;;
CREATE PROCEDURE `DodajKsiazke`(IN p_ID_autora int,
    IN p_ISBN varchar(250),
    IN p_tytul varchar(250),
    IN p_data_wydania date,
    IN p_ilosc_egzemplarzy int)
BEGIN
    INSERT INTO ksiazki (ID_autora, ISBN, tytul, data_wydania, ilosc_egzemplarzy)
    VALUES (p_ID_autora, p_ISBN, p_tytul, p_data_wydania, p_ilosc_egzemplarzy);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DodajUzytkownika
-- ----------------------------
DROP PROCEDURE IF EXISTS `DodajUzytkownika`;
delimiter ;;
CREATE PROCEDURE `DodajUzytkownika`(IN p_imie varchar(70),
    IN p_login varchar(255),
    IN p_haslo varchar(255),
    IN p_nazwisko varchar(250),
    IN p_data_urodzenia date)
BEGIN
    INSERT INTO uzytkownicy (imie, login, haslo, nazwisko, data_urodzenia, ilosc_wypozyczen)
    VALUES (p_imie, p_login, p_haslo, p_nazwisko, p_data_urodzenia, 0);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for OddajRzecz
-- ----------------------------
DROP PROCEDURE IF EXISTS `OddajRzecz`;
delimiter ;;
CREATE PROCEDURE `OddajRzecz`(IN p_ID_wypozyczenia INT)
BEGIN
  DECLARE v_ID_materialu INT;
  DECLARE v_ID_uzytkownicy INT;
  DECLARE v_typ_materialu VARCHAR(20);

  -- Pobierz typ_materialu na podstawie ID_wypozyczenia
SELECT
    CASE
        WHEN ID_ksiazki IS NOT NULL THEN 'ksiazka'
        WHEN ID_komiksy IS NOT NULL THEN 'komiks'
        WHEN ID_audiobooka IS NOT NULL THEN 'audiobook'
        WHEN ID_czasopisma IS NOT NULL THEN 'czasopismo'
        END INTO v_typ_materialu
FROM wypozyczenia_uzytkownicy
WHERE ID_wypozyczenia = p_ID_wypozyczenia;

IF v_typ_materialu = 'ksiazka' THEN
    -- Zwiększ ilosc_egzemplarzy o 1 dla książki
SELECT ID_ksiazki, ID_uzytkownicy INTO v_ID_materialu, v_ID_uzytkownicy FROM wypozyczenia_uzytkownicy WHERE ID_wypozyczenia = p_ID_wypozyczenia;
UPDATE ksiazki SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_ksiazki = v_ID_materialu;
ELSEIF v_typ_materialu = 'komiks' THEN
    -- Zwiększ ilosc_egzemplarzy o 1 dla komiksu
SELECT ID_komiksy, ID_uzytkownicy INTO v_ID_materialu, v_ID_uzytkownicy FROM wypozyczenia_uzytkownicy WHERE ID_wypozyczenia = p_ID_wypozyczenia;
UPDATE komiksy SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_komiksy = v_ID_materialu;
ELSEIF v_typ_materialu = 'audiobook' THEN
    -- Zwiększ ilosc_egzemplarzy o 1 dla audiobooka
SELECT ID_audiobooka, ID_uzytkownicy INTO v_ID_materialu, v_ID_uzytkownicy FROM wypozyczenia_uzytkownicy WHERE ID_wypozyczenia = p_ID_wypozyczenia;
UPDATE audiobooki SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_audiobooka = v_ID_materialu;
ELSEIF v_typ_materialu = 'czasopismo' THEN
    -- Zwiększ ilosc_egzemplarzy o 1 dla czasopisma
SELECT ID_czasopisma, ID_uzytkownicy INTO v_ID_materialu, v_ID_uzytkownicy FROM wypozyczenia_uzytkownicy WHERE ID_wypozyczenia = p_ID_wypozyczenia;
UPDATE czasopisma SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_czasopisma = v_ID_materialu;
END IF;

  -- Zmniejsz ilosc_wypozyczen o 1 dla użytkownika
UPDATE uzytkownicy SET ilosc_wypozyczen = ilosc_wypozyczen - 1 WHERE ID_uzytkownicy = v_ID_uzytkownicy;

-- Ustaw data_oddania na bieżącą datę
UPDATE wypozyczenia_uzytkownicy SET data_oddania = CURRENT_DATE() WHERE ID_wypozyczenia = p_ID_wypozyczenia;

-- Usuń wypożyczenie z tabeli wypozyczenia_uzytkownicy
DELETE FROM wypozyczenia_uzytkownicy WHERE ID_wypozyczenia = p_ID_wypozyczenia;
END


;;
delimiter ;

-- ----------------------------
-- Procedure structure for OplacKare
-- ----------------------------
DROP PROCEDURE IF EXISTS `OplacKare`;
delimiter ;;
CREATE PROCEDURE `OplacKare`(IN p_ID_oplaty INT)
BEGIN

  DECLARE v_ID_wypozyczenia INT;
  DECLARE v_data_naliczenia DATE;
  DECLARE v_kwota DOUBLE;
  DECLARE v_termin_zaplaty DATE;
    
  -- Pobierz dane oplaty
SELECT ID_wypozyczenia, data_naliczenia, kwota, termin_zaplaty
INTO v_ID_wypozyczenia, v_data_naliczenia, v_kwota, v_termin_zaplaty
FROM oplaty
WHERE ID_oplaty = p_ID_oplaty;

-- Wstaw dane oplaty do archiwum_oplat
INSERT INTO archiwum_oplat (ID_oplaty, ID_wypozyczenia, data_naliczenia, kwota, termin_zaplaty, data_zaplaty)
VALUES (p_ID_oplaty, v_ID_wypozyczenia, v_data_naliczenia, v_kwota, v_termin_zaplaty, CURRENT_DATE);

-- Usuń rekord z tabeli oplaty
DELETE FROM oplaty WHERE ID_oplaty = p_ID_oplaty;

END;

;;
delimiter ;

-- ----------------------------
-- Procedure structure for PobierzWypozyczeniaUzytkownika
-- ----------------------------
DROP PROCEDURE IF EXISTS `PobierzWypozyczeniaUzytkownika`;
delimiter ;;
CREATE PROCEDURE `PobierzWypozyczeniaUzytkownika`(IN p_ID_uzytkownika INT
)
BEGIN
SELECT
    w.ID_wypozyczenia,
    CASE
        WHEN w.ID_ksiazki IS NOT NULL THEN k.tytul
        WHEN w.ID_audiobooka IS NOT NULL THEN a.tytul
        WHEN w.ID_czasopisma IS NOT NULL THEN c.tytul
        WHEN w.ID_komiksy IS NOT NULL THEN ko.tytul
        END AS 'tytul',
        CASE
            WHEN w.ID_ksiazki IS NOT NULL THEN 'Książka'
            WHEN w.ID_audiobooka IS NOT NULL THEN 'Audiobook'
            WHEN w.ID_czasopisma IS NOT NULL THEN 'Czasopismo'
            WHEN w.ID_komiksy IS NOT NULL THEN 'Komiks'
            END AS 'kategoria',
        w.data_wypozyczenia AS 'data wypozyczenia',
        w.data_oddania AS 'data oddania'
FROM wypozyczenia_uzytkownicy w
         LEFT JOIN ksiazki k ON w.ID_ksiazki = k.ID_ksiazki
         LEFT JOIN audiobooki a ON w.ID_audiobooka = a.ID_audiobooka
         LEFT JOIN czasopisma c ON w.ID_czasopisma = c.ID_czasopisma
         LEFT JOIN komiksy ko ON w.ID_komiksy = ko.ID_komiksy
WHERE w.ID_uzytkownicy = p_ID_uzytkownika
ORDER BY w.ID_wypozyczenia ASC;
END;


;;
delimiter ;

-- ----------------------------
-- Procedure structure for RealizujRezerwacjeRzeczy
-- ----------------------------
DROP PROCEDURE IF EXISTS `RealizujRezerwacjeRzeczy`;
delimiter ;;
CREATE PROCEDURE `RealizujRezerwacjeRzeczy`(IN p_ID_rezerwacji INT
)
BEGIN
    DECLARE v_ID_uzytkownicy INT;
    DECLARE v_ID_ksiazki INT;
    DECLARE v_ID_audiobooka INT;
    DECLARE v_ID_czasopisma INT;
    DECLARE v_ID_komiksy INT;
    DECLARE v_typ_materialu VARCHAR(10);

START TRANSACTION;

SELECT ID_uzytkownicy, ID_ksiazki, ID_audiobooka, ID_czasopisma, ID_komiksy
INTO v_ID_uzytkownicy, v_ID_ksiazki, v_ID_audiobooka, v_ID_czasopisma, v_ID_komiksy
FROM rezerwacje
WHERE ID_rezerwacji = p_ID_rezerwacji
    FOR UPDATE;

DELETE FROM rezerwacje WHERE ID_rezerwacji = p_ID_rezerwacji;

IF v_ID_ksiazki IS NOT NULL THEN
        SET v_typ_materialu = 'ksiazka';
UPDATE ksiazki SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_ksiazki = v_ID_ksiazki;
ELSEIF v_ID_audiobooka IS NOT NULL THEN
        SET v_typ_materialu = 'audiobook';
UPDATE audiobooki SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_audiobooka = v_ID_audiobooka;
ELSEIF v_ID_czasopisma IS NOT NULL THEN
        SET v_typ_materialu = 'czasopismo';
UPDATE czasopisma SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_czasopisma = v_ID_czasopisma;
ELSEIF v_ID_komiksy IS NOT NULL THEN
        SET v_typ_materialu = 'komiks';
UPDATE komiksy SET ilosc_egzemplarzy = ilosc_egzemplarzy + 1 WHERE ID_komiksy = v_ID_komiksy;
END IF;

    IF v_typ_materialu IS NOT NULL THEN
        COMMIT;
CALL WypozyczRzecz(v_ID_uzytkownicy, v_ID_ksiazki, v_typ_materialu);
ELSE
        ROLLBACK;
END IF;
END;


;;
delimiter ;

-- ----------------------------
-- Procedure structure for RezerwujRzecz
-- ----------------------------
DROP PROCEDURE IF EXISTS `RezerwujRzecz`;
delimiter ;;
CREATE PROCEDURE `RezerwujRzecz`(IN p_ID_uzytkownicy INT,
                                 IN p_typ_materialu VARCHAR(10),
                                 IN p_ID_materialu INT
)
BEGIN
    DECLARE v_available INT;

START TRANSACTION;

IF p_typ_materialu = 'audiobook' THEN
SELECT COUNT(*) INTO v_available
FROM audiobooki
WHERE ID_audiobooka = p_ID_materialu
  AND ilosc_egzemplarzy > 0
    FOR UPDATE;

IF v_available > 0 THEN
            INSERT INTO rezerwacje (ID_uzytkownicy, ID_audiobooka, data_rezerwacji)
            VALUES (p_ID_uzytkownicy, p_ID_materialu, NOW());

UPDATE audiobooki
SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1
WHERE ID_audiobooka = p_ID_materialu;

COMMIT;
ELSE
            ROLLBACK;
END IF;
        
    ELSEIF p_typ_materialu = 'czasopismo' THEN
SELECT COUNT(*) INTO v_available
FROM czasopisma
WHERE ID_czasopisma = p_ID_materialu
  AND ilosc_egzemplarzy > 0
    FOR UPDATE;

IF v_available > 0 THEN
            INSERT INTO rezerwacje (ID_uzytkownicy, ID_czasopisma, data_rezerwacji)
            VALUES (p_ID_uzytkownicy, p_ID_materialu, NOW());

UPDATE czasopisma
SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1
WHERE ID_czasopisma = p_ID_materialu;

COMMIT;
ELSE
            ROLLBACK;
END IF;
        
    ELSEIF p_typ_materialu = 'komiks' THEN
SELECT COUNT(*) INTO v_available
FROM komiksy
WHERE ID_komiksy = p_ID_materialu
  AND ilosc_egzemplarzy > 0
    FOR UPDATE;

IF v_available > 0 THEN
            INSERT INTO rezerwacje (ID_uzytkownicy, ID_komiksy, data_rezerwacji)
            VALUES (p_ID_uzytkownicy, p_ID_materialu, NOW());

UPDATE komiksy
SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1
WHERE ID_komiksy = p_ID_materialu;

COMMIT;
ELSE
            ROLLBACK;
END IF;
        
    ELSEIF p_typ_materialu = 'ksiazka' THEN
SELECT COUNT(*) INTO v_available
FROM ksiazki
WHERE ID_ksiazki = p_ID_materialu
  AND ilosc_egzemplarzy > 0
    FOR UPDATE;

IF v_available > 0 THEN
            INSERT INTO rezerwacje (ID_uzytkownicy, ID_ksiazki, data_rezerwacji)
            VALUES (p_ID_uzytkownicy, p_ID_materialu, NOW());

UPDATE ksiazki
SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1
WHERE ID_ksiazki = p_ID_materialu;

COMMIT;
ELSE
            ROLLBACK;
END IF;

ELSE
        ROLLBACK;
END IF;
END;


;;
delimiter ;

-- ----------------------------
-- Procedure structure for WypozyczRzecz
-- ----------------------------
DROP PROCEDURE IF EXISTS `WypozyczRzecz`;
delimiter ;;
CREATE PROCEDURE `WypozyczRzecz`(IN p_ID_uzytkownika INT,
                                 IN p_ID_elementu INT,
                                 IN p_typ_elementu VARCHAR(10)
)
BEGIN
    DECLARE v_ilosc_egzemplarzy INT;
    DECLARE v_data_wypozyczenia DATE;

    SET v_data_wypozyczenia = CURDATE();

    IF p_typ_elementu = 'czasopismo' THEN
SELECT ilosc_egzemplarzy INTO v_ilosc_egzemplarzy FROM czasopisma WHERE ID_czasopisma = p_ID_elementu;

IF v_ilosc_egzemplarzy > 0 THEN
            INSERT INTO wypozyczenia_uzytkownicy (ID_uzytkownicy, ID_ksiazki, ID_audiobooka, ID_czasopisma, ID_komiksy, data_wypozyczenia, termin_oddania)
            VALUES (p_ID_uzytkownika, NULL, NULL, p_ID_elementu, NULL, v_data_wypozyczenia, NULL);
UPDATE uzytkownicy SET ilosc_wypozyczen = ilosc_wypozyczen + 1 WHERE ID_uzytkownicy = p_ID_uzytkownika;
UPDATE czasopisma SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1 WHERE ID_czasopisma = p_ID_elementu;
ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak dostępnych egzemplarzy';
END IF;

    ELSEIF p_typ_elementu = 'audiobook' THEN
SELECT ilosc_egzemplarzy INTO v_ilosc_egzemplarzy FROM audiobooki WHERE ID_audiobooka = p_ID_elementu;

IF v_ilosc_egzemplarzy > 0 THEN
            INSERT INTO wypozyczenia_uzytkownicy (ID_uzytkownicy, ID_ksiazki, ID_audiobooka, ID_czasopisma, ID_komiksy, data_wypozyczenia, termin_oddania)
            VALUES (p_ID_uzytkownika, NULL, p_ID_elementu, NULL, NULL, v_data_wypozyczenia, NULL);

UPDATE uzytkownicy SET ilosc_wypozyczen = ilosc_wypozyczen + 1 WHERE ID_uzytkownicy = p_ID_uzytkownika;
UPDATE audiobooki SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1 WHERE ID_audiobooka = p_ID_elementu;
ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak dostępnych egzemplarzy';
END IF;

    ELSEIF p_typ_elementu = 'ksiazka' THEN
SELECT ilosc_egzemplarzy INTO v_ilosc_egzemplarzy FROM ksiazki WHERE ID_ksiazki = p_ID_elementu;

IF v_ilosc_egzemplarzy > 0 THEN
            INSERT INTO wypozyczenia_uzytkownicy (ID_uzytkownicy, ID_ksiazki, ID_audiobooka, ID_czasopisma, ID_komiksy, data_wypozyczenia, termin_oddania)
            VALUES (p_ID_uzytkownika, p_ID_elementu, NULL, NULL, NULL, v_data_wypozyczenia, NULL);

UPDATE uzytkownicy SET ilosc_wypozyczen = ilosc_wypozyczen + 1 WHERE ID_uzytkownicy = p_ID_uzytkownika;
UPDATE ksiazki SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1 WHERE ID_ksiazki = p_ID_elementu;
ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak dostępnych egzemplarzy';
END IF;

    ELSEIF p_typ_elementu = 'komiks' THEN
SELECT ilosc_egzemplarzy INTO v_ilosc_egzemplarzy FROM komiksy WHERE ID_komiksy = p_ID_elementu;

IF v_ilosc_egzemplarzy > 0 THEN
            INSERT INTO wypozyczenia_uzytkownicy (ID_uzytkownicy, ID_ksiazki, ID_audiobooka, ID_czasopisma, ID_komiksy, data_wypozyczenia, termin_oddania)
            VALUES (p_ID_uzytkownika, NULL, NULL, NULL, p_ID_elementu, v_data_wypozyczenia, NULL);

UPDATE uzytkownicy SET ilosc_wypozyczen = ilosc_wypozyczen + 1 WHERE ID_uzytkownicy = p_ID_uzytkownika;
UPDATE komiksy SET ilosc_egzemplarzy = ilosc_egzemplarzy - 1 WHERE ID_komiksy = p_ID_elementu;
ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak dostępnych egzemplarzy';
END IF;

ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nieprawidłowy typ elementu';
END IF;
END;


;;
delimiter ;

-- ----------------------------
-- Procedure structure for Znajdz_Publikacje_Autora
-- ----------------------------
DROP PROCEDURE IF EXISTS `Znajdz_Publikacje_Autora`;
delimiter ;;
CREATE PROCEDURE `Znajdz_Publikacje_Autora`(IN nazwisko_autora VARCHAR(100))
BEGIN
  DECLARE publikacje_tytuly VARCHAR(10000);
  DECLARE kategoria_publikacji VARCHAR(100);

SELECT GROUP_CONCAT(CONCAT(kategoria, ': ', tytul) SEPARATOR ', ') INTO publikacje_tytuly
FROM (
         SELECT 'Książki' AS kategoria, tytul
         FROM ksiazki
         WHERE ID_autora IN (SELECT ID_autora FROM autorzy WHERE nazwisko = nazwisko_autora)
         UNION ALL
         SELECT 'Audiobooki', tytul
         FROM audiobooki
         WHERE ID_autora IN (SELECT ID_autora FROM autorzy WHERE nazwisko = nazwisko_autora)
         UNION ALL
         SELECT 'Komiksy', tytul
         FROM komiksy
         WHERE ID_komiksy IN (SELECT ID_komiksy FROM komiksy_autorzy_wiele_do_wielu WHERE ID_autora IN (SELECT ID_autora FROM autorzy WHERE nazwisko = nazwisko_autora))
     ) AS publikacje;

IF publikacje_tytuly IS NOT NULL THEN
SELECT publikacje_tytuly AS publikacja;
END IF;

END;


;;
delimiter ;

-- ----------------------------
-- Event structure for NaliczOplateEvent2
-- ----------------------------
DROP EVENT IF EXISTS `NaliczOplateEvent2`;
delimiter ;;
CREATE EVENT `NaliczOplateEvent2`
ON SCHEDULE
EVERY '1' DAY STARTS '2023-06-04 15:41:00'
DO BEGIN
  DECLARE today DATE;
  SET today = CURDATE();

  -- Nalicz opłatę dla przeterminowanych wypożyczeń
  INSERT INTO oplaty (ID_wypozyczenia, data_naliczenia, kwota, termin_zaplaty)
  SELECT ID_wypozyczenia, today, DATEDIFF(today, termin_oddania) * 0.2, today + INTERVAL 30 DAY
  FROM wypozyczenia_uzytkownicy
  WHERE termin_oddania < today
    AND ID_wypozyczenia NOT IN (SELECT ID_wypozyczenia FROM oplaty)
        AND wypozyczenia_uzytkownicy.data_oddania IS NULL;

END
;;
delimiter ;

-- ----------------------------
-- Event structure for ZaktualizujOplatyEvent
-- ----------------------------
DROP EVENT IF EXISTS `ZaktualizujOplatyEvent`;
delimiter ;;
CREATE EVENT `ZaktualizujOplatyEvent`
ON SCHEDULE
EVERY '1' DAY STARTS '2023-06-04 15:41:00'
DO BEGIN
DECLARE today DATE;
  SET today = CURDATE();
	
  UPDATE oplaty op
  LEFT JOIN wypozyczenia_uzytkownicy wu ON op.ID_wypozyczenia = wu.ID_wypozyczenia
  SET op.kwota = DATEDIFF(today, wu.termin_oddania) * 0.2
  WHERE wu.data_oddania IS NULL;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table wypozyczenia_uzytkownicy
-- ----------------------------
DROP TRIGGER IF EXISTS `calc_termin_oddania`;
delimiter ;;
CREATE TRIGGER `calc_termin_oddania` BEFORE INSERT ON `wypozyczenia_uzytkownicy` FOR EACH ROW BEGIN
  SET NEW.termin_oddania = DATE_ADD(NEW.data_wypozyczenia, INTERVAL 30 DAY);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
