create db bhu;
CREATE DATABASE agri;
USE agri;
CREATE TABLE sensor_data (
  id INT AUTO_INCREMENT PRIMARY KEY,
  topic VARCHAR(50) NOT NULL,
  value VARCHAR(50) NOT NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE control_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  device ENUM('motor', 'fogger') NOT NULL,
  state ENUM('on', 'off') NOT NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE sensor_data;

CREATE TABLE sensor_readings (
    timestamp DATETIME PRIMARY KEY DEFAULT CURRENT_TIMESTAMP,
    temp FLOAT,
    hum FLOAT,
    airpressure FLOAT,
    voc FLOAT,
    altitude FLOAT,
    moisture1 FLOAT,
    moisture2 FLOAT,
    ph FLOAT
);
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Maybe@123';
FLUSH PRIVILEGES;
ALTER TABLE sensor_readings ADD COLUMN growth_percentage FLOAT;
SELECT * FROM sensor_readings LIMIT 1;
INSERT INTO sensor_readings (temp, hum, airpressure, voc, altitude, moisture1, moisture2, ph) 
VALUES (25.6, 60.2, 1013.5, 0.8, 150.2, 45.5, 50.3, 6.8);

GRANT ALL PRIVILEGES ON *.* TO @'localhost' IDENTIFIED BY 'your_password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
DROP TABLE sensor_readings;

INSERT INTO sensor_readings (temp, hum, airpressure, voc, altitude, moisture1, moisture2, ph)
VALUES
(25.6, 60.2, 1013.5, 0.8, 150.2, 45.5, 50.3, 6.8),
(26.1, 61.0, 1014.0, 0.9, 152.0, 46.0, 51.0, 6.9),
(27.0, 62.5, 1015.0, 1.0, 153.5, 47.0, 52.0, 7.0),
(28.2, 64.0, 1016.0, 1.2, 155.0, 48.0, 53.0, 7.1),
(29.1, 65.0, 1017.0, 1.4, 157.0, 49.0, 54.0, 7.2),
(30.0, 66.5, 1020.0, 2.0, 160.0, 50.0, 55.0, 7.3);


CREATE TABLE growth_predictions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  growth_percentage FLOAT NOT NULL,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE wheatex (
    Commodity VARCHAR(50),
    Attribute VARCHAR(50),
    Unit VARCHAR(50),
    YearOfProjection INT,
    Year VARCHAR(10),
    Value INT
);

INSERT INTO wheatex (Commodity, Attribute, Unit, YearOfProjection, Year, Value) VALUES
('Wheat', 'Exports', 'Million bushels', 2025, '2023/24', 707),
('Wheat', 'Exports', 'Million bushels', 2025, '2024/25', 825),
('Wheat', 'Exports', 'Million bushels', 2025, '2025/26', 850),
('Wheat', 'Exports', 'Million bushels', 2025, '2026/27', 850),
('Wheat', 'Exports', 'Million bushels', 2025, '2027/28', 875),
('Wheat', 'Exports', 'Million bushels', 2025, '2028/29', 900),
('Wheat', 'Exports', 'Million bushels', 2025, '2029/30', 900),
('Wheat', 'Exports', 'Million bushels', 2025, '2030/31', 900),
('Wheat', 'Exports', 'Million bushels', 2025, '2031/32', 920),
('Wheat', 'Exports', 'Million bushels', 2025, '2032/33', 930),
('Wheat', 'Exports', 'Million bushels', 2025, '2033/34', 940),
('Wheat', 'Exports', 'Million bushels', 2025, '2034/35', 950);


CREATE TABLE barleyex (
    Commodity VARCHAR(50),
    Attribute VARCHAR(50),
    Unit VARCHAR(50),
    YearOfProjection INT,
    Year VARCHAR(10),
    Value INT
);

INSERT INTO barleyex (Commodity, Attribute, Unit, YearOfProjection, Year, Value) VALUES
('Barley', 'Exports', 'Million bushels', 2025, '2023/24', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2024/25', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2025/26', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2026/27', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2027/28', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2028/29', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2029/30', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2030/31', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2031/32', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2032/33', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2033/34', 5),
('Barley', 'Exports', 'Million bushels', 2025, '2034/35', 5);


CREATE TABLE ricex (
    Commodity VARCHAR(50),
    Attribute VARCHAR(50),
    Unit VARCHAR(50),
    YearOfProjection INT,
    Year VARCHAR(10),
    Value DECIMAL(10, 1)
);

INSERT INTO ricex (Commodity, Attribute, Unit, YearOfProjection, Year, Value) VALUES
('Rice', 'Exports', 'Million owt.', 2025, '2023/24', 98.1),
('Rice', 'Exports', 'Million owt.', 2025, '2024/25', 101.0),
('Rice', 'Exports', 'Million owt.', 2025, '2025/26', 101.0),
('Rice', 'Exports', 'Million owt.', 2025, '2026/27', 102.5),
('Rice', 'Exports', 'Million owt.', 2025, '2027/28', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2028/29', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2029/30', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2030/31', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2031/32', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2032/33', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2033/34', 103.0),
('Rice', 'Exports', 'Million owt.', 2025, '2034/35', 103.0);



CREATE TABLE WheatMark (
    SlNo INT,
    DistrictName VARCHAR(100),
    MarketName VARCHAR(100),
    Commodity VARCHAR(100),
    Variety VARCHAR(100),
    Grade VARCHAR(50),
    MinPrice DECIMAL(10, 2),
    MaxPrice DECIMAL(10, 2),
    ModalPrice DECIMAL(10, 2)
);
ALTER TABLE wheatMark CHANGE COLUMN Sl_no SlNo INT;
DROP TABLE wheatMark;

INSERT INTO WheatMark (SlNo, DistrictName, MarketName, Commodity, Variety, Grade, MinPrice, MaxPrice, ModalPrice) VALUES
(1, 'Auraiya', 'Achalda', 'Wheat', 'Dara', 'FAQ', 2900, 3100, 3000),
(2, 'Agra', 'Achnera', 'Wheat', 'Dara', 'FAQ', 2970, 3080, 3030),
(3, 'Shajapur', 'Agar', 'Wheat', 'Wheat', 'FAQ', 2710, 3191, 3126),
(4, 'Agra', 'Agra', 'Wheat', 'Dara', 'FAQ', 3000, 3100, 3040),
(5, 'Jalaun (Orai)', 'Ait', 'Wheat', 'Dara', 'FAQ', 3000, 3025, 3010),
(6, 'Prayagraj', 'Ajuha', 'Wheat', 'Dara', 'FAQ', 2790, 2850, 2830),
(7, 'Ambedkarnagar', 'Akbarpur', 'Wheat', 'Dara', 'FAQ', 2800, 2850, 2810),
(8, 'Ambedkarnagar', 'Akbarpur', 'Wheat', 'Dara', 'Non-FAQ', 2700, 2780, 2750),
(9, 'Akola', 'Akola', 'Wheat', 'Other', 'FAQ', 2500, 3000, 2760),
(10, 'Bhind', 'Alampur', 'Wheat', 'Mill Quality', 'Non-FAQ', 2885, 2885, 2885),
(11, 'Aligarh', 'Aligarh', 'Wheat', 'Dara', 'FAQ', 2940, 2980, 2960),
(12, 'Amarawati', 'Amarawati', 'Wheat', 'Other', 'FAQ', 2850, 3100, 2975),
(13, 'Satna', 'Amarpatan', 'Wheat', 'Wheat', 'FAQ', 2800, 2805, 2805),
(14, 'Amreli', 'Amreli', 'Wheat', 'Lokwan', 'FAQ', 3130, 3130, 3130),
(15, 'Amreli', 'Amreli', 'Wheat', 'Rajasthan Tukdi', 'FAQ', 2680, 3535, 3220),
(16, 'Maharajganj', 'Anandnagar', 'Wheat', 'Dara', 'FAQ', 2300, 2400, 2350),
(17, 'Badwani', 'Anjad', 'Wheat', 'Wheat', 'FAQ', 2360, 2360, 2360),
(18, 'Baran', 'Anta', 'Wheat', 'Other', 'FAQ', 3008, 3010, 3009),
(19, 'Guna', 'Aron', 'Wheat', 'Wheat', 'FAQ', 3252, 3295, 3295),
(20, 'Ashoknagar', 'Ashoknagar', 'Wheat', 'Wheat', 'FAQ', 2875, 4301, 3600),
(21, 'Sehore', 'Ashta', 'Wheat', 'Wheat', 'FAQ', 2810, 3911, 3112),
(22, 'Banda', 'Atarra', 'Wheat', 'Dara', 'FAQ', 2725, 2890, 2800),
(23, 'Baran', 'Atru', 'Wheat', 'Other', 'FAQ', 3001, 3118, 3059),
(24, 'Auraiya', 'Auraiya', 'Wheat', 'Dara', 'FAQ', 2950, 3000, 2980),
(25, 'Hoshangabad', 'Babai', 'Wheat', 'Mill Quality', 'Non-FAQ', 2870, 2895, 2895),
(26, 'Amreli', 'Babra', 'Wheat', 'Other', 'FAQ', 2600, 3300, 2950),
(27, 'Raebarelli', 'Bachranwa', 'Wheat', 'Dara', 'FAQ', 2775, 2800, 2785),
(28, 'Chhatarpur', 'Badamalhera', 'Wheat', 'Mill Quality', 'FAQ', 2885, 2900, 2900),
(29, 'Shivpuri', 'Badarwas', 'Wheat', 'Wheat', 'Non-FAQ', 2955, 2975, 2975),
(30, 'Badaun', 'Badayoun', 'Wheat', 'Dara', 'FAQ', 2900, 2970, 2930),
(31, 'Ujjain', 'Badnagar', 'Wheat', 'Wheat', 'FAQ', 2900, 3310, 3001),
(32, 'Dhar', 'Badnawar', 'Wheat', 'Wheat', 'FAQ', 2850, 3280, 3125),
(33, 'Shajapur', 'Badod', 'Wheat', 'Wheat', 'Non-FAQ', 2650, 2740, 2740),
(34, 'Khargone', 'Badwaha', 'Wheat', 'Wheat', 'FAQ', 2911, 3074, 3074),
(35, 'Amreli', 'Bagasara', 'Wheat', 'Lokwan Gujrat', 'FAQ', 2750, 3005, 2877),
(36, 'Bahraich', 'Bahraich', 'Wheat', 'Dara', 'FAQ', 2800, 2975, 2900),
(37, 'Bahraich', 'Bahraich', 'Wheat', 'Dara', 'Non-FAQ', 2675, 2800, 2725),
(38, 'Rewa', 'Baikunthpur', 'Wheat', 'Mill Quality', 'Non-FAQ', 2750, 2750, 2750),
(39, 'Rewa', 'Baikunthpur', 'Wheat', 'Wheat', 'Non-FAQ', 2750, 2800, 2770),
(40, 'Ballia', 'Ballia', 'Wheat', 'Dara', 'FAQ', 2910, 2950, 2925),
(41, 'Balrampur', 'Balrampur', 'Wheat', 'Dara', 'FAQ', 2850, 3070, 2960),
(42, 'Hoshangabad', 'Banapura', 'Wheat', 'Local', 'FAQ', 2550, 3219, 3071),
(43, 'Banda', 'Banda', 'Wheat', 'Dara', 'FAQ', 2900, 3000, 2950),
(44, 'Unnao', 'Bangarmau', 'Wheat', 'Dara', 'FAQ', 2800, 2900, 2850),
(45, 'Lucknow', 'Banthara', 'Wheat', 'Dara', 'FAQ', 3002, 3022, 3012),
(46, 'Baran', 'Baran', 'Wheat', 'Other', 'Non-FAQ', 3000, 3330, 3200),
(47, 'Baghpat', 'Baraut', 'Wheat', 'Dara', 'FAQ', 2850, 3000, 2955),
(48, 'Bareilly', 'Bareilly', 'Wheat', 'Dara', 'FAQ', 2675, 2800, 2705),
(49, 'Bareilly', 'Bareilly', 'Wheat', 'Dara', 'Non-FAQ', 2625, 2675, 2650),
(50, 'Chittorgarh', 'Barisadri', 'Wheat', 'Other', 'FAQ', 2632, 3185, 2915),
(51, 'Jaipur Rural', 'Bassi', 'Wheat', 'Other', 'Non-FAQ', 2850, 3090, 2970),
(52, 'Sabarkantha', 'Bayad(Demai)', 'Wheat', 'Other', 'FAQ', 2500, 2540, 2520),
(53, 'Beawar', 'Beawar', 'Wheat', 'Other', 'FAQ', 3100, 3500, 3300),
(54, 'Beed', 'Beed', 'Wheat', 'Other', 'Non-FAQ', 2000, 2200, 2100),
(55, 'Raisen', 'Begamganj', 'Wheat', 'Mill Quality', 'FAQ', 2800, 2815, 2815),
(56, 'Shehdol', 'Beohari', 'Wheat', 'Mill Quality', 'FAQ', 2800, 2800, 2800),
(57, 'Bhopal', 'Berasia', 'Wheat', 'Local', 'FAQ', 2845, 3205, 2940),
(58, 'Bhopal', 'Berasia', 'Wheat', 'Mill Quality', 'FAQ', 2550, 2585, 2565),
(59, 'Buldhana', 'Buldhana', 'Wheat', 'Other', 'FAQ', 2800, 2850, 2825),
(60, 'Bulandshahr', 'Bulandshahr', 'Wheat', 'Dara', 'FAQ', 2900, 2975, 2945),
(61, 'Rewa', 'Bundi', 'Wheat', 'Wheat', 'FAQ', 2900, 2990, 2945),
(62, 'Barabanki', 'Burauli', 'Wheat', 'Dara', 'FAQ', 2800, 2895, 2845),
(63, 'Chhattisgarh', 'Bemetara', 'Wheat', 'Other', 'FAQ', 2675, 3000, 2838),
(64, 'Budaun', 'Budaun', 'Wheat', 'Dara', 'FAQ', 2850, 2900, 2875),
(65, 'Bharatpur', 'Bharatpur', 'Wheat', 'Dara', 'FAQ', 3000, 3100, 3050),
(66, 'Gajraula', 'Gajraula', 'Wheat', 'Dara', 'FAQ', 2750, 2850, 2800),
(67, 'Gwalior', 'Ghatigaon', 'Wheat', 'Wheat', 'FAQ', 2900, 2950, 2925),
(68, 'Madhya Pradesh', 'Ghatiya', 'Wheat', 'Wheat', 'FAQ', 2950, 3010, 2980),
(69, 'Gajraula', 'Gajraula', 'Wheat', 'Mill Quality', 'Non-FAQ', 2560, 2640, 2600),
(70, 'Raipur', 'Gariabandh', 'Wheat', 'Local', 'FAQ', 2700, 2900, 2850),
(71, 'Sikar', 'Gangaur', 'Wheat', 'Other', 'FAQ', 2780, 2890, 2835),
(72, 'Siddharth Nagar', 'Gaushala', 'Wheat', 'Wheat', 'FAQ', 2900, 2960, 2930),
(73, 'Jaipur', 'Ghatmika', 'Wheat', 'Mill Quality', 'FAQ', 2680, 2755, 2720),
(74, 'Hardoi', 'Gola Gokarnnath', 'Wheat', 'Dara', 'Non-FAQ', 2300, 2450, 2375),
(75, 'Ajmer', 'Goverdhan', 'Wheat', 'Other', 'FAQ', 3000, 3150, 3075),
(76, 'Firozabad', 'Firozabad', 'Wheat', 'Other', 'FAQ', 2950, 3000, 2975),
(77, 'Aligarh', 'Gujranwala', 'Wheat', 'Dara', 'FAQ', 2980, 3030, 3005),
(78, 'Jalaun', 'Gursarai', 'Wheat', 'Dara', 'FAQ', 2900, 2990, 2950),
(79, 'Kanpur Dehat', 'Ghatampur', 'Wheat', 'Wheat', 'FAQ', 2800, 2870, 2835),
(80, 'Bhadohi', 'Gyanpur', 'Wheat', 'Dara', 'FAQ', 2775, 2850, 2815),
(81, 'Lucknow', 'Gosainganj', 'Wheat', 'Dara', 'Non-FAQ', 2700, 2760, 2730),
(82, 'Madhubani', 'Hathidah', 'Wheat', 'Other', 'FAQ', 2850, 2950, 2900),
(83, 'Saharanpur', 'Hathras', 'Wheat', 'Wheat', 'FAQ', 2900, 2965, 2933),
(84, 'Jalna', 'Jalna', 'Wheat', 'Local', 'FAQ', 2800, 2850, 2825),
(85, 'Aligarh', 'Jattari', 'Wheat', 'Dara', 'FAQ', 2900, 2985, 2940),
(86, 'Azamgarh', 'Jaunpur', 'Wheat', 'Dara', 'FAQ', 2970, 3075, 3025),
(87, 'Gaya', 'Jhumri', 'Wheat', 'Mill Quality', 'Non-FAQ', 2400, 2500, 2450),
(88, 'Dewas', 'Kailaras', 'Wheat', 'Wheat', 'FAQ', 2890, 2930, 2910),
(89, 'Bikaner', 'Kaisar', 'Wheat', 'Wheat', 'FAQ', 2900, 2950, 2925),
(90, 'Gorakhpur', 'Kakrahi', 'Wheat', 'Other', 'FAQ', 2760, 2830, 2795),
(91, 'Indore', 'Khachrod', 'Wheat', 'Wheat', 'Non-FAQ', 2650, 2700, 2675),
(92, 'Madhubani', 'Khajurahat', 'Wheat', 'Other', 'FAQ', 2950, 3000, 2975),
(93, 'Chhattisgarh', 'Kharsia', 'Wheat', 'Mill Quality', 'FAQ', 2635, 2750, 2690),
(94, 'Jaipur', 'Kishanpole', 'Wheat', 'Wheat', 'Non-FAQ', 2775, 2850, 2810),
(95, 'Hathras', 'Kosi Kalan', 'Wheat', 'Dara', 'FAQ', 2850, 2900, 2875),
(96, 'Hassan', 'Krishnanagar', 'Wheat', 'Mill Quality', 'Non-FAQ', 2550, 2585, 2560),
(97, 'Saharanpur', 'Kandhla', 'Wheat', 'Wheat', 'FAQ', 2750, 2850, 2800),
(98, 'Aurangabad', 'Karma', 'Wheat', 'Wheat', 'FAQ', 2845, 2900, 2872),
(99, 'Dahod', 'Dahod', 'Wheat', '147 Average', 'FAQ', 3250, 3300, 3275),
(100, 'Banda', 'Dabrai', 'Wheat', 'Dara', 'FAQ', 2800, 2850, 2825);


CREATE TABLE BarleyMark (
    SlNo INT,
    DistrictName VARCHAR(100),
    MarketName VARCHAR(100),
    Commodity VARCHAR(100),
    Variety VARCHAR(100),
    Grade VARCHAR(50),
    MinPrice DECIMAL(10, 2),
    MaxPrice DECIMAL(10, 2),
    ModalPrice DECIMAL(10, 2)
);

INSERT INTO BarleyMark (SlNo, DistrictName, MarketName, Commodity, Variety, Grade, MinPrice, MaxPrice, ModalPrice) VALUES
(1, 'Agra', 'Achnera', 'Barley (Jau)', 'Dara', 'FAQ', 2500, 2540, 2520),
(2, 'Aligarh', 'Aligarh', 'Barley (Jau)', 'Dara', 'FAQ', 2480, 2520, 2500),
(3, 'Azamgarh', 'Azamgarh', 'Barley (Jau)', 'Dara', 'FAQ', 2475, 2575, 2525),
(4, 'Ballia', 'Ballia', 'Barley (Jau)', 'Dara', 'FAQ', 2480, 2540, 2510),
(5, 'Chittorgarh', 'Barisadri', 'Barley (Jau)', 'Dara', 'FAQ', 2047, 2392, 2047),
(6, 'Pratapgarh', 'Chhotisadri', 'Barley (Jau)', 'Barley-Organic', 'FAQ', 2315, 2351, 2340),
(7, 'Kanpur', 'Choubepur', 'Barley (Jau)', 'Dara', 'FAQ', 2550, 2640, 2590),
(8, 'Agra', 'Fatehpur Sikri', 'Barley (Jau)', 'Dara', 'FAQ', 2490, 2540, 2515),
(9, 'Firozabad', 'Firozabad', 'Barley (Jau)', 'Dara', 'FAQ', 2535, 2590, 2555),
(10, 'Ghazipur', 'Gazipur', 'Barley (Jau)', 'Dara', 'FAQ', 2480, 2550, 2510),
(11, 'Gorakhpur', 'Gorakhpur', 'Barley (Jau)', 'Dara', 'FAQ', 2515, 2615, 2565),
(12, 'Kanpur', 'Kanpur(Grain)', 'Barley (Jau)', 'Dara', 'FAQ', 2500, 2600, 2550),
(13, 'Katni', 'Katni', 'Barley (Jau)', 'Barley', 'FAQ', 2460, 2499, 2499),
(14, 'Tikamgarh', 'Khargapur', 'Barley (Jau)', 'Barley', 'Non-FAQ', 2300, 2450, 2450),
(15, 'Lalitpur', 'Lalitpur', 'Barley (Jau)', 'Dara', 'FAQ', 2400, 2500, 2450),
(16, 'Mahoba', 'Mahoba', 'Barley (Jau)', 'Dara', 'FAQ', 2350, 2450, 2410),
(17, 'Mathura', 'Mathura', 'Barley (Jau)', 'Dara', 'FAQ', 2500, 2580, 2540),
(18, 'Lalitpur', 'Mehrauni', 'Barley (Jau)', 'Dara', 'Non-FAQ', 2000, 2200, 2200),
(19, 'Muzaffarnagar', 'Muzzafarnagar', 'Barley (Jau)', 'Dara', 'FAQ', 2500, 2650, 2550),
(20, 'Pratapgarh', 'Pratapgarh', 'Barley (Jau)', 'Barley-Organic', 'FAQ', 2400, 2420, 2410),
(21, 'Raebarelli', 'Raibareilly', 'Barley (Jau)', 'Dara', 'FAQ', 2530, 2550, 2535),
(22, 'Sonbhadra', 'Robertsganj', 'Barley (Jau)', 'Dara', 'FAQ', 2330, 2515, 2450),
(23, 'Saharanpur', 'Saharanpur', 'Barley (Jau)', 'Dara', 'FAQ', 2370, 2650, 2530),
(24, 'Shamli', 'Shamli', 'Barley (Jau)', 'Dara', 'FAQ', 2550, 2620, 2580),
(25, 'Firozabad', 'Tundla', 'Barley (Jau)', 'Dara', 'FAQ', 2390, 2425, 2410),
(26, 'Udaipur', 'Udaipur (Grain)', 'Barley (Jau)', 'Local', 'FAQ', 1800, 2150, 2050),
(27, 'Udaipur', 'Udaipur (Grain)', 'Barley (Jau)', 'Local', 'Non-FAQ', 1700, 1950, 1800),
(28, 'Kanpur', 'Uttaripura', 'Barley (Jau)', 'Dara', 'FAQ', 2520, 2620, 2570),
(29, 'Varanasi', 'Varanasi', 'Barley (Jau)', 'Dara', 'FAQ', 2470, 2565, 2510);



CREATE TABLE RiceMark (
    SlNo INT PRIMARY KEY,
    DistrictName VARCHAR(100),
    MarketName VARCHAR(100),
    Commodity VARCHAR(50),
    Variety VARCHAR(50),
    Grade VARCHAR(50),
    MinPrice INT,
    MaxPrice INT,
    ModalPrice INT
);

INSERT INTO RiceMark (SlNo, DistrictName, MarketName, Commodity, Variety, Grade, MinPrice, MaxPrice, ModalPrice) VALUES
(1, 'Auraiya', 'Achalda', 'Rice', 'III', 'FAQ', 3000, 3150, 3030),
(2, 'Agra', 'Achnera', 'Rice', 'III', 'FAQ', 3320, 3360, 3340),
(3, 'Agra', 'Agra', 'Rice', 'III', 'FAQ', 3320, 3480, 3385),
(4, 'Prayagraj', 'Ajuha', 'Rice', 'Common', 'FAQ', 3080, 3150, 3120),
(5, 'Ambedkarnagar', 'Akbarpur', 'Rice', 'Common', 'FAQ', 3200, 3250, 3210),
(6, 'Raigad', 'Alibagh', 'Rice', 'Other', 'Local', 3000, 3500, 3250),
(7, 'Aligarh', 'Aligarh', 'Rice', 'III', 'FAQ', 3200, 3280, 3240),
(8, 'Prayagraj', 'Allahabad', 'Rice', 'Common', 'FAQ', 3100, 3200, 3130),
(9, 'Maharajganj', 'Anandnagar', 'Rice', 'III', 'FAQ', 2600, 3000, 2800),
(10, 'Auraiya', 'Auraiya', 'Rice', 'Common', 'FAQ', 2880, 3100, 3010),
(11, 'Azamgarh', 'Azamgarh', 'Rice', 'III', 'FAQ', 3200, 3300, 3250),
(12, 'Raebarelli', 'Bachranwa', 'Rice', 'Common', 'FAQ', 3150, 3175, 3165),
(13, 'Badaun', 'Badayoun', 'Rice', 'III', 'FAQ', 3270, 3350, 3300),
(14, 'Bahraich', 'Bahraich', 'Rice', 'Common', 'FAQ', 3050, 3400, 3190),
(15, 'Puruliya', 'Balarampur', 'Rice', 'Other', 'FAQ', 3950, 4200, 4100),
(16, 'Ballia', 'Ballia', 'Rice', 'III', 'FAQ', 3210, 3250, 3235),
(17, 'Balrampur', 'Balrampur', 'Rice', 'III', 'FAQ', 3050, 3280, 3160),
(18, 'Banda', 'Banda', 'Rice', 'III', 'FAQ', 3220, 3375, 3300),
(19, 'Unnao', 'Bangarmau', 'Rice', 'III', 'FAQ', 3120, 3220, 3170),
(20, 'Bankura', 'Bankura Sadar', 'Rice', 'Common', 'FAQ', 3550, 3700, 3600),
(21, 'Lucknow', 'Banthara', 'Rice', 'Coarse', 'FAQ', 2800, 2820, 2810),
(22, 'Baghpat', 'Baraut', 'Rice', 'III', 'FAQ', 3150, 3400, 3250),
(23, 'Bareilly', 'Bareilly', 'Rice', 'Common', 'FAQ', 3225, 3300, 3260),
(24, 'South District', 'Barpathari', 'Rice', 'Masuri', 'FAQ', 4100, 4300, 4200),
(25, 'South 24 Parganas', 'Baruipur(Canning)', 'Rice', 'Common', 'FAQ', 3500, 3700, 3600),
(26, 'South 24 Parganas', 'Baruipur(Canning)', 'Rice', 'Super Fine', 'FAQ', 4900, 5100, 5000),
(27, 'UdhamSinghNagar', 'Bazpur', 'Rice', 'Common', 'FAQ', 3565, 3565, 3565),
(28, 'Murshidabad', 'Beldanga', 'Rice', 'Other', 'FAQ', 3600, 3700, 3650),
(29, 'Nadia', 'Bethuadahari', 'Rice', 'Fine', 'FAQ', 5000, 5250, 5100),
(30, 'Etawah', 'Bharthna', 'Rice', 'Common', 'FAQ', 2950, 3150, 3050),
(31, 'Hamirpur', 'Bharuasumerpur', 'Rice', 'III', 'FAQ', 3125, 3350, 3325),
(32, 'Bijnor', 'Bijnaur', 'Rice', 'Common', 'FAQ', 3230, 3375, 3255),
(33, 'Fatehpur', 'Bindki', 'Rice', 'Fine', 'FAQ', 3000, 3200, 3100),
(34, 'Birbhum', 'Birbhum', 'Rice', 'Common', 'FAQ', 3450, 3550, 3500),
(35, 'Bishnupur', 'Bishenpur', 'Rice', 'Other', 'FAQ', 5200, 5200, 5200),
(36, 'Bankura', 'Bishnupur(Bankura)', 'Rice', 'Common', 'FAQ', 3500, 3600, 3550),
(37, 'Bankura', 'Bishnupur(Bankura)', 'Rice', 'Fine', 'FAQ', 4300, 4500, 4350),
(38, 'Birbhum', 'Bolpur', 'Rice', 'Common', 'FAQ', 3450, 3550, 3500),
(39, 'Bulandshahar', 'Buland Shahr', 'Rice', 'III', 'FAQ', 3100, 3350, 3240),
(40, 'Purba Bardhaman', 'Burdwan', 'Rice', 'Common', 'FAQ', 3200, 3400, 3300),
(41, 'Purba Bardhaman', 'Burdwan', 'Rice', 'Fine', 'FAQ', 3500, 3700, 3600),
(42, 'Hooghly', 'Champadanga', 'Rice', 'Fine', 'FAQ', 5250, 5450, 5350),
(43, 'Chandauli', 'Chandoli', 'Rice', 'III', 'FAQ', 3225, 3300, 3250),
(44, 'Kannuj', 'Chhibramau', 'Rice', 'III', 'FAQ', 2980, 3100, 3040),
(45, 'Ballia', 'Chitwadagaon', 'Rice', 'III', 'FAQ', 3180, 3270, 3230),
(46, 'Kanpur', 'Choubepur', 'Rice', 'III', 'FAQ', 3000, 3150, 3100),
(47, 'Dahod', 'Dahod', 'Rice', 'Coarse', 'FAQ', 5000, 6000, 5500),
(48, 'Gautam Budh Nagar', 'Dankaur', 'Rice', 'Common', 'FAQ', 3100, 3355, 3200),
(49, 'North Tripura', 'Dasda', 'Rice', 'Masuri', 'FAQ', 3400, 3500, 3450),
(50, 'Davangere', 'Davangere', 'Rice', 'Medium', 'FAQ', 3000, 4200, 3320),
(51, 'Deoria', 'Devariya', 'Rice', 'III', 'FAQ', 3215, 3240, 3230),
(52, 'Mau(Maunathbhanjan)', 'Doharighat', 'Rice', '1009 Kar', 'FAQ', 3600, 3700, 3655);

-- You can continue inserting more records as needed.
