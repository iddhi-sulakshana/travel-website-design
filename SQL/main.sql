CREATE DATABASE `travelDB`;
USE `travelDB`;
SET time_zone = "+05:30";

-- @BLOCK
-- Table structure for table `table_hotel`
CREATE TABLE `table_hotel` (
  `hotelId` int UNSIGNED AUTO_INCREMENT,
  `hotelName` varchar(20) NOT NULL,
  `hotelDistrict` varchar(20) NOT NULL,
  `hotelAddress` varchar(40) NOT NULL,
  `hotelPhoneNo` int(10) NOT NULL,
  `hotelImagePri` varchar(40) NOT NULL,
  `hotelImage1` varchar(40) DEFAULT NULL,
  `hotelImage2` varchar(40) DEFAULT NULL,
  `hotelImage3` varchar(40) DEFAULT NULL,
  `hotelDescription` text NOT NULL,
  `hotelFacilities` varchar(20) NOT NULL,
  `hotelrooms` int(2) NOT NULL,
  `hotelRating` decimal(2,1) DEFAULT 0.0,
  PRIMARY KEY (hotelId)
);

-- @BLOCK
-- Table structure for table `table_hotelRoom`
CREATE TABLE `table_hotelRoom`(
  `hotelId` int UNSIGNED,
  `roomId` int UNSIGNED AUTO_INCREMENT,
  `roomBooked` tinyint(1) NOT NULL DEFAULT 0,
  `roomFacilities` varchar(20) NOT NULL,
  `roomBeds` int(2) NOT NULL,
  `roomPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (roomId, hotelId),
  FOREIGN KEY (hotelId) REFERENCES table_hotel(hotelId)
);

-- @BLOCK
-- Table structure for table `table_roomBooked`
CREATE TABLE `table_roomBooked` (
  `roomBookedId` int UNSIGNED AUTO_INCREMENT,
  `roomId` int UNSIGNED NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `finished` tinyint(1) DEFAULT 0,
  `roomPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (roomBookedId),
  FOREIGN KEY (roomId) REFERENCES table_hotelRoom(roomId)
);

-- @BLOCK
-- Table structure for table `table_hotelReview`
CREATE TABLE `table_hotelReview`(
  `roomBookedId` int UNSIGNED,
  `rate` decimal(2,1) NOT NULL,
  `message` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (roomBookedId),
  FOREIGN KEY (roomBookedId) REFERENCES table_roomBooked(roomBookedId)
);

-- @BLOCK
-- Table structure for table `table_restaurant`
CREATE TABLE `table_restaurant` (
  `restaurantId` int UNSIGNED AUTO_INCREMENT,
  `restaurantName` varchar(20) NOT NULL,
  `restaurantDistrict` varchar(20) NOT NULL,
  `restaurantAddress` varchar(40) NOT NULL,
  `restaurantPhoneNo` int(10) NOT NULL,
  `restaurantImagePri` varchar(40) NOT NULL,
  `restaurantDescription` text NOT NULL,
  `restaurantFacilities` varchar(20) NOT NULL,
  `restaurantMenu` varchar(40) NOT NULL,
  `restaurantReservation` tinyint(1) NOT NULL,
  `restaurantTable` int(2),
  `restaurantRating` decimal(2,1) DEFAULT 0.0,
  PRIMARY KEY (restaurantId)
);

-- @BLOCK
-- Table structure for table `table_restaurantTable`
CREATE TABLE `table_restaurantTable`(
  `restaurantId` int UNSIGNED,
  `tableId` int UNSIGNED AUTO_INCREMENT,
  `tableImagePri` varchar(40) NOT NULL,
  `tableReserved` tinyint(1) NOT NULL DEFAULT 0,
  `tableSeats` int(2) NOT NULL,
  `tablePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (tableId, restaurantId),
  FOREIGN KEY (restaurantId) REFERENCES table_restaurant(restaurantId)
);

-- @BLOCK
-- Table structure for table `table_tableReserved`
CREATE TABLE `table_tableReserved` (
  `tableReservedId` int UNSIGNED AUTO_INCREMENT,
  `restaurantId` int UNSIGNED NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `finished` tinyint(1) DEFAULT 0,
  `tablePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (tableReservedId),
  FOREIGN KEY (restaurantId) REFERENCES table_restaurantTable(restaurantId)
);

-- @BLOCK
-- Table structure for table `table_restaurantReview`
CREATE TABLE `table_restaurantReview`(
  `tableReservedId` int UNSIGNED,
  `rate` decimal(2,1) NOT NULL,
  `message` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (tableReservedId),
  FOREIGN KEY (tableReservedId) REFERENCES table_tableReserved(tableReservedId)
);

