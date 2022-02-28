CREATE DATABASE `travelDB`;
USE `travelDB`;
SET time_zone = "+05:30";

-- @BLOCK
-- Table structure for table `table_hotel`
CREATE TABLE table_hotel (
  hotelId INT UNSIGNED AUTO_INCREMENT,
  hotelName VARCHAR(40) NOT NULL,
  hotelDistrict VARCHAR(40) NOT NULL,
  hotelAddress VARCHAR(40) NOT NULL,
  hotelPhoneNo INT(10) NOT NULL,
  hotelImagePri VARCHAR(40) NOT NULL,
  hotelImageSlide TEXT DEFAULT NULL,
  hotelDescription TEXT NOT NULL,
  hotelFacilities TEXT NOT NULL,
  roomTypes TEXT NOT NULL,
  roomFacilities TEXT NOT NULL,
  hotelRooms INT(2) NOT NULL,
  hotelRating DECIMAL(2,1) DEFAULT 0.0,
  PRIMARY KEY (hotelId)
);

-- @BLOCK
-- Table structure for table table_hotelRoom
CREATE TABLE table_hotelRoom(
  hotelId INT UNSIGNED,
  roomId INT UNSIGNED AUTO_INCREMENT,
  roomBooked TINYINT(1) NOT NULL DEFAULT 0,
  roomBeds INT(2) NOT NULL,
  roomPrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (roomId, hotelId),
  FOREIGN KEY (hotelId) REFERENCES table_hotel(hotelId)
);

-- @BLOCK
-- Table structure for table table_roomBooked
CREATE TABLE table_roomBooked (
  roomBookedId INT UNSIGNED AUTO_INCREMENT,
  roomId INT UNSIGNED NOT NULL,
  checkIn DATE NOT NULL,
  checkOut DATE NOT NULL,
  finished TINYINT(1) DEFAULT 0,
  roomPrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (roomBookedId),
  FOREIGN KEY (roomId) REFERENCES table_hotelRoom(roomId)
);

-- @BLOCK
-- Table structure for table table_hotelReview
CREATE TABLE table_hotelReview(
  roomBookedId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (roomBookedId),
  FOREIGN KEY (roomBookedId) REFERENCES table_roomBooked(roomBookedId)
);

-- @BLOCK
-- Table structure for table table_restaurant
CREATE TABLE table_restaurant (
  restaurantId INT UNSIGNED AUTO_INCREMENT,
  restaurantName VARCHAR(40) NOT NULL,
  restaurantDistrict VARCHAR(40) NOT NULL,
  restaurantAddress VARCHAR(40) NOT NULL,
  restaurantPhoneNo INT(10) NOT NULL,
  restaurantImagePri VARCHAR(40) NOT NULL,
  restaurantImage1 VARCHAR(40),
  restaurantImage2 VARCHAR(40),
  restaurantImage3 VARCHAR(40),
  restaurantDescription TEXT NOT NULL,
  restaurantFacilities VARCHAR(40) NOT NULL,
  restaurantMenu VARCHAR(40) NOT NULL,
  restaurantReservation TINYINT(1) NOT NULL,
  restaurantTable INT(2),
  restaurantRating DECIMAL(2,1) DEFAULT 0.0,
  PRIMARY KEY (restaurantId)
);

-- @BLOCK
-- Table structure for table table_restaurantTable
CREATE TABLE table_restaurantTable(
  restaurantId INT UNSIGNED,
  tableId INT UNSIGNED AUTO_INCREMENT,
  tableReserved TINYINT(1) NOT NULL DEFAULT 0,
  tableSeats INT(2) NOT NULL,
  tablePrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (tableId, restaurantId),
  FOREIGN KEY (restaurantId) REFERENCES table_restaurant(restaurantId)
);

-- @BLOCK
-- Table structure for table table_tableReserved
CREATE TABLE table_tableReserved (
  tableReservedId INT UNSIGNED AUTO_INCREMENT,
  restaurantId INT UNSIGNED NOT NULL,
  checkIn DATE NOT NULL,
  checkOut DATE NOT NULL,
  finished TINYINT(1) DEFAULT 0,
  tablePrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (tableReservedId),
  FOREIGN KEY (restaurantId) REFERENCES table_restaurantTable(restaurantId)
);

-- @BLOCK
-- Table structure for table table_restaurantReview
CREATE TABLE table_restaurantReview(
  tableReservedId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (tableReservedId),
  FOREIGN KEY (tableReservedId) REFERENCES table_tableReserved(tableReservedId)
);

