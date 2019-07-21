CREATE DATABASE  IF NOT EXISTS `AIRLINES` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `AIRLINES`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: AIRLINES
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airline` (
  `flight_id` int(10) NOT NULL AUTO_INCREMENT,
  `depart_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `depart_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `depart_loc` varchar(10) NOT NULL,
  `destination` varchar(10) NOT NULL,
  `plane_id` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `UPDATEAT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `unique_flight_schedule` (`depart_date`,`depart_time`,`depart_loc`,`destination`,`plane_id`),
  KEY `destination_airport_idx` (`destination`),
  KEY `depart_loc_idx` (`depart_loc`),
  KEY `plane_id_idx` (`plane_id`),
  KEY `FK_origin_destination` (`depart_loc`,`destination`),
  CONSTRAINT `FK_origin_destination` FOREIGN KEY (`depart_loc`, `destination`) REFERENCES `distance` (`location1`, `location2`),
  CONSTRAINT `FK_plane_id` FOREIGN KEY (`plane_id`) REFERENCES `airplane` (`plane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1001,'2019-07-15','2019-07-15','10:52:00','18:30:00','SFO','CMH',1,300,'2019-07-21 03:28:58'),(1002,'2019-07-15','2019-07-15','06:15:00','11:21:00','LAX','DFW',2,300,NULL),(1003,'2019-11-20','2019-11-21','22:47:00','00:31:00','MSP','SAN',3,150,NULL),(1004,'2019-12-20','2019-12-21','21:40:00','05:00:00','SEA','DTW',4,450,NULL),(1005,'2019-07-18','2019-07-18','15:34:00','22:47:00','MIA','LAX',5,230,NULL),(1006,'2019-07-17','2019-07-17','06:00:00','08:18:00','PDX','LGB',6,170,NULL),(1007,'2019-10-28','2019-10-29','20:24:00','05:17:00','SEA','MIA',7,550,NULL),(1008,'2019-07-16','2019-07-17','22:54:00','07:33:00','SJC','JFK',8,300,NULL),(1009,'2019-07-21','2019-07-21','10:05:00','12:50:00','ORD','SJC',9,240,NULL),(1010,'2019-07-18','2019-07-18','10:48:00','12:17:00','ONT','SFO',10,180,NULL),(1011,'2019-07-18','2019-07-19','22:27:00','08:21:00','OAK','SAN',1,1500,NULL),(1012,'2019-07-22','2019-07-22','12:51:00','19:20:00','SFO','MSY',2,2000,NULL),(1013,'2019-07-17','2019-07-18','23:55:00','05:06:00','SEA','MSP',3,3000,NULL),(1014,'2019-08-01','2019-08-02','21:55:00','06:27:00','SAN','JFK',4,970,NULL),(1015,'2019-07-17','2019-07-17','06:59:00','12:27:00','JFK','SJC',5,300,NULL),(1016,'2019-09-30','2019-09-30','19:05:00','20:33:00','MCI','LAX',6,540,NULL),(1017,'2019-10-13','2019-10-13','11:00:00','15:00:00','ABY','VLD',6,300,NULL),(1024,'2019-08-10','2019-08-10','12:00:00','14:00:00','SJC','SEA',1,350,NULL),(1026,'2019-08-13','2019-08-10','12:00:00','14:00:00','SJC','SEA',1,350,NULL),(1027,'2019-08-14','2019-08-10','12:00:00','14:00:00','SJC','SEA',1,350,NULL),(1029,'2019-08-11','2019-08-11','15:00:00','14:00:00','SJC','SEA',5,350,NULL),(1031,'2019-08-11','2019-08-11','19:00:00','23:00:00','SJC','SEA',7,350,'2019-07-20 22:17:24'),(1033,'2019-08-08','2019-08-08','19:00:00','13:00:00','SJC','SEA',7,350,'2019-07-20 22:37:00'),(1034,'2019-08-08','2019-08-08','19:00:00','21:00:00','SEA','SJC',7,350,'2019-07-20 22:38:50'),(1036,'2019-08-07','2019-08-07','12:00:00','14:00:00','SJC','SEA',1,350,'2019-07-21 00:10:16'),(1037,'2019-08-03','2019-08-03','12:00:00','14:00:00','SJC','SEA',1,350,'2019-07-21 02:05:42'),(1038,'2019-10-10','2019-10-10','18:05:00','23:20:00','SJC','VLD',10,500,'2019-07-21 02:17:55');
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
	if (new.depart_loc, new.destination) not in (select location1, location2 from distance) then
		insert into distance values(new.depart_loc, new.destination, null);
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airport` (
  `IATA_CODE` varchar(10) NOT NULL,
  `AIRPORT` varchar(100) NOT NULL,
  `CITY` varchar(45) NOT NULL,
  `STATE` varchar(45) NOT NULL,
  PRIMARY KEY (`IATA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('ABE','Lehigh Valley International Airport','Allentown','PA'),('ABI','Abilene Regional Airport','Abilene','TX'),('ABQ','Albuquerque International Sunport','Albuquerque','NM'),('ABR','Aberdeen Regional Airport','Aberdeen','SD'),('ABY','Southwest Georgia Regional Airport','Albany','GA'),('ACK','Nantucket Memorial Airport','Nantucket','MA'),('ACT','Waco Regional Airport','Waco','TX'),('ACV','Arcata Airport','Arcata/Eureka','CA'),('ACY','Atlantic City International Airport','Atlantic City','NJ'),('ADK','Adak Airport','Adak','AK'),('ADQ','Kodiak Airport','Kodiak','AK'),('AEX','Alexandria International Airport','Alexandria','LA'),('AGS','Augusta Regional Airport (Bush Field)','Augusta','GA'),('AKN','King Salmon Airport','King Salmon','AK'),('ALB','Albany International Airport','Albany','NY'),('ALO','Waterloo Regional Airport','Waterloo','IA'),('AMA','Rick Husband Amarillo International Airport','Amarillo','TX'),('ANC','Ted Stevens Anchorage International Airport','Anchorage','AK'),('APN','Alpena County Regional Airport','Alpena','MI'),('ASE','Aspen-Pitkin County Airport','Aspen','CO'),('ATL','Hartsfield-Jackson Atlanta International Airport','Atlanta','GA'),('ATW','Appleton International Airport','Appleton','WI'),('AUS','Austin-Bergstrom International Airport','Austin','TX'),('AVL','Asheville Regional Airport','Asheville','NC'),('AVP','Wilkes-Barre/Scranton International Airport','Wilkes-Barre/Scranton','PA'),('AZO','Kalamazoo/Battle Creek International Airport','Kalamazoo','MI'),('BDL','Bradley International Airport','Windsor Locks','CT'),('BET','Bethel Airport','Bethel','AK'),('BFL','Meadows Field','Bakersfield','CA'),('BGM','Greater Binghamton Airport','Binghamton','NY'),('BGR','Bangor International Airport','Bangor','ME'),('BHM','Birmingham-Shuttlesworth International Airport','Birmingham','AL'),('BIL','Billings Logan International Airport','Billings','MT'),('BIS','Bismarck Municipal Airport','Bismarck','ND'),('BJI','Bemidji Regional Airport','Bemidji','MN'),('BLI','Bellingham International Airport','Bellingham','WA'),('BMI','Central Illinois Regional Airport at Bloomington-Normal','Bloomington','IL'),('BNA','Nashville International Airport','Nashville','TN'),('BOI','Boise Airport (Boise Air Terminal)','Boise','ID'),('BOS','Gen. Edward Lawrence Logan International Airport','Boston','MA'),('BPT','Jack Brooks Regional Airport (Southeast Texas Regional)','Beaumont/Port Arthur','TX'),('BQK','Brunswick Golden Isles Airport','Brunswick','GA'),('BQN','Rafael Hernández Airport','Aguadilla','PR'),('BRD','Brainerd Lakes Regional Airport','Brainerd','MN'),('BRO','Brownsville/South Padre Island International Airport','Brownsville','TX'),('BRW','Wiley Post-Will Rogers Memorial Airport','Barrow','AK'),('BTM','Bert Mooney Airport','Butte','MT'),('BTR','Baton Rouge Metropolitan Airport','Baton Rouge','LA'),('BTV','Burlington International Airport','Burlington','VT'),('BUF','Buffalo Niagara International Airport','Buffalo','NY'),('BUR','Bob Hope Airport (Hollywood Burbank Airport)','Burbank','CA'),('BWI','Baltimore-Washington International Airport','Baltimore','MD'),('BZN','Bozeman Yellowstone International Airport (Gallatin Field Airport)','Bozeman','MT'),('CAE','Columbia Metropolitan Airport','Columbia','SC'),('CAK','Akron-Canton Regional Airport','Akron','OH'),('CDC','Cedar City Regional Airport','Cedar City','UT'),('CDV','Merle K. (Mudhole) Smith Airport','Cordova','AK'),('CEC','Del Norte County Airport (Jack McNamara Field)','Crescent City','CA'),('CHA','Chattanooga Metropolitan Airport (Lovell Field)','Chattanooga','TN'),('CHO','Charlottesville-Albemarle Airport','Charlottesville','VA'),('CHS','Charleston International Airport/Charleston AFB','Charleston','SC'),('CID','The Eastern Iowa Airport','Cedar Rapids','IA'),('CIU','Chippewa County International Airport','Sault Ste. Marie','MI'),('CLD','McClellan-Palomar Airport','San Diego','CA'),('CLE','Cleveland Hopkins International Airport','Cleveland','OH'),('CLL','Easterwood Airport','College Station','TX'),('CLT','Charlotte Douglas International Airport','Charlotte','NC'),('CMH','Port Columbus International Airport','Columbus','OH'),('CMI','University of Illinois - Willard Airport','Champaign/Urbana','IL'),('CMX','Houghton County Memorial Airport','Hancock','MI'),('CNY','Canyonlands Field','Moab','UT'),('COD','Yellowstone Regional Airport','Cody','WY'),('COS','City of Colorado Springs Municipal Airport','Colorado Springs','CO'),('COU','Columbia Regional Airport','Columbia','MO'),('CPR','Natrona County International Airport','Casper','WY'),('CRP','Corpus Christi International Airport','Corpus Christi','TX'),('CRW','Yeager Airport','Charleston','WV'),('CSG','Columbus Metropolitan Airport','Columbus','GA'),('CVG','Cincinnati/Northern Kentucky International Airport','Covington','KY'),('CWA','Central Wisconsin Airport','Mosinee','WI'),('DAB','Daytona Beach International Airport','Daytona Beach','FL'),('DAL','Dallas Love Field','Dallas','TX'),('DAY','James M. Cox Dayton International Airport','Dayton','OH'),('DBQ','Dubuque Regional Airport','Dubuque','IA'),('DCA','Ronald Reagan Washington National Airport','Arlington','VA'),('DEN','Denver International Airport','Denver','CO'),('DFW','Dallas/Fort Worth International Airport','Dallas-Fort Worth','TX'),('DHN','Dothan Regional Airport','Dothan','AL'),('DIK','Dickinson Theodore Roosevelt Regional Airport','Dickinson','ND'),('DLG','Dillingham Airport','Dillingham','AK'),('DLH','Duluth International Airport','Duluth','MN'),('DRO','Durango-La Plata County Airport','Durango','CO'),('DSM','Des Moines International Airport','Des Moines','IA'),('DTW','Detroit Metropolitan Airport','Detroit','MI'),('DVL','Devils Lake Regional Airport','Devils Lake','ND'),('EAU','Chippewa Valley Regional Airport','Eau Claire','WI'),('EGE','Eagle County Regional Airport','Eagle','CO'),('EKO','Elko Regional Airport','Elko','NV'),('ELM','Elmira/Corning Regional Airport','Elmira','NY'),('ELP','El Paso International Airport','El Paso','TX'),('ERI','Erie International Airport','Erie','PA'),('ESC','Delta County Airport','Escanaba','MI'),('EUG','Eugene Airport (Mahlon Sweet Field)','Eugene','OR'),('EVV','Evansville Regional Airport','Evansville','IN'),('EWN','Coastal Carolina Regional Airport (Craven County Regional)','New Bern','NC'),('EWR','Newark Liberty International Airport','Newark','NJ'),('EYW','Key West International Airport','Key West','FL'),('FAI','Fairbanks International Airport','Fairbanks','AK'),('FAR','Hector International Airport','Fargo','ND'),('FAT','Fresno Yosemite International Airport','Fresno','CA'),('FAY','Fayetteville Regional Airport','Fayetteville','NC'),('FCA','Glacier Park International Airport','Kalispell','MT'),('FLG','Flagstaff Pulliam Airport','Flagstaff','AZ'),('FLL','Fort Lauderdale-Hollywood International Airport','Ft. Lauderdale','FL'),('FNT','Bishop International Airport','Flint','MI'),('FSD','Sioux Falls Regional Airport','Sioux Falls','SD'),('FSM','Fort Smith Regional Airport','Fort Smith','AR'),('FWA','Fort Wayne International Airport','Fort Wayne','IN'),('GCC','Gillette-Campbell County Airport','Gillette','WY'),('GCK','Garden City Regional Airport','Garden City','KS'),('GEG','Spokane International Airport','Spokane','WA'),('GFK','Grand Forks International Airport','Grand Forks','ND'),('GGG','East Texas Regional Airport','Longview','TX'),('GJT','Grand Junction Regional Airport (Walker Field)','Grand Junction','CO'),('GNV','Gainesville Regional Airport','Gainesville','FL'),('GPT','Gulfport-Biloxi International Airport','Gulfport-Biloxi','MS'),('GRB','Green Bay-Austin Straubel International Airport','Green Bay','WI'),('GRI','Central Nebraska Regional Airport','Grand Island','NE'),('GRK','Killeen-Fort Hood Regional Airport','Killeen','TX'),('GRR','Gerald R. Ford International Airport','Grand Rapids','MI'),('GSO','Piedmont Triad International Airport','Greensboro','NC'),('GSP','Greenville-Spartanburg International Airport','Greer','SC'),('GST','Gustavus Airport','Gustavus','AK'),('GTF','Great Falls International Airport','Great Falls','MT'),('GTR','Golden Triangle Regional Airport','Columbus-Starkville-West Point','MS'),('GUC','Gunnison-Crested Butte Regional Airport','Gunnison','CO'),('GUM','Guam International Airport','Agana','GU'),('HDN','Yampa Valley Airport (Yampa Valley Regional)','Hayden','CO'),('HIB','Range Regional Airport (Chisholm-Hibbing Airport)','Hibbing','MN'),('HLN','Helena Regional Airport','Helena','MT'),('HNL','Honolulu International Airport','Honolulu','HI'),('HOB','Lea County Regional Airport','Hobbs','NM'),('HOU','William P. Hobby Airport','Houston','TX'),('HPN','Westchester County Airport','White Plains','NY'),('HRL','Valley International Airport','Harlingen','TX'),('HSV','Huntsville International Airport','Huntsville','AL'),('HYA','Barnstable Municipal Airport','Hyannis','MA'),('HYS','Hays Regional Airport','Hays','KS'),('IAD','Washington Dulles International Airport','Chantilly','VA'),('IAG','Niagara Falls International Airport','Niagara Falls','NY'),('IAH','George Bush Intercontinental Airport','Houston','TX'),('ICT','Wichita Dwight D. Eisenhower National Airport (Wichita Mid-Continent Airport)','Wichita','KS'),('IDA','Idaho Falls Regional Airport','Idaho Falls','ID'),('ILG','Wilmington Airport','Wilmington','DE'),('ILM','Wilmington International Airport','Wilmington','NC'),('IMT','Ford Airport','Iron Mountain/Kingsford','MI'),('IND','Indianapolis International Airport','Indianapolis','IN'),('INL','Falls International Airport','International Falls','MN'),('ISN','Sloulin Field International Airport','Williston','ND'),('ISP','Long Island MacArthur Airport','Islip','NY'),('ITH','Ithaca Tompkins Regional Airport','Ithaca','NY'),('ITO','Hilo International Airport','Hilo','HI'),('JAC','Jackson Hole Airport','Jackson','WY'),('JAN','Jackson-Evers International Airport','Jackson','MS'),('JAX','Jacksonville International Airport','Jacksonville','FL'),('JFK','John F. Kennedy International Airport (New York International Airport)','New York','NY'),('JLN','Joplin Regional Airport','Joplin','MO'),('JMS','Jamestown Regional Airport','Jamestown','ND'),('JNU','Juneau International Airport','Juneau','AK'),('KOA','Kona International Airport at Keahole','Kailua/Kona','HI'),('KTN','Ketchikan International Airport','Ketchikan','AK'),('LAN','Capital Region International Airport ( Lansing Capital City)','Lansing','MI'),('LAR','Laramie Regional Airport','Laramie','WY'),('LAS','McCarran International Airport','Las Vegas','NV'),('LAW','Lawton-Fort Sill Regional Airport','Lawton','OK'),('LAX','Los Angeles International Airport','Los Angeles','CA'),('LBB','Lubbock Preston Smith International Airport','Lubbock','TX'),('LBE','Arnold Palmer Regional Airport','Latrobe','PA'),('LCH','Lake Charles Regional Airport','Lake Charles','LA'),('LEX','Blue Grass Airport','Lexington','KY'),('LFT','Lafayette Regional Airport','Lafayette','LA'),('LGA','LaGuardia Airport (Marine Air Terminal)','New York','NY'),('LGB','Long Beach Airport (Daugherty Field)','Long Beach','CA'),('LIH','Lihue Airport','Lihue','HI'),('LIT','Bill and Hillary Clinton National Airport (Adams Field)','Little Rock','AR'),('LNK','Lincoln Airport (Lincoln Municipal)','Lincoln','NE'),('LRD','Laredo International Airport','Laredo','TX'),('LSE','La Crosse Regional Airport','La Crosse','WI'),('LWS','Lewiston-Nez Perce County Airport','Lewiston','ID'),('MAF','Midland International Airport','Midland','TX'),('MBS','MBS International Airport','Saginaw','MI'),('MCI','Kansas City International Airport','Kansas City','MO'),('MCO','Orlando International Airport','Orlando','FL'),('MDT','Harrisburg International Airport','Harrisburg','PA'),('MDW','Chicago Midway International Airport','Chicago','IL'),('MEI','Meridian Regional Airport','Meridian','MS'),('MEM','Memphis International Airport','Memphis','TN'),('MFE','McAllen-Miller International Airport (McAllen Miller International)','McAllen','TX'),('MFR','Rogue Valley International Airport','Medford','OR'),('MGM','Montgomery Regional Airport','Montgomery','AL'),('MHK','Manhattan Regional Airport','Manhattan','KS'),('MHT','Manchester-Boston Regional Airport','Manchester','NH'),('MIA','Miami International Airport','Miami','FL'),('MKE','General Mitchell International Airport','Milwaukee','WI'),('MKG','Muskegon County Airport','Muskegon','MI'),('MLB','Melbourne International Airport','Melbourne','FL'),('MLI','Quad City International Airport','Moline','IL'),('MLU','Monroe Regional Airport','Monroe','LA'),('MMH','Mammoth Yosemite Airport','Mammoth Lakes','CA'),('MOB','Mobile Regional Airport','Mobile','AL'),('MOT','Minot International Airport','Minot','ND'),('MQT','Sawyer International Airport','Marquette','MI'),('MRY','Monterey Regional Airport (Monterey Peninsula Airport)','Monterey','CA'),('MSN','Dane County Regional Airport','Madison','WI'),('MSO','Missoula International Airport','Missoula','MT'),('MSP','Minneapolis-Saint Paul International Airport','Minneapolis','MN'),('MSY','Louis Armstrong New Orleans International Airport','New Orleans','LA'),('MTJ','Montrose Regional Airport','Montrose','CO'),('MVY','Martha\'s Vineyard Airport','Marthas Vineyard','MA'),('MYR','Myrtle Beach International Airport','Myrtle Beach','SC'),('OAJ','Albert J. Ellis Airport','Jacksonville','NC'),('OAK','Oakland International Airport','Oakland','CA'),('OGG','Kahului Airport','Kahului','HI'),('OKC','Will Rogers World Airport','Oklahoma City','OK'),('OMA','Eppley Airfield','Omaha','NE'),('OME','Nome Airport','Nome','AK'),('ONT','Ontario International Airport','Ontario','CA'),('ORD','Chicago O\'Hare International Airport','Chicago','IL'),('ORF','Norfolk International Airport','Norfolk','VA'),('ORH','Worcester Regional Airport','Worcester','MA'),('OTH','Southwest Oregon Regional Airport (North Bend Municipal)','North Bend','OR'),('OTZ','Ralph Wien Memorial Airport','Kotzebue','AK'),('PAH','Barkley Regional Airport','Paducah','KY'),('PBI','Palm Beach International Airport','West Palm Beach','FL'),('PDX','Portland International Airport','Portland','OR'),('PHF','Newport News/Williamsburg International Airport','Newport News','VA'),('PHL','Philadelphia International Airport','Philadelphia','PA'),('PHX','Phoenix Sky Harbor International Airport','Phoenix','AZ'),('PIA','General Wayne A. Downing Peoria International Airport','Peoria','IL'),('PIB','Hattiesburg-Laurel Regional Airport','Hattiesburg-Laurel','MS'),('PIH','Pocatello Regional Airport','Pocatello','ID'),('PIT','Pittsburgh International Airport','Pittsburgh','PA'),('PLN','Pellston Regional Airport of Emmet County','Pellston','MI'),('PNS','Pensacola International Airport (Pensacola Gulf Coast Regional Airport)','Pensacola','FL'),('PPG','Pago Pago International Airport (Tafuna Airport)','Pago Pago','AS'),('PSC','Tri-Cities Airport','Pasco','WA'),('PSE','Mercedita Airport','Ponce','PR'),('PSG','Petersburg James A. Johnson Airport','Petersburg','AK'),('PSP','Palm Springs International Airport','Palm Springs','CA'),('PUB','Pueblo Memorial Airport','Pueblo','CO'),('PVD','Theodore Francis Green State Airport','Providence','RI'),('PWM','Portland International Jetport','Portland','ME'),('RAP','Rapid City Regional Airport','Rapid City','SD'),('RDD','Redding Municipal Airport','Redding','CA'),('RDM','Redmond Municipal Airport (Roberts Field)','Redmond','OR'),('RDU','Raleigh-Durham International Airport','Raleigh','NC'),('RHI','Rhinelander-Oneida County Airport','Rhinelander','WI'),('RIC','Richmond International Airport','Richmond','VA'),('RKS','Rock Springs-Sweetwater County Airport','Rock Springs','WY'),('RNO','Reno/Tahoe International Airport','Reno','NV'),('ROA','Roanoke Regional Airport (Woodrum Field)','Roanoke','VA'),('ROC','Greater Rochester International Airport','Rochester','NY'),('ROW','Roswell International Air Center','Roswell','NM'),('RST','Rochester International Airport','Rochester','MN'),('RSW','Southwest Florida International Airport','Ft. Myers','FL'),('SAF','Santa Fe Municipal Airport','Santa Fe','NM'),('SAN','San Diego International Airport (Lindbergh Field)','San Diego','CA'),('SAT','San Antonio International Airport','San Antonio','TX'),('SAV','Savannah/Hilton Head International Airport','Savannah','GA'),('SBA','Santa Barbara Municipal Airport (Santa Barbara Airport)','Santa Barbara','CA'),('SBN','South Bend International Airport (South Bend Regional)','South Bend','IN'),('SBP','San Luis Obispo County Regional Airport (McChesney Field)','San Luis Obispo','CA'),('SCC','Deadhorse Airport (Prudhoe Bay Airport)','Deadhorse','AK'),('SCE','University Park Airport','State College','PA'),('SDF','Louisville International Airport (Standiford Field)','Louisville','KY'),('SEA','Seattle-Tacoma International Airport','Seattle','WA'),('SFO','San Francisco International Airport','San Francisco','CA'),('SGF','Springfield-Branson National Airport','Springfield','MO'),('SGU','St. George Regional Airport','St George','UT'),('SHV','Shreveport Regional Airport','Shreveport','LA'),('SIT','Sitka Rocky Gutierrez Airport','Sitka','AK'),('SJC','Norman Y. Mineta San José International Airport','San Jose','CA'),('SJT','San Angelo Regional Airport (Mathis Field)','San Angelo','TX'),('SJU','Luis Muñoz Marín International Airport','San Juan','PR'),('SLC','Salt Lake City International Airport','Salt Lake City','UT'),('SMF','Sacramento International Airport','Sacramento','CA'),('SMX','Santa Maria Public Airport (Capt G. Allan Hancock Field)','Santa Maria','CA'),('SNA','John Wayne Airport (Orange County Airport)','Santa Ana','CA'),('SPI','Abraham Lincoln Capital Airport','Springfield','IL'),('SPS','Wichita Falls Municipal Airport/Sheppard AFB','Wichita Falls','TX'),('SRQ','Sarasota-Bradenton International Airport','Sarasota','FL'),('STC','St. Cloud Regional Airport','St Cloud','MN'),('STL','St. Louis International Airport at Lambert Field','St Louis','MO'),('STT','Cyril E. King Airport','Charlotte Amalie','VI'),('STX','Henry E. Rohlsen Airport','Christiansted','VI'),('SUN','Friedman Memorial Airport','Hailey','ID'),('SUX','Sioux Gateway Airport','Sioux City','IA'),('SWF','Stewart International Airport','Newburgh','NY'),('SYR','Syracuse Hancock International Airport','Syracuse','NY'),('TLH','Tallahassee International Airport','Tallahassee','FL'),('TOL','Toledo Express Airport','Toledo','OH'),('TPA','Tampa International Airport','Tampa','FL'),('TRI','Tri-Cities Regional Airport','Bristol','TN'),('TTN','Trenton Mercer Airport','Trenton','NJ'),('TUL','Tulsa International Airport','Tulsa','OK'),('TUS','Tucson International Airport','Tucson','AZ'),('TVC','Cherry Capital Airport','Traverse City','MI'),('TWF','Magic Valley Regional Airport (Joslin Field)','Twin Falls','ID'),('TXK','Texarkana Regional Airport (Webb Field)','Texarkana','AR'),('TYR','Tyler Pounds Regional Airport','Tyler','TX'),('TYS','McGhee Tyson Airport','Knoxville','TN'),('VEL','Valdez Airport','Vernal','UT'),('VLD','Valdosta Regional Airport','Valdosta','GA'),('VPS','Destin-Fort Walton Beach Airport/Eglin AFB','Valparaiso','FL'),('WRG','Wrangell Airport','Wrangell','AK'),('WYS','Westerly State Airport','West Yellowstone','MT'),('XNA','Northwest Arkansas Regional Airport','Fayetteville/Springdale/Rogers','AR'),('YAK','Yakutat Airport','Yakutat','AK'),('YUM','Yuma International Airport','Yuma','AZ');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  CONSTRAINT `flight_id` FOREIGN KEY (`flight_id`) REFERENCES `airline` (`flight_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1005,1005,400,NULL),(2,1005,1005,400,NULL),(4,1003,1001,200,NULL),(6,1005,1012,1950,NULL),(8,1004,1007,550,NULL),(9,1003,1006,170,'2019-07-21 00:09:05'),(10,1002,1036,350,'2019-07-21 02:12:49'),(11,1000,1037,350,'2019-07-21 02:13:52'),(12,1001,1036,350,'2019-07-21 02:14:08'),(14,1003,1033,350,'2019-07-21 02:14:20'),(15,1002,1008,300,'2019-07-21 02:16:12'),(16,1003,1008,300,'2019-07-21 02:16:17'),(18,1004,1038,500,'2019-07-21 02:18:20');
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
	if new.payment > 1000 then
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `custom_id` int(11) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(64) NOT NULL,
  `cc` bigint(20) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,'a123','John','1234567899','johnsmith@gmail.com',1234123456785680,'Smith'),(1001,'apple44','Jill','9987654321','jillsmith@gmail.com',4567879354123460,'Smith'),(1002,'q12345','Nick','4325679806','nickduncan@gmail.com',7859123456459090,'Duncan'),(1003,'turtle23','Karen','5678767623','karenallen@gmail.com',8876123245789930,'Allen'),(1004,'mypassword','Jonah','5379888922','jonahyoung@gmail.com',3674675912347660,'Young'),(1005,'q975633123123','Hillary','6479871092','hillaryhanson123@gmail.com',9145835732978470,'Hanson');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `distance` (
  `location1` varchar(10) NOT NULL,
  `location2` varchar(10) NOT NULL,
  `distance` int(10) DEFAULT NULL,
  PRIMARY KEY (`location1`,`location2`),
  KEY `location2_idx` (`location2`),
  CONSTRAINT `location1` FOREIGN KEY (`location1`) REFERENCES `airport` (`IATA_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location2` FOREIGN KEY (`location2`) REFERENCES `airport` (`IATA_CODE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES ('ABY','VLD',90),('JFK','SJC',2564),('LAX','DFW',1233),('MCI','LAX',1361),('MIA','LAX',2340),('MSP','SAN',1531),('OAK','SAN',445),('ONT','SFO',364),('ORD','SJC',1825),('PDX','LGB',847),('SAN','JFK',2581),('SEA','DTW',1922),('SEA','MIA',2722),('SEA','MSP',1395),('SEA','SJC',NULL),('SFO','CMH',2117),('SFO','MSY',1909),('SJC','JFK',2564),('SJC','SEA',NULL),('SJC','VLD',NULL);
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AIRLINES'
--
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
        (select price from airline where n_flight_id=flight_id),
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
	select * from airline order by price limit top_n;
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
        in n_plane_id	int(10),
        in n_price int(10)
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
        price,
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
        n_price,
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
	select flight_id from airline A1 where exists (select * from airline A2 where 
	A1.depart_time = A2.depart_time and A1.depart_loc=A2.depart_loc and A1.depart_date <> A2.depart_date);
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
	in n_plane_id	int(10),
	in n_price int(10)
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
    price = n_price,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-20 20:56:38
