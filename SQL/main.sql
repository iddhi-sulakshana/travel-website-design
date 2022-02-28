CREATE DATABASE `travelDB`;
USE `travelDB`;
SET time_zone = "+05:30";


-- @BLOCK
-- Table structure for table table_user
CREATE TABLE table_user(
  userId INT UNSIGNED AUTO_INCREMENT,
  userName VARCHAR(40) NOT NULL UNIQUE,
  email VARCHAR(40) UNIQUE,
  phoneNo VARCHAR(10) UNIQUE,
  pwd VARCHAR(40),
  firstName VARCHAR(40),
  lastName VARCHAR(40),
  userImg VARCHAR(40) NOT NULL DEFAULT 'user.png',
  PRIMARY KEY (userId)
);

-- @BLOCK
-- Table structure for table `table_hotel`
CREATE TABLE table_hotel (
  hotelId INT UNSIGNED AUTO_INCREMENT,
  hotelName VARCHAR(40) NOT NULL,
  hotelDistrict VARCHAR(40) NOT NULL,
  hotelImagePri VARCHAR(40) NOT NULL,
  hotelImageSlide TEXT DEFAULT NULL,
  hotelDescription TEXT NOT NULL,
  hotelFacilities TEXT NOT NULL,
  roomTypes TEXT NOT NULL,
  roomFacilities TEXT NOT NULL,
  hotelWebsite TEXT NOT NULL,
  hotelPhoneNo VARCHAR(12) NOT NULL,
  hotelAddress VARCHAR(40) NOT NULL,
  hotelMap TEXT NOT NULL,
  hotePrice DECIMAL(10,2) NOT NULL,
  hotelRating DECIMAL(2,1) DEFAULT 0.0,
  PRIMARY KEY (hotelId)
);

-- @BLOCK
-- Table structure for table table_hotelReview
CREATE TABLE table_hotelReview(
  hotelId INT UNSIGNED,
  userId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (hotelId),
  FOREIGN KEY (hotelId) REFERENCES table_hotel(hotelId),
  FOREIGN KEY (userId) REFERENCES table_user(userId)
);

-- @BLOCK
-- Table structure for table table_restaurant
CREATE TABLE table_restaurant (
  restaurantId INT UNSIGNED AUTO_INCREMENT,
  restaurantName VARCHAR(40) NOT NULL,
  restaurantDistrict VARCHAR(40) NOT NULL,
  restaurantImagePri VARCHAR(40) NOT NULL,
  restaurantImage1 VARCHAR(40),
  restaurantImage2 VARCHAR(40),
  restaurantImage3 VARCHAR(40),
  restaurantDescription TEXT NOT NULL,
  restaurantFacilities VARCHAR(40) NOT NULL,
  restaurantMenu VARCHAR(40) NOT NULL,
  restaurantWebsite TEXT NOT NULL,
  restaurantAddress VARCHAR(40) NOT NULL,
  restaurantMap TEXT NOT NULL,
  restaurantPhoneNo VARCHAR(12) NOT NULL,
  restaurantPrice DECIMAL(10,2) NOT NULL,
  restaurantRating DECIMAL(2,1) DEFAULT 0.0,
  PRIMARY KEY (restaurantId)
);

-- @BLOCK
-- Table structure for table table_restaurantReview
CREATE TABLE table_restaurantReview(
  restaurantId INT UNSIGNED,
  userId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (restaurantId),
  FOREIGN KEY (restaurantId) REFERENCES table_restaurant(restaurantId),
  FOREIGN KEY (userId) REFERENCES table_user(userId)
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
  vehicleWebsite TEXT NOT NULL,
  vehiclePhoneNo VARCHAR(12) NOT NULL,
  vehicleAddress VARCHAR(40) NOT NULL,
  vehicleMap TEXT,
  vehiclePrice DECIMAL(10,2) NOT NULL,
  vehicleRating DECIMAL(2,1) DEFAULT 0.0,
  PRIMARY KEY (vehicleId)
);

-- @BLOCK
-- Table structure for table table_vehicleReview
CREATE TABLE table_vehicleReview(
  vehicleId INT UNSIGNED,
  userId INT UNSIGNED,
  rate DECIMAL(2,1) NOT NULL,
  message VARCHAR(50) NOT NULL,
  DATE timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (vehicleId),
  FOREIGN KEY (vehicleId) REFERENCES table_vehicle(vehicleId),
  FOREIGN KEY (userId) REFERENCES table_user(userId)
);