-- @BLOCK
-- Table structure for table table_vehicle
CREATE TABLE table_vehicle (
  vehicleId INT UNSIGNED AUTO_INCREMENT,
  vehicleName VARCHAR(40) NOT NULL,
  vehicleType VARCHAR(10) NOT NULL,
  vehicleDistrict VARCHAR(40) NOT NULL,
  vehicleImagePri VARCHAR(40) NOT NULL,
  vehicleImage1 VARCHAR(40) DEFAULT NULL,
  vehicleImage2 VARCHAR(40) DEFAULT NULL,
  vehicleImage3 VARCHAR(40) DEFAULT NULL,
  vehicleDescription TEXT NOT NULL,
  vehicleSeats INT(3) NOT NULL,
  vehicleBooked TINYINT(1) NOT NULL DEFAULT 0,
  vehicleRating DECIMAL(2,1) DEFAULT 0.0,
  vehiclePrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (vehicleId)
);

-- @BLOCK
-- Table structure for table table_vehicleBooked
CREATE TABLE table_vehicleBooked (
  vehicleBookedId INT UNSIGNED AUTO_INCREMENT,
  vehicleId INT UNSIGNED NOT NULL,
  checkIn DATE NOT NULL,
  checkOut DATE NOT NULL,
  finished TINYINT(1) DEFAULT 0,
  vehiclePrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (vehicleBookedId),
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId)
);

-- @BLOCK
-- Table structure for table table_vehicleReview
CREATE TABLE table_vehicleReview(
  vehicleBookedId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (vehicleBookedId),
  FOREIGN KEY (vehicleBookedId) REFERENCES table_vehiclebooked(vehicleBookedId)
);

-- @BLOCK
-- Talbe structrue for table table_package
CREATE TABLE table_package(
  packageId INT UNSIGNED AUTO_INCREMENT,
  packageTitle VARCHAR(40) NOT NULL,
  packageDestination VARCHAR(40) NOT NULL,
  roomId INT UNSIGNED,
  tableId INT UNSIGNED,
  vehicleId INT UNSIGNED,
  packagePrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (packageId),
  FOREIGN KEY (roomId) REFERENCES table_hotelRoom(roomId),
  FOREIGN KEY (tableId) REFERENCES table_restaurantTable(tableId),
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId)
);

-- @BLOCK
-- Table structure for table table_user
CREATE TABLE table_user(
  userId INT UNSIGNED AUTO_INCREMENT,
  userName VARCHAR(40) NOT NULL UNIQUE,
  email VARCHAR(40) UNIQUE,
  phoneNo INT(10) UNIQUE,
  pwd VARCHAR(40),
  firstName VARCHAR(40),
  lastName VARCHAR(40),
  userImg VARCHAR(40) NOT NULL DEFAULT 'user.png',
  PRIMARY KEY (userId)
);

-- @BLOCK
-- Table structure for table_userOrder
CREATE TABLE table_userOrder(
  userOrderId INT UNSIGNED AUTO_INCREMENT,
  userId INT UNSIGNED NOT NULL,
  roomBookedId INT UNSIGNED,
  tableReservedId INT UNSIGNED,
  vehicleBookedId INT UNSIGNED,
  packageId INT UNSIGNED,
  PRIMARY KEY (userOrderId),
  FOREIGN KEY (userId) REFERENCES table_user(userId)
  FOREIGN KEY (roomBookedId) REFERENCES table_roomBooked(roomBookedId),
  FOREIGN KEY (tableReservedId) REFERENCES table_tableReserved(tableReservedId),
  FOREIGN KEY (vehicleBookedId) REFERENCES table_vehicleBooked(vehicleBookedId),
  FOREIGN KEY (packageId) REFERENCES table_package(packageId)
);

-- @BLOCK
-- Table Structure for table_attraction
CREATE TABLE table_attraction(
  attractionId INT UNSIGNED AUTO_INCREMENT,
  attractionTitle VARCHAR(40) NOT NULL,
  attractionImageHome VARCHAR(40) NOT NULL,
  attractionImagePri VARCHAR(40) NOT NULL,
  attractionDescription TEXT NOT NULL,
  attractionLocationLink TEXT NOT NULL,
  PRIMARY KEY (attractionId)
);


