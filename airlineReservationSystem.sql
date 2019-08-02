CREATE DATABASE  IF NOT EXISTS `AIRLINES` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `AIRLINES`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: AIRLINES
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2000,'admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `flight_id` int(10) NOT NULL AUTO_INCREMENT,
  `depart_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `depart_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `depart_loc` varchar(10) NOT NULL,
  `destination` varchar(10) NOT NULL,
  `plane_id` int(10) NOT NULL,
  `UPDATEAT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `unique_flight_schedule` (`depart_date`,`depart_time`,`depart_loc`,`destination`,`plane_id`),
  KEY `destination_airport_idx` (`destination`),
  KEY `depart_loc_idx` (`depart_loc`),
  KEY `plane_id_idx` (`plane_id`),
  KEY `FK_origin_destination` (`depart_loc`,`destination`),
  CONSTRAINT `FK_origin_destination` FOREIGN KEY (`depart_loc`, `destination`) REFERENCES `price` (`location1`, `location2`),
  CONSTRAINT `FK_plane_id` FOREIGN KEY (`plane_id`) REFERENCES `airplane` (`plane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1044 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1002,'2019-07-15','2019-07-15','06:15:00','11:21:00','LAX','DFW',2,'2019-07-01 18:00:00'),(1003,'2019-11-20','2019-11-21','22:47:00','00:31:00','MSP','SAN',3,'2019-07-12 18:00:00'),(1004,'2019-12-20','2019-12-21','21:40:00','05:00:00','SEA','DTW',4,'2019-07-05 18:00:00'),(1005,'2019-07-18','2019-07-18','15:34:00','22:47:00','MIA','LAX',5,'2019-07-17 18:00:00'),(1006,'2019-07-17','2019-07-17','06:00:00','08:18:00','PDX','LGB',6,'2019-08-05 18:00:00'),(1008,'2019-07-16','2019-07-17','22:54:00','07:33:00','SJC','JFK',8,'2019-07-03 18:00:00'),(1009,'2019-07-21','2019-07-21','10:05:00','12:50:00','ORD','SJC',9,'2019-07-04 18:00:00'),(1010,'2019-07-18','2019-07-18','10:48:00','12:17:00','ONT','SFO',10,'2019-07-05 18:00:00'),(1011,'2019-07-18','2019-07-19','22:27:00','08:21:00','OAK','SAN',1,'2019-07-17 18:00:00'),(1012,'2019-07-22','2019-07-22','12:51:00','19:20:00','SFO','MSY',2,'2019-07-04 18:00:00'),(1013,'2019-07-17','2019-07-18','23:55:00','05:06:00','SEA','MSP',3,'2019-07-13 18:00:00'),(1014,'2019-08-14','2019-08-15','22:00:00','04:50:00','SFO','CMH',4,'2019-08-01 16:10:03'),(1015,'2019-07-17','2019-07-17','06:59:00','12:27:00','JFK','SJC',5,'2019-07-20 18:00:00'),(1016,'2019-09-30','2019-09-30','19:05:00','20:33:00','MCI','LAX',6,'2019-06-01 16:10:03'),(1017,'2019-10-13','2019-10-13','11:00:00','15:00:00','ABY','VLD',6,'2019-06-14 16:10:03'),(1024,'2019-08-10','2019-08-10','12:00:00','14:00:00','SJC','SEA',1,'2019-07-14 18:00:00'),(1031,'2019-08-11','2019-08-11','19:00:00','23:00:00','SJC','SEA',7,'2019-07-10 22:30:00'),(1034,'2019-08-08','2019-08-08','19:00:00','21:00:00','SEA','SJC',7,'2019-07-19 22:30:00'),(1036,'2019-08-07','2019-08-07','12:00:00','14:00:00','SJC','SEA',1,'2019-07-13 22:30:00'),(1037,'2019-08-03','2019-08-03','12:00:00','14:00:00','SJC','SEA',1,'2019-07-03 22:30:00'),(1038,'2019-10-10','2019-10-10','18:05:00','23:20:00','SJC','VLD',10,'2019-07-16 22:30:00'),(1040,'2019-08-08','2019-08-08','12:00:00','14:00:00','SJC','SEA',1,'2019-07-13 22:30:00'),(1041,'2019-11-04','2010-11-04','15:03:00','19:20:00','ABY','VLD',5,'2019-08-01 03:49:59');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_valid_airline_insertion` BEFORE INSERT ON `airline` FOR EACH ROW begin
	if new.arrival_date < new.depart_date then
		set new.arrival_date=null;
	end if;
    if new.arrival_date = new.depart_date and new.arrival_time < new.depart_time then
		set new.arrival_time=null;
	end if;
	if (new.depart_loc, new.destination) not in (select location1, location2 from price) then
		insert into price values(new.depart_loc, new.destination, null);
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `plane_id` int(10) NOT NULL AUTO_INCREMENT,
  `seats` int(10) NOT NULL,
  PRIMARY KEY (`plane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,66),(2,30),(3,46),(4,57),(5,67),(6,40),(7,38),(8,36),(9,60),(10,80);
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `IATA_CODE` varchar(10) NOT NULL,
  `AIRPORT` varchar(100) NOT NULL,
  PRIMARY KEY (`IATA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('ABE','Lehigh Valley International Airport'),('ABI','Abilene Regional Airport'),('ABQ','Albuquerque International Sunport'),('ABR','Aberdeen Regional Airport'),('ABY','Southwest Georgia Regional Airport'),('ACK','Nantucket Memorial Airport'),('ACT','Waco Regional Airport'),('ACV','Arcata Airport'),('ACY','Atlantic City International Airport'),('ADK','Adak Airport'),('ADQ','Kodiak Airport'),('AEX','Alexandria International Airport'),('AGS','Augusta Regional Airport (Bush Field)'),('AKN','King Salmon Airport'),('ALB','Albany International Airport'),('ALO','Waterloo Regional Airport'),('AMA','Rick Husband Amarillo International Airport'),('ANC','Ted Stevens Anchorage International Airport'),('APN','Alpena County Regional Airport'),('ASE','Aspen-Pitkin County Airport'),('ATL','Hartsfield-Jackson Atlanta International Airport'),('ATW','Appleton International Airport'),('AUS','Austin-Bergstrom International Airport'),('AVL','Asheville Regional Airport'),('AVP','Wilkes-Barre/Scranton International Airport'),('AZO','Kalamazoo/Battle Creek International Airport'),('BDL','Bradley International Airport'),('BET','Bethel Airport'),('BFL','Meadows Field'),('BGM','Greater Binghamton Airport'),('BGR','Bangor International Airport'),('BHM','Birmingham-Shuttlesworth International Airport'),('BIL','Billings Logan International Airport'),('BIS','Bismarck Municipal Airport'),('BJI','Bemidji Regional Airport'),('BLI','Bellingham International Airport'),('BMI','Central Illinois Regional Airport at Bloomington-Normal'),('BNA','Nashville International Airport'),('BOI','Boise Airport (Boise Air Terminal)'),('BOS','Gen. Edward Lawrence Logan International Airport'),('BPT','Jack Brooks Regional Airport (Southeast Texas Regional)'),('BQK','Brunswick Golden Isles Airport'),('BQN','Rafael Hernández Airport'),('BRD','Brainerd Lakes Regional Airport'),('BRO','Brownsville/South Padre Island International Airport'),('BRW','Wiley Post-Will Rogers Memorial Airport'),('BTM','Bert Mooney Airport'),('BTR','Baton Rouge Metropolitan Airport'),('BTV','Burlington International Airport'),('BUF','Buffalo Niagara International Airport'),('BUR','Bob Hope Airport (Hollywood Burbank Airport)'),('BWI','Baltimore-Washington International Airport'),('BZN','Bozeman Yellowstone International Airport (Gallatin Field Airport)'),('CAE','Columbia Metropolitan Airport'),('CAK','Akron-Canton Regional Airport'),('CDC','Cedar City Regional Airport'),('CDV','Merle K. (Mudhole) Smith Airport'),('CEC','Del Norte County Airport (Jack McNamara Field)'),('CHA','Chattanooga Metropolitan Airport (Lovell Field)'),('CHO','Charlottesville-Albemarle Airport'),('CHS','Charleston International Airport/Charleston AFB'),('CID','The Eastern Iowa Airport'),('CIU','Chippewa County International Airport'),('CLD','McClellan-Palomar Airport'),('CLE','Cleveland Hopkins International Airport'),('CLL','Easterwood Airport'),('CLT','Charlotte Douglas International Airport'),('CMH','Port Columbus International Airport'),('CMI','University of Illinois - Willard Airport'),('CMX','Houghton County Memorial Airport'),('CNY','Canyonlands Field'),('COD','Yellowstone Regional Airport'),('COS','City of Colorado Springs Municipal Airport'),('COU','Columbia Regional Airport'),('CPR','Natrona County International Airport'),('CRP','Corpus Christi International Airport'),('CRW','Yeager Airport'),('CSG','Columbus Metropolitan Airport'),('CVG','Cincinnati/Northern Kentucky International Airport'),('CWA','Central Wisconsin Airport'),('DAB','Daytona Beach International Airport'),('DAL','Dallas Love Field'),('DAY','James M. Cox Dayton International Airport'),('DBQ','Dubuque Regional Airport'),('DCA','Ronald Reagan Washington National Airport'),('DEN','Denver International Airport'),('DFW','Dallas/Fort Worth International Airport'),('DHN','Dothan Regional Airport'),('DIK','Dickinson Theodore Roosevelt Regional Airport'),('DLG','Dillingham Airport'),('DLH','Duluth International Airport'),('DRO','Durango-La Plata County Airport'),('DSM','Des Moines International Airport'),('DTW','Detroit Metropolitan Airport'),('DVL','Devils Lake Regional Airport'),('EAU','Chippewa Valley Regional Airport'),('EGE','Eagle County Regional Airport'),('EKO','Elko Regional Airport'),('ELM','Elmira/Corning Regional Airport'),('ELP','El Paso International Airport'),('ERI','Erie International Airport'),('ESC','Delta County Airport'),('EUG','Eugene Airport (Mahlon Sweet Field)'),('EVV','Evansville Regional Airport'),('EWN','Coastal Carolina Regional Airport (Craven County Regional)'),('EWR','Newark Liberty International Airport'),('EYW','Key West International Airport'),('FAI','Fairbanks International Airport'),('FAR','Hector International Airport'),('FAT','Fresno Yosemite International Airport'),('FAY','Fayetteville Regional Airport'),('FCA','Glacier Park International Airport'),('FLG','Flagstaff Pulliam Airport'),('FLL','Fort Lauderdale-Hollywood International Airport'),('FNT','Bishop International Airport'),('FSD','Sioux Falls Regional Airport'),('FSM','Fort Smith Regional Airport'),('FWA','Fort Wayne International Airport'),('GCC','Gillette-Campbell County Airport'),('GCK','Garden City Regional Airport'),('GEG','Spokane International Airport'),('GFK','Grand Forks International Airport'),('GGG','East Texas Regional Airport'),('GJT','Grand Junction Regional Airport (Walker Field)'),('GNV','Gainesville Regional Airport'),('GPT','Gulfport-Biloxi International Airport'),('GRB','Green Bay-Austin Straubel International Airport'),('GRI','Central Nebraska Regional Airport'),('GRK','Killeen-Fort Hood Regional Airport'),('GRR','Gerald R. Ford International Airport'),('GSO','Piedmont Triad International Airport'),('GSP','Greenville-Spartanburg International Airport'),('GST','Gustavus Airport'),('GTF','Great Falls International Airport'),('GTR','Golden Triangle Regional Airport'),('GUC','Gunnison-Crested Butte Regional Airport'),('GUM','Guam International Airport'),('HDN','Yampa Valley Airport (Yampa Valley Regional)'),('HIB','Range Regional Airport (Chisholm-Hibbing Airport)'),('HLN','Helena Regional Airport'),('HNL','Honolulu International Airport'),('HOB','Lea County Regional Airport'),('HOU','William P. Hobby Airport'),('HPN','Westchester County Airport'),('HRL','Valley International Airport'),('HSV','Huntsville International Airport'),('HYA','Barnstable Municipal Airport'),('HYS','Hays Regional Airport'),('IAD','Washington Dulles International Airport'),('IAG','Niagara Falls International Airport'),('IAH','George Bush Intercontinental Airport'),('ICT','Wichita Dwight D. Eisenhower National Airport (Wichita Mid-Continent Airport)'),('IDA','Idaho Falls Regional Airport'),('ILG','Wilmington Airport'),('ILM','Wilmington International Airport'),('IMT','Ford Airport'),('IND','Indianapolis International Airport'),('INL','Falls International Airport'),('ISN','Sloulin Field International Airport'),('ISP','Long Island MacArthur Airport'),('ITH','Ithaca Tompkins Regional Airport'),('ITO','Hilo International Airport'),('JAC','Jackson Hole Airport'),('JAN','Jackson-Evers International Airport'),('JAX','Jacksonville International Airport'),('JFK','John F. Kennedy International Airport (New York International Airport)'),('JLN','Joplin Regional Airport'),('JMS','Jamestown Regional Airport'),('JNU','Juneau International Airport'),('KOA','Kona International Airport at Keahole'),('KTN','Ketchikan International Airport'),('LAN','Capital Region International Airport ( Lansing Capital City)'),('LAR','Laramie Regional Airport'),('LAS','McCarran International Airport'),('LAW','Lawton-Fort Sill Regional Airport'),('LAX','Los Angeles International Airport'),('LBB','Lubbock Preston Smith International Airport'),('LBE','Arnold Palmer Regional Airport'),('LCH','Lake Charles Regional Airport'),('LEX','Blue Grass Airport'),('LFT','Lafayette Regional Airport'),('LGA','LaGuardia Airport (Marine Air Terminal)'),('LGB','Long Beach Airport (Daugherty Field)'),('LIH','Lihue Airport'),('LIT','Bill and Hillary Clinton National Airport (Adams Field)'),('LNK','Lincoln Airport (Lincoln Municipal)'),('LRD','Laredo International Airport'),('LSE','La Crosse Regional Airport'),('LWS','Lewiston-Nez Perce County Airport'),('MAF','Midland International Airport'),('MBS','MBS International Airport'),('MCI','Kansas City International Airport'),('MCO','Orlando International Airport'),('MDT','Harrisburg International Airport'),('MDW','Chicago Midway International Airport'),('MEI','Meridian Regional Airport'),('MEM','Memphis International Airport'),('MFE','McAllen-Miller International Airport (McAllen Miller International)'),('MFR','Rogue Valley International Airport'),('MGM','Montgomery Regional Airport'),('MHK','Manhattan Regional Airport'),('MHT','Manchester-Boston Regional Airport'),('MIA','Miami International Airport'),('MKE','General Mitchell International Airport'),('MKG','Muskegon County Airport'),('MLB','Melbourne International Airport'),('MLI','Quad City International Airport'),('MLU','Monroe Regional Airport'),('MMH','Mammoth Yosemite Airport'),('MOB','Mobile Regional Airport'),('MOT','Minot International Airport'),('MQT','Sawyer International Airport'),('MRY','Monterey Regional Airport (Monterey Peninsula Airport)'),('MSN','Dane County Regional Airport'),('MSO','Missoula International Airport'),('MSP','Minneapolis-Saint Paul International Airport'),('MSY','Louis Armstrong New Orleans International Airport'),('MTJ','Montrose Regional Airport'),('MVY','Martha\'s Vineyard Airport'),('MYR','Myrtle Beach International Airport'),('OAJ','Albert J. Ellis Airport'),('OAK','Oakland International Airport'),('OGG','Kahului Airport'),('OKC','Will Rogers World Airport'),('OMA','Eppley Airfield'),('OME','Nome Airport'),('ONT','Ontario International Airport'),('ORD','Chicago O\'Hare International Airport'),('ORF','Norfolk International Airport'),('ORH','Worcester Regional Airport'),('OTH','Southwest Oregon Regional Airport (North Bend Municipal)'),('OTZ','Ralph Wien Memorial Airport'),('PAH','Barkley Regional Airport'),('PBI','Palm Beach International Airport'),('PDX','Portland International Airport'),('PHF','Newport News/Williamsburg International Airport'),('PHL','Philadelphia International Airport'),('PHX','Phoenix Sky Harbor International Airport'),('PIA','General Wayne A. Downing Peoria International Airport'),('PIB','Hattiesburg-Laurel Regional Airport'),('PIH','Pocatello Regional Airport'),('PIT','Pittsburgh International Airport'),('PLN','Pellston Regional Airport of Emmet County'),('PNS','Pensacola International Airport (Pensacola Gulf Coast Regional Airport)'),('PPG','Pago Pago International Airport (Tafuna Airport)'),('PSC','Tri-Cities Airport'),('PSE','Mercedita Airport'),('PSG','Petersburg James A. Johnson Airport'),('PSP','Palm Springs International Airport'),('PUB','Pueblo Memorial Airport'),('PVD','Theodore Francis Green State Airport'),('PWM','Portland International Jetport'),('RAP','Rapid City Regional Airport'),('RDD','Redding Municipal Airport'),('RDM','Redmond Municipal Airport (Roberts Field)'),('RDU','Raleigh-Durham International Airport'),('RHI','Rhinelander-Oneida County Airport'),('RIC','Richmond International Airport'),('RKS','Rock Springs-Sweetwater County Airport'),('RNO','Reno/Tahoe International Airport'),('ROA','Roanoke Regional Airport (Woodrum Field)'),('ROC','Greater Rochester International Airport'),('ROW','Roswell International Air Center'),('RST','Rochester International Airport'),('RSW','Southwest Florida International Airport'),('SAF','Santa Fe Municipal Airport'),('SAN','San Diego International Airport (Lindbergh Field)'),('SAT','San Antonio International Airport'),('SAV','Savannah/Hilton Head International Airport'),('SBA','Santa Barbara Municipal Airport (Santa Barbara Airport)'),('SBN','South Bend International Airport (South Bend Regional)'),('SBP','San Luis Obispo County Regional Airport (McChesney Field)'),('SCC','Deadhorse Airport (Prudhoe Bay Airport)'),('SCE','University Park Airport'),('SDF','Louisville International Airport (Standiford Field)'),('SEA','Seattle-Tacoma International Airport'),('SFO','San Francisco International Airport'),('SGF','Springfield-Branson National Airport'),('SGU','St. George Regional Airport'),('SHV','Shreveport Regional Airport'),('SIT','Sitka Rocky Gutierrez Airport'),('SJC','Norman Y. Mineta San José International Airport'),('SJT','San Angelo Regional Airport (Mathis Field)'),('SJU','Luis Muñoz Marín International Airport'),('SLC','Salt Lake City International Airport'),('SMF','Sacramento International Airport'),('SMX','Santa Maria Public Airport (Capt G. Allan Hancock Field)'),('SNA','John Wayne Airport (Orange County Airport)'),('SPI','Abraham Lincoln Capital Airport'),('SPS','Wichita Falls Municipal Airport/Sheppard AFB'),('SRQ','Sarasota-Bradenton International Airport'),('STC','St. Cloud Regional Airport'),('STL','St. Louis International Airport at Lambert Field'),('STT','Cyril E. King Airport'),('STX','Henry E. Rohlsen Airport'),('SUN','Friedman Memorial Airport'),('SUX','Sioux Gateway Airport'),('SWF','Stewart International Airport'),('SYR','Syracuse Hancock International Airport'),('TLH','Tallahassee International Airport'),('TOL','Toledo Express Airport'),('TPA','Tampa International Airport'),('TRI','Tri-Cities Regional Airport'),('TTN','Trenton Mercer Airport'),('TUL','Tulsa International Airport'),('TUS','Tucson International Airport'),('TVC','Cherry Capital Airport'),('TWF','Magic Valley Regional Airport (Joslin Field)'),('TXK','Texarkana Regional Airport (Webb Field)'),('TYR','Tyler Pounds Regional Airport'),('TYS','McGhee Tyson Airport'),('VEL','Valdez Airport'),('VLD','Valdosta Regional Airport'),('VPS','Destin-Fort Walton Beach Airport/Eglin AFB'),('WRG','Wrangell Airport'),('WYS','Westerly State Airport'),('XNA','Northwest Arkansas Regional Airport'),('YAK','Yakutat Airport'),('YUM','Yuma International Airport');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_airline`
--

DROP TABLE IF EXISTS `archive_airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_airline` (
  `a_flight_id` int(11) NOT NULL,
  `a_depart_date` date DEFAULT NULL,
  `a_arrival_date` date DEFAULT NULL,
  `a_depart_time` time DEFAULT NULL,
  `a_arrival_time` time DEFAULT NULL,
  `a_depart_loc` varchar(10) DEFAULT NULL,
  `a_destination` varchar(10) DEFAULT NULL,
  `a_plane_id` int(10) DEFAULT NULL,
  `old_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`a_flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_airline`
--

LOCK TABLES `archive_airline` WRITE;
/*!40000 ALTER TABLE `archive_airline` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `ticket_id` int(20) NOT NULL AUTO_INCREMENT,
  `custom_id` int(11) NOT NULL,
  `flight_id` int(10) DEFAULT NULL,
  `payment` int(10) DEFAULT NULL,
  `UPDATEAT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`,`custom_id`),
  KEY `flight_id_idx` (`flight_id`),
  KEY `custom_id_idx` (`custom_id`),
  CONSTRAINT `custom_id` FOREIGN KEY (`custom_id`) REFERENCES `customer` (`custom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flight_id` FOREIGN KEY (`flight_id`) REFERENCES `airline` (`flight_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1005,1005,400,NULL),(2,1005,1005,400,NULL),(9,1003,1006,170,'2019-07-21 00:09:05'),(22,1002,1006,400,'2019-07-27 23:52:12'),(28,1007,1024,150,'2019-08-02 17:43:10'),(29,1007,1034,300,'2019-08-02 17:43:18'),(30,1007,1041,80,'2019-08-02 17:43:39');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `discount_for_1000_above_ticket` BEFORE INSERT ON `booking` FOR EACH ROW begin
	if new.payment > 800 then
		set new.payment = new.payment-50;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(64) NOT NULL,
  `cc` bigint(20) NOT NULL,
  PRIMARY KEY (`custom_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,'a123','John Smith','1234567899','johnsmith@gmail.com',1234123456785680),(1001,'apple44','Jill Smith','9987654321','jillsmith@gmail.com',4567879354123460),(1002,'q12345','Nick Duncan','4325679806','nickduncan@gmail.com',7859123456459090),(1003,'turtle23','Karen Allen','5678767623','karenallen@gmail.com',8876123245789930),(1004,'mypassword','Jonah Young','5379888922','jonahyoung@gmail.com',3674675912347660),(1005,'q975633123123','Hillary Hanson','6479871092','hillaryhanson123@gmail.com',9145835732978470),(1007,'123','123','1232748283','123',817623871),(1008,'12','new name','7284912832','12',12836187648716821);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `location1` varchar(10) NOT NULL,
  `location2` varchar(10) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`location1`,`location2`),
  KEY `location2_idx` (`location2`),
  CONSTRAINT `location1` FOREIGN KEY (`location1`) REFERENCES `airport` (`iata_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location2` FOREIGN KEY (`location2`) REFERENCES `airport` (`iata_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES ('ABR','ALO',800),('ABY','VLD',80),('JFK','SJC',900),('LAX','DFW',500),('MCI','LAX',450),('MIA','LAX',880),('MSP','SAN',700),('OAK','SAN',300),('ONT','SFO',250),('ORD','SJC',780),('PDX','LGB',400),('SAN','JFK',920),('SEA','DTW',800),('SEA','MIA',1000),('SEA','MSP',650),('SEA','SJC',300),('SFO','CMH',830),('SFO','MSY',740),('SJC','JFK',980),('SJC','SEA',150),('SJC','VLD',600);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AIRLINES'
--
/*!50003 DROP PROCEDURE IF EXISTS `archiveFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `archiveFlight`(
IN date_in date)
BEGIN
    START TRANSACTION;
    INSERT INTO archive_airline
    SELECT flight_id, depart_date, arrival_date, depart_time, arrival_time, depart_loc, destination, plane_id, UPDATEAT
    FROM airline
    WHERE UPDATEAT < date_in;
    
    DELETE FROM airline
    WHERE UPDATEAT < date_in;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booking_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `booking_flight`(
	in n_custom_id	int(10),
    in n_flight_id	int(10)
    )
begin
    insert into booking
    (
		ticket_id,
        custom_id,
        flight_id,
        payment,
        UPDATEAT
        
	)
    values
    (
		default,
        n_custom_id,
        n_flight_id,
        (select price from airline,price where n_flight_id=flight_id and airline.depart_loc=price.location1 and airline.destination=price.location2),
        current_timestamp()
	);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cheapest_n_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cheapest_n_flight`(
in top_n int)
begin
	select flight_id, depart_date, arrival_date, depart_time, arrival_time, airline.depart_loc, airline.destination, plane_id, price from airline, price where airline.depart_loc=price.location1 
		and airline.destination=price.location2  order by price limit top_n;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_available_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_available_seats`(
	in flightNumber int(10),
    out available_seats int)
begin
	select totalseats.seats - soldseats.seats into available_seats from
		(select seats from airline, airplane where airplane.plane_id=airline.plane_id and flight_id=flightNumber) as totalseats,
		(select count(*) as seats from booking where booking.flight_id=flightNumber) as soldseats;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFlight`(
IN flightID_in int(10))
BEGIN
	DELETE FROM airline
    WHERE flight_id = flightID_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_airlines_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_airlines_schedule`(
        in n_depart_date date,
        in n_arrival_date	date,
        in n_depart_time	time,
        in n_arrival_time	time,
        in n_depart_loc	varchar(10),
        in n_destination	varchar(10),
        in n_plane_id	int(10)
	)
begin
	insert into airline
	(	
		flight_id,
        depart_date,
        arrival_date,
        depart_time,
        arrival_time,
        depart_loc,
        destination,
        plane_id,
        UPDATEAT
	)
    values
    (
		default,
        n_depart_date,
        n_arrival_date,
        n_depart_time,
        n_arrival_time,
        n_depart_loc,
        n_destination,
        n_plane_id,
        current_timestamp()
        );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `most_popular_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `most_popular_flight`(
	out most_popular_flight_id int(10),
    out sold_tickets int)
begin
	select flight_id into most_popular_flight_id from (select flight_id , count(*) as tickets from booking group by flight_id order by tickets desc limit 1) TB;
    select tickets into sold_tickets from (select flight_id , count(*) as tickets from booking group by flight_id order by tickets desc limit 1) TB;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `same_time_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `same_time_flight`()
begin
	select flight_id, depart_loc, depart_time from airline A1 where exists (select * from airline A2 where 
	A1.depart_time = A2.depart_time and A1.depart_loc=A2.depart_loc and A1.depart_date <> A2.depart_date);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_a_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_a_flight`(
	in n_depart_location varchar(10),
    in n_arrival_location varchar(10),
    in n_depart_date date
    
)
begin
	select flight_id, depart_loc, destination, depart_date, arrival_date, depart_time, arrival_time, plane_id, price from airline, distance 
    where depart_loc=location1 
		and destination=location2 and depart_loc=n_depart_location and destination=n_arrival_location and depart_date=n_depart_date;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_only_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_only_by_date`(
    in n_depart_date date
    
)
begin
	select flight_id, depart_loc, destination, depart_date, arrival_date, depart_time, arrival_time, plane_id, price from airline, distance 
    where depart_loc=location1 
		and destination=location2 and depart_date=n_depart_date;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_only_by_locations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_only_by_locations`(
	in n_depart_location varchar(10),
    in n_arrival_location varchar(10)
    
)
begin
	select flight_id, depart_loc, destination, depart_date, arrival_date, depart_time, arrival_time, plane_id, price from airline, distance 
    where depart_loc=location1 
		and destination=location2 and depart_loc=n_depart_location and destination=n_arrival_location;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_2_destination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_2_destination`(
	in n_depart_loc varchar(10))
begin
	select destination, count(*) from (select booking.custom_id, airline.destination 
	from booking, airline where booking.flight_id=airline.flight_id and airline.depart_loc=n_depart_loc) TB 
    group by destination order by count(*) desc limit 2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unbooked_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unbooked_customers`()
begin
	select customer.custom_id from customer left join booking on customer.custom_id=booking.custom_id where ticket_id is null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_airline` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_airline`(
	in n_flight_id int,
	in n_depart_date date,
	in n_arrival_date	date,
	in n_depart_time	time,
	in n_arrival_time	time,
	in n_depart_loc	varchar(10),
	in n_destination	varchar(10),
	in n_plane_id	int(10)
)
begin
	update airline set 
    depart_date = n_depart_date,
    arrival_date = n_arrival_date,
    depart_time = n_depart_time,
    arrival_time = n_arrival_time,
    depart_loc = n_depart_loc,
    destination = n_destination,
    plane_id = n_plane_id,
    UPDATEAT = current_timestamp()
    where flight_id=n_flight_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer`(
	in n_custom_id int(11),
	in n_firstname varchar(64),
    in n_lastname varchar(64),
	in n_password varchar(64),
    in n_email varchar(64),
    in n_phone char(10),
    in n_cc bigint(20))
begin
	update customer set
    firstname = n_firstname,
    lastname = n_lastname,
    password = n_password,
    email = n_email,
    phone = n_phone,
    cc = n_cc
    where custom_id = n_custom_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewArchivedFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewArchivedFlights`()
BEGIN
    SELECT a_flight_id, a_depart_date, a_arrival_date, a_depart_time, a_arrival_time, a_depart_loc, a_destination, a_plane_id, old_update_time
    FROM archive_airline;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02 10:47:42