-- @BLOCK
-- Table structure for table `table_vehicle`
CREATE TABLE `table_vehicle` (
  `vehicleId` int UNSIGNED AUTO_INCREMENT,
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
  `vehiclePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (vehicleId)
);

-- @BLOCK
-- Table structure for table `table_vehicleBooked`
CREATE TABLE `table_vehicleBooked` (
  `vehicleBookedId` int UNSIGNED AUTO_INCREMENT,
  `vehicleId` int UNSIGNED NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `finished` tinyint(1) DEFAULT 0,
  `vehiclePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (vehicleBookedId),
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId)
);

-- @BLOCK
-- Table structure for table `table_vehicleReview`
CREATE TABLE `table_vehicleReview`(
  `vehicleBookedId` int UNSIGNED,
  `rate` decimal(2,1) NOT NULL,
  `message` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (vehicleBookedId),
  FOREIGN KEY (vehicleBookedId) REFERENCES table_vehiclebooked(vehicleBookedId)
);

-- @BLOCK
-- Talbe structrue for table `table_package`
CREATE TABLE `table_package`(
  `packageId` int UNSIGNED AUTO_INCREMENT,
  `packageTitle` varchar(20) NOT NULL,
  `packageDestination` varchar(20) NOT NULL,
  `roomId` int UNSIGNED,
  `tableId` int UNSIGNED,
  `vehicleId` int UNSIGNED,
  `packagePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (packageId),
  FOREIGN KEY (roomId) REFERENCES table_hotelRoom(roomId),
  FOREIGN KEY (tableId) REFERENCES table_restaurantTable(tableId),
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId)
);

-- @BLOCK
-- Table structure for table `table_user`
CREATE TABLE `table_user`(
  `userId` int UNSIGNED AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL UNIQUE,
  `email` varchar(40) UNIQUE,
  `phoneNo` int(10) UNIQUE,
  `password` varchar(20),
  PRIMARY KEY (userId)
);

-- @BLOCK
-- Table structure for `table_userDetails`
CREATE TABLE `table_userDetails`(
  `userId` int UNSIGNED,
  `firstName` varchar(20),
  `lastName` varchar(20),
  `userImg` varchar(40),
  PRIMARY KEY (userId),
  FOREIGN KEY (userId) REFERENCES table_user(userId)
);

-- @BLOCK
-- Table structure for `table_userOrder`
CREATE TABLE `table_userOrder`(
  `userOrderId` int UNSIGNED AUTO_INCREMENT,
  `userId` int UNSIGNED NOT NULL,
  `roomBookedId` int UNSIGNED,
  `tableReservedId` int UNSIGNED,
  `vehicleBookedId` int UNSIGNED,
  `packageId` int UNSIGNED,
  PRIMARY KEY (userOrderId),
  FOREIGN KEY (userId) REFERENCES table_userDetails(userId),
  FOREIGN KEY (roomBookedId) REFERENCES table_roomBooked(roomBookedId),
  FOREIGN KEY (tableReservedId) REFERENCES table_tableReserved(tableReservedId),
  FOREIGN KEY (vehicleBookedId) REFERENCES table_vehicleBooked(vehicleBookedId),
  FOREIGN KEY (packageId) REFERENCES table_package(packageId)
);

-- @BLOCK
-- insert into the vehicle
INSERT INTO table_vehicle(`vehicleName`, `vehicleDistrict`, `vehicleImagePri`, `vehicleImage1`, `vehicleImage2`, `vehicleImage3`, `vehicleDescription`, `vehicleSeats`, `vehiclePrice`) 
VALUES ('Maserati Sedan','Colombo','car1.jpg','car1-1.jpg','car1-2.jpg',NULL,"`Most of the users choice is us. It's because we gave them great deal and excellend service. Let's take this ride with us and you will never regret this.", 5 ,'25000.00'),
VALUES ('Toyota Fortuner','Anuradhapura','car2.jpg','car2-1.jpg','car2-2.jpg','car2-3.jpg',"`Most of the users choice is us. It's because we gave them great deal and excellend service. Let's take this ride with us and you will never regret this.", 5 ,'15000.00'),
VALUES ('Toyota Fortuner','Anuradhapura','car2.jpg','car2-1.jpg','car2-2.jpg','car2-3.jpg',"`Most of the users choice is us. It's because we gave them great deal and excellend service. Let's take this ride with us and you will never regret this.", 5 ,'30000.00'),