-- @BLOCK
-- insert into the vehicle
INSERT INTO table_vehicle(`vehicleName`, `vehicleType`, `vehicleDistrict`, `vehicleImagePri`, `vehicleImage1`, `vehicleImage2`, `vehicleImage3`, `vehicleDescription`, `vehicleSeats`, `vehiclePrice`) 
VALUES ('Maserati Sedan','Car','Colombo','car1.jpg','car1-1.jpg','car1-2.jpg',NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>5 Passengers</li><li>1 Large Bag 👜</li><li>1 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent car 🚗 Sri Lanka.</p>", 5 ,'35000.00'),
('Mercedes E-Class GPS',,'Car''Kurunegala','car2.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>5 Passengers</li><li>1 Large Bag 👜</li><li>2 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent premium car 🚕 Sri Lanka.</p>", 5 ,'30000.00'),
('Mitsubishi Mirage','Car','Gampaha','car3.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>4 Passengers</li><li>2 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent lowest price cars 🚕 Sri Lanka.</p>", 4 ,'15000.00'),
('Toyota Corolla','Car','Kurunegala','car4.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>5 Passengers</li><li>1 Large Bag 👜</li><li>2 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent premium car 🚕 Sri Lanka.</p>", 5 ,'25000.00'),
('Toyota Hiace KDH','Van','Colombo','van1.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>9 Passengers</li><li>4 Large Bag 👜</li><li>4 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent premium Van 🚐 Sri Lanka.</p>", 9 ,'40000.00'),
('Luxury Bus','Bus','Kurunegala','bus1.png','bus1-2.png','bus1-3.png',NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>30 - 49 Passengers</li><li>20 Large Bag 👜</li><li>20 Small Bag 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent Luxury Bus 🚌 Sri Lanka.</p>", 49 ,'90000.00');

-- @BLOCK
-- insert into the user
INSERT INTO table_user(`userName`, `email`, `phoneNo`, `password`, `firstName`, `lastName`)
VALUES 
('rami123', 'rami123@hotmail.com', '0112525252', '1234', 'Rami', 'Conrad'),
('parker123', NULL, '0252525252', '1234', 'Parker', 'Benitez'),
('osian123', 'osian123@hotmail.com', NULL, '1234', 'Osian', 'Sharples'),
('almond123', NULL, '0552525252', '1234', 'Brandy', 'Almond'),
('noah123', 'noah123@hotmail.com', NULL, '1234', 'Noah', 'Salgado'),
('shiv123', 'shiv123@gmail.com', '0111111111', '1234', 'Shiv', 'Harrison');

-- @BLOCK
-- insert into the restaurant
INSERT INTO table_restaurant(`restaurantName`, `restaurantDistrict`, `restaurantAddress`, `restaurantPhoneNo`, `restaurantImagePri`, `restaurantImage1`, `restaurantImage2`, `restaurantImage3`, `restaurantDescription`, `restaurantFacilities`, `restaurantMenu`, `restaurantReservation`, `restaurantTable`, `restaurantRating`)
VALUES
('restaurantName','restaurantDistrict','restaurantAddress','restaurantPhoneNo','restaurantImagePri','restaurantImage1','restaurantImage2','restaurantImage3','restaurantDescription','restaurantFacilities','restaurantMenu','restaurantReservation','restaurantTable','restaurantRating'),
('restaurantName','restaurantDistrict','restaurantAddress','restaurantPhoneNo','restaurantImagePri','restaurantImage1','restaurantImage2','restaurantImage3','restaurantDescription','restaurantFacilities','restaurantMenu','restaurantReservation','restaurantTable','restaurantRating'),
('restaurantName','restaurantDistrict','restaurantAddress','restaurantPhoneNo','restaurantImagePri','restaurantImage1','restaurantImage2','restaurantImage3','restaurantDescription','restaurantFacilities','restaurantMenu','restaurantReservation','restaurantTable','restaurantRating'),
('restaurantName','restaurantDistrict','restaurantAddress','restaurantPhoneNo','restaurantImagePri','restaurantImage1','restaurantImage2','restaurantImage3','restaurantDescription','restaurantFacilities','restaurantMenu','restaurantReservation','restaurantTable','restaurantRating'),

-- @BLOCK
-- insert into the hotel
INSERT INTO table_hotel(`hotelName`, `hotelDistrict`, `hotelAddress`, `hotelPhoneNo`, `hotelImagePri`, `hotelImageSlide`, `hotelDescription`, `hotelFacilities`, `roomTypes`, `roomFacilities`, `hotelrooms`)
VALUES 
('Weligama Bay Marriott Resort & Spa','Matara','700 Matara Road Pelana, Matara 81700 Sri Lanka','0446310595','hotelImagePri','hotelImageSlide','Located on a beautiful beach front in Weligama, Sri Lanka, Weligama Bay Marriott Resort & Spa is a luxurious 5-star resort with direct beach access, 3 outdoor swimming pools and a premier spa. All rooms and suites come with stunning sea views, spacious balconies and luxurious amenities, along with high speed internet access across the hotel and a fun-filled and action packed Kids Club.','<p class="facility" style="color: darkblue;"><i class="fa fa-wifi" style="color: blue;"></i> Free Wifi </style></p><p class="facility" style="color: darkblue;"><i class="fas fa-parking" style="color: blue;" style="color: darkblue;"></i> Free Parking</p><p class="facility" style="color: darkblue;"><i class="fas fa-swimmer" style="color: blue;"></i> Swimming Pool</p><p class="facility" style="color: darkblue;"><i class="fas fa-dumbbell" style="color: blue;"></i> Fitness Center</p><p class="facility" style="color: darkblue;"><i class="fas fa-sun" style="color: blue;"></i> Beach</p>','<p class="facility" style="color: darkblue;"><i class="fas fa-eye" style="color: blue;"></i> Ocean View</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Family Suits</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Delux Rooms</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Bridal Suits</p>','<p class="facility" style="color: darkblue;"><i class="far fa-snowflake" style="color: blue;"></i> Air Conditioning</p><p class="facility" style="color: darkblue;"><i class="fas fa-wine-bottle" style="color: blue;"></i> Minibar</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Private Balcony</p><p class="facility" style="color: darkblue;"><i class="fa fa-bell" style="color: blue;"></i> Room Service</p>',10),
('Amaya Beach Pasikudah','Batticaloa','Pasikudah Rd, Kalkudah 10120 Sri Lanka','0652050200','hotelImagePri','hotelImageSlide','Amaya Beach Passikudah Resort & Spa Sri Lanka is set next to the beach at Passikudah Bay, a long stretch of coastline renowned for its calm and shallow waters, ideal for swimming and water sports. Besides relaxing on the tranquil beach you will enjoy a wide range of facilities and activities including a large swimming pool, water sports and an award-winning spa.','<p class="facility" style="color: darkblue;"><i class="fa fa-wifi" style="color: blue;"></i> Free Wifi </style></p><p class="facility" style="color: darkblue;"><i class="fas fa-parking" style="color: blue;" style="color: darkblue;"></i> Free Parking</p><p class="facility" style="color: darkblue;"><i class="fas fa-swimmer" style="color: blue;"></i> Swimming Pool</p><p class="facility" style="color: darkblue;"><i class="fas fa-dumbbell" style="color: blue;"></i> Fitness Center</p><p class="facility" style="color: darkblue;"><i class="fas fa-sun" style="color: blue;"></i> Beach</p>','<p class="facility" style="color: darkblue;"><i class="fas fa-eye" style="color: blue;"></i> Ocean View</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Family Suits</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Delux Rooms</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Bridal Suits</p>','<p class="facility" style="color: darkblue;"><i class="far fa-snowflake" style="color: blue;"></i> Air Conditioning</p><p class="facility" style="color: darkblue;"><i class="fas fa-wine-bottle" style="color: blue;"></i> Minibar</p><p class="facility" style="color: darkblue;"><i class="fa fa-bed" style="color: blue;"></i> Private Balcony</p><p class="facility" style="color: darkblue;"><i class="fa fa-bell" style="color: blue;"></i> Room Service</p>',10),
('Anantara Kalutara Resort','Kalutara','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Centara Ceysands Resort & Spa Sri Lanka','Galle','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Cinnamon Citadel','Kandy','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Citrus Waskaduwa','Kalutara','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Heritance Kandalama','Matale','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Hikka Tranz by Cinnamon','Galle','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Jetwing Lagoon','Colombo','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Cinnamon Lakeside Colombo','Colombo','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Shangri-La Colombo','Colombo','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Taj Samudra, Colombo','Colombo','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating'),
('Turyaa Kalutara','Kalutara','hotelAddress','hotelPhoneNo','hotelImagePri','hotelImageSlide','hotelDescription','hotelFacilities','roomTypes','roomFacilities','hotelrooms','hotelRating');
