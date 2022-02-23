SET time_zone = "+05:30";

-- @BLOCK
-- Table structure for table `table_vehicle`
CREATE TABLE `table_vehicle` (
  `vehicleId` int PRIMARY KEY AUTO_INCREMENT,
  `vehicleName` varchar(20) NOT NULL,
  `vehicleDistrict` varchar(20) NOT NULL,
  `vehicleImagePri` varchar(40) NOT NULL,
  `vehicleImage1` varchar(40) DEFAULT NULL,
  `vehicleImage2` varchar(40) DEFAULT NULL,
  `vehicleImage3` varchar(40) DEFAULT NULL,
  `vehicleDescription` text NOT NULL,
  `vehicleSeats` int(3) NOT NULL,
  `vehicleBooked` tinyint(1) NOT NULL DEFAULT 0,
  `vehicleRating` decimal(2,1) DEFAULT 0.0,
  `vehiclePrice` decimal(10,2) NOT NULL
);

-- @BLOCK
-- Table structure for table `table_vehiclebooked`
CREATE TABLE `table_vehiclebooked` (
  `vehicleBookedId` int PRIMARY KEY AUTO_INCREMENT,
  `vehicleId` int NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `finished` tinyint(1) DEFAULT 0,
  `vehiclePrice` decimal(10,2) NOT NULL,
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId)
);

-- @BLOCK
-- Table structure for table `table_vehicleReview`
CREATE TABLE `table_vehiclereview`(
  `vehicleBookedId` int PRIMARY KEY,
  `rate` decimal(2,1) NOT NULL,
  `message` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  FOREIGN KEY (vehicleBookedId) REFERENCES table_vehiclebooked(vehicleBookedId)
);

-- @BLOCK
--selcting statment 
SELECT * FROM `table_vehicle`

-- @BLOCK
--insert into the vehicle
INSERT INTO table_vehicle(`vehicleName`, `vehicleDistrict`, `vehicleImagePri`, `vehicleImage1`, `vehicleImage2`, `vehicleImage3`, `vehicleDescription`, `vehicleSeats`, `vehiclePrice`) VALUES ('Toyota Fortuner','Anuradhapura','car2.jpg','car2-1.jpg','car2-2.jpg','car2-3.jpg',"`Most of the users choice is us. It's because we gave them great deal and excellend service. Let's take this ride with us and you will never regret this.", 5 ,'25000.00');
-- @BLOCK
SELECT * FROM table_vehicle
