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
('Weligama Bay Marriott Resort & Spa','Matara','hotel1 (1).jpg','hotel1 (2).jpg,hotel1 (3).jpg,hotel1 (4).jpg,hotel1 (5).jpg,hotel1 (6).jpg,hotel1 (7).jpg,hotel1 (8).jpg,hotel1 (9).jpg,hotel1 (10).jpg','Set right on the beach, Weligama Bay Marriott Resort & Spa offers beach front rooms, a year-round children''s pool, relaxation pool and outdoor lap pool. It also offers water sport facilities and has close proximity to the Galle Fort and Blue Whale watching hubs. The resort also offers a garden with outdoor furniture, a minibar, bathtubs and ironing facilities.','wifi,parking,swimmer,dumbbell,sun','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.marriott.com/en-us/hotels/cmbmc-weligama-bay-marriott-resort-and-spa/overview/','041 460 0100','700 Matara Rd, Weligama 81700','https://g.page/MHWeligama?share','44000.00'),
('Amaya Beach Pasikudah','Batticaloa','hotel2 (1).jpg','hotel2 (2).jpg,hotel2 (3).jpg,hotel2 (4).jpg,hotel2 (5).jpg,hotel2 (6).jpg,hotel2 (7).jpg,hotel2 (8).jpg,hotel2 (9).jpg,hotel2 (10).jpg','Amaya Beach Passikudah Resort & Spa Sri Lanka is set next to the beach at Passikudah Bay, a long stretch of coastline renowned for its calm and shallow waters, ideal for swimming and water sports. Besides relaxing on the tranquil beach you will enjoy a wide range of facilities and activities including a large swimming pool, water sports and an award-winning spa.','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.amayaresorts.com/amayabeach/','065 205 0200','Pasikudah Rd, Kalkudah 10120 Sri Lanka','https://g.page/AmayaBeachPassikudah?share','18000.00'),
('Anantara Kalutara Resort','Kalutara','hotel3 (1).jpg','hotel3 (2).jpg,hotel3 (3).jpg,hotel3 (4).jpg,hotel3 (5).jpg,hotel3 (6).jpg,hotel3 (7).jpg,hotel3 (8).jpg,hotel3 (9).jpg,hotel3 (10).jpg','Welcome to Anantara Kalutara Resort, your Kalutara “home away from home.” Anantara Kalutara Resort aims to make your visit as relaxing and enjoyable as possible, which is why so many guests continue to come back year after year. <br> St. John''s Church (1.8 mi), located nearby, makes Anantara Kalutara Resort a great place to stay for those interested in visiting this popular Kalutara landmark. <br> Guest rooms offer a flat screen TV, air conditioning, and a minibar, and Anantara Kalutara Resort makes getting online easy as free wifi is available.','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.anantara.com/en/kalutara','034 722 6060','St. Sebastian''s Road, Kalutara 12000 Sri Lanka','https://goo.gl/maps/cytm7BNYzA5Lk5iZ6','62000.00'),
('Centara Ceysands Resort & Spa Sri Lanka','Kalutara','hotel4 (1).jpg','hotel4 (2).jpg,hotel4 (3).jpg,hotel4 (4).jpg,hotel4 (5).jpg,hotel4 (6).jpg,hotel4 (7).jpg,hotel4 (8).jpg,hotel4 (9).jpg,hotel4 (10).jpg','On the Bentota peninsula, the Centara Ceysands Resort & Spa Sri Lanka enjoys a superb location with the Bentota River on one side and the Indian Ocean on the other, and is accessed by a short boat ride across the lagoon. The rooms and suites (38-139 sqm. of total living space) feature a balcony or terrace looking out across the peaceful river or over the blue ocean. Truly a family destination in concept, the resort also offers a choice of family-friend accommodation options including Family Residences with bunk beds in a separate children’s area. The resort offers an abundance of natural attractions along with a huge, palm-fringed swimming pool with Jacuzzi, a wealth of water sports including canoeing, sailing, wakeboarding, knee-boarding, and jet skiing, two kids clubs, and a wonderful spa inspired by Thai and Ayurvedic wellbeing heritage. Riverside dining is one of the highlights of the resort which is also home to an authentic Thai restaurant and two bars. Wi-Fi is complimentary.','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.centarahotelsresorts.com/centara/ccs/','034 227 5073','Aluthgama - Mathugama Rd, Aluthgama Sri Lanka','https://g.page/CentaraCeysands?share','32000.00'),
('Cinnamon Citadel','Kandy','hotel5 (1).jpg','hotel5 (2).jpg,hotel5 (3).jpg,hotel5 (4).jpg,hotel5 (5).jpg,hotel5 (6).jpg,hotel5 (7).jpg,hotel5 (8).jpg,hotel5 (9).jpg,hotel5 (10).jpg','Sweeping green hills, the longest river in the country, misty mornings and the fresh outdoors, are just a few things that naturally come together here to make the perfect holiday. Just 2 1/2 hours from the Sri Lanka''s Capital City Colombo, Chaaya Citadel Kandy has reinvented itself taking into account the needs of holidaymakers around the world. Replete with a sense of history, serenity and majesty, the hotel offers guests the opportunity to experience the amazing Kandyan history, the culture and the arts that play a big role in the lives of the Sri Lankans.','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','https://www.cinnamonhotels.com/cinnamoncitadelkandy','011 216 1161','124 Srimath Kuda Ratwatte Mawatha, Kandy 20000 Sri Lanka','https://goo.gl/maps/AUECpnCDEW5MDrb86','20000.00'),
('Citrus Waskaduwa','Kalutara','hotel6 (1).jpg','hotel6 (2).jpg,hotel6 (3).jpg,hotel6 (4).jpg,hotel6 (5).jpg,hotel6 (6).jpg,hotel6 (7).jpg,hotel6 (8).jpg,hotel6 (9).jpg,hotel6 (10).jpg','Citrus Waskaduwa is a five star 150 roomed resort managed by Sri Lanka''s fastest growing leisure company, Citrus Leisure PLC.','eye,bed-family,bed-delux,bed-bridal','snowflake,wine-bottle,bed,bell','http://www.citrusleisure.com/waskaduwa/','011 575 5055','No. 427 Samanthara Road, Waskaduwa 12000 Sri Lanka','https://goo.gl/maps/ockyjZYLNnnRL6827','17000.00');

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