-- @BLOCK
-- Talbe structrue for table table_package
CREATE TABLE table_package(
  packageId INT UNSIGNED AUTO_INCREMENT,
  packageTitle VARCHAR(40) NOT NULL,
  packageDescription VARCHAR(40) NOT NULL,
  packagePrice DECIMAL(10,2) NOT NULL,
  packageRating DECIMAL(2,1) NOT NULL,
  PRIMARY KEY (packageId)
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
-- insert into the user
INSERT INTO table_user(`userName`, `email`, `phoneNo`, `pwd`, `firstName`, `lastName`)
VALUES 
('rami123', 'rami123@hotmail.com', '0112525252', '1234', 'Rami', 'Conrad'),
('parker123', NULL, '0252525252', '1234', 'Parker', 'Benitez'),
('osian123', 'osian123@hotmail.com', NULL, '1234', 'Osian', 'Sharples'),
('almond123', NULL, '0552525252', '1234', 'Brandy', 'Almond'),
('noah123', 'noah123@hotmail.com', NULL, '1234', 'Noah', 'Salgado'),
('shiv123', 'shiv123@gmail.com', '0111111111', '1234', 'Shiv', 'Harrison');

-- @BLOCK
-- insert into th hotel
INSERT INTO `table_hotel`(`hotelName`, `hotelDistrict`, `hotelImagePri`, `hotelImageSlide`, `hotelDescription`, `hotelFacilities`, `roomTypes`, `roomFacilities`, `hotelWebsite`, `hotelPhoneNo`, `hotelAddress`, `hotelMap`, `hotePrice`)
VALUES 
('Weligama Bay Marriott Resort & Spa','Matara','hotel1 (1).jpg','hotel1 (2).jpg,hotel1 (3).jpg,hotel1 (4).jpg,hotel1 (5).jpg,hotel1 (6).jpg,hotel1 (7).jpg,hotel1 (8).jpg,hotel1 (9).jpg,hotel1 (10).jpg','Set right on the beach, Weligama Bay Marriott Resort & Spa offers beach front rooms, a year-round children''s pool, relaxation pool and outdoor lap pool. It also offers water sport facilities and has close proximity to the Galle Fort and Blue Whale watching hubs. The resort also offers a garden with outdoor furniture, a minibar, bathtubs and ironing facilities.','wifi,parking,swimmer,dumbbell,sun','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.marriott.com/en-us/hotels/cmbmc-weligama-bay-marriott-resort-and-spa/overview/','041 460 0100','700 Matara Rd, Weligama 81700','https://g.page/MHWeligama?share','44000.00');

-- @BLOCK
-- insert into the vehicle
INSERT INTO `table_vehicle`(`vehicleName`, `vehicleType`, `vehicleDistrict`, `vehicleImagePri`, `vehicleImage1`, `vehicleImage2`, `vehicleImage3`, `vehicleDescription`, `vehicleSeats`, `vehicleWebsite`, `vehiclePhoneNo`, `vehicleAddress`, `vehicleMap`, `vehiclePrice`) 
VALUES 
('Toyota Prius','Car','Batticaloa','car1.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>5 Passengers</li><li>1 Large Bags 👜</li><li>1 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent car 🚗 Sri Lanka.</p>",'5','https://bit.ly/3hnEeEw','075 715 0753','Batticaloa City, Batticaloa.','https://goo.gl/maps/JKcQ1zdgCq2CjBeeA','15000.00'),
('KDH Patroof','Van','Colombo','van1.jpg',NULL,NULL,NULL,"Functions :- <ul><li>Full A/C</li><li>Auto Gear</li><li>15 Passengers</li><li>3 Large Bags 👜</li><li>4 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent Van 🚐 Sri Lanka.</p>",'15','https://bit.ly/3srnx1l','076 027 1417','Piliyandala, Colombo.','https://goo.gl/maps/CLBCz8PgkYYCcJbt9','6000.00'),
('Toyota Premio','Car','Colombo','car2.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>4 Passengers</li><li>1 Large Bags 👜</li><li>1 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent car 🚗 Sri Lanka.</p>",'4','https://casons.lk/vehicle/toyota-premio-business-class','011 440 6544',' Gothami Road,Rajagiriya','https://g.page/casonsrentacar?share','10000.00'),
('Alphard Ex Lounge','Van','Colombo','van2.jpg',NULL,NULL,NULL,"Functions :- <ul><li>A/C</li><li>Auto Gear</li><li>6 Passengers</li><li>2 Large Bags 👜</li><li>1 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent Van 🚐 Sri Lanka.</p>",'6','https://casons.lk/vehicle/alphard-ex-lounge','011 440 6544',' Gothami Road,Rajagiriya','https://g.page/casonsrentacar?share','12000.00'),
('Suzuki Every','Van','Colombo','van3.jpg',NULL,NULL,NULL,"Functions :- <ul><li>Full A/C</li><li>Auto Gear</li><li>6 Passengers</li><li>2 Large Bags 👜</li><li>2 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent Van 🚐 Sri Lanka.</p>",'6','https://lankarentcar.com/','076 327 0269','Baseline Rd, Colombo.','https://g.page/Lanka-Rent-car?share','6000.00'),
('TOYOTA COASTER BUS','Bus','Colombo','bus1.jpg',NULL,NULL,NULL,"Functions :- <ul><li>Full A/C</li><li>With Driver</li><li>27 Passengers</li><li>10 Large Bags 👜</li><li>5 Small Bags 🎒</li></ul><p>Arrange transport for your tour with a popular choice of rent Luxury Bus 🚌 Sri Lanka.</p>",'27','https://www.lankaholidays.com/rent-a-car-van/car-hire_details-44298.html','077 600 9596','Baseline Rd, Colombo.','https://goo.gl/maps/y2DHWqb1e4DNyd3k8','18000.00');
