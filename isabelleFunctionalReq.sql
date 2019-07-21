-- adds user info to customer
DROP PROCEDURE IF EXISTS addUser;
DELIMITER //
CREATE PROCEDURE addUser(
IN custID_in int(11),
IN pass_in varchar(64),
IN firstName_in varchar(64),
IN phone_in char(10),
IN email_in varchar(64),
IN cc_in bigint(20),
IN lastName_in varchar(64))
BEGIN
	INSERT INTO customer(custom_id, password, firstname, phone, email, cc, lastname ) VALUES(custID_in, pass_in, firstName_in, phone_in, email_in, cc_in, lastName_in);
END //
DELIMITER ;

-- displays available flights to customers
DROP PROCEDURE IF EXISTS searchAvailFlights;
DELIMITER //
CREATE PROCEDURE searchAvailFlights(
IN departLoc_in varchar(10),
IN dest_in varchar(10),
IN departDate DATE)
BEGIN
	SELECT depart_date, arrival_date, depart_time, arrival_time, depart_loc, destination, price
    FROM airline, airplane
    WHERE airline.plane_id = airplane.plane_id AND depart_loc = departLoc_in AND destination = dest_in AND seats > 0;
END //
DELIMITER ;

-- updates customer info
DROP PROCEDURE IF EXISTS updateCustInfo;
DELIMITER //
CREATE PROCEDURE updateCustInfo ()
BEGIN
END //
DELIMITER ;

-- displays reservations to customers
DROP PROCEDURE IF EXISTS viewReservation;
DELIMITER //
CREATE PROCEDURE viewReservation (
IN custID_in int(11),
IN pass_in varchar(64))
BEGIN 
	SELECT ticket_id, flight_id
    FROM booking, customer
    WHERE custID_in = booking.custom_id AND booking.custom_id = customer.custom_id;
END //
DELIMITER ;

-- cancels reservation
DROP PROCEDURE IF EXISTS cancelReservation;
DELIMITER //
CREATE PROCEDURE cancelReservation (
IN custID_in int(11),
IN ticketID_in int(20))
BEGIN
	DELETE FROM booking
    WHERE custom_id = custID_in AND ticket_id = ticketID_in;
END //
DELIMITER ;

-- cancels reservation
DROP PROCEDURE IF EXISTS cancelReservation;
DELIMITER //
CREATE PROCEDURE cancelReservation (
IN custID_in int(11),
IN ticketID_in int(20))
BEGIN
	DELETE FROM booking
    WHERE custom_id = custID_in AND ticket_id = ticketID_in;
END //
DELIMITER ;

-- ADMIN: deletes flight
DROP PROCEDURE IF EXISTS deleteFlight;
DELIMITER //
CREATE PROCEDURE deleteFlight (
IN flightID_in int(10))
BEGIN
	DELETE FROM airline
    WHERE flight_id = flightID_in;
END //
DELIMITER ;

-- TRIGGER: Updates booking table given deleted flight
DROP TRIGGER IF EXISTS deleteBooking;
DELIMITER //
CREATE TRIGGER deleteBooking
AFTER DELETE ON airline
FOR EACH ROW
BEGIN
  DELETE FROM booking
  WHERE flight_id = airline.OLD.flight_id;
END;//
DELIMITER ;



