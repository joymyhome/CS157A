-- ADMIN: users who are above the average amount paid
DROP PROCEDURE IF EXISTS userPayment;
DELIMITER //
CREATE PROCEDURE userPayment ()
BEGIN
	SELECT customer.custom_id, booking.payment FROM customer, booking
    WHERE customer.custom_id = booking.custom_id GROUP BY customer.custom_id, booking.payment 
    HAVING booking.payment > (SELECT AVG(payment) FROM booking);
END //
DELIMITER ;

-- ADMIN: users who booked flight1 and flight2
DROP PROCEDURE IF EXISTS userBooked;
DELIMITER //
CREATE PROCEDURE userBooked(in flightid1 int(10), in flightid2 int(10))
BEGIN
	SELECT customer.custom_id FROM customer WHERE customer.custom_id IN (
	SELECT booking.custom_id FROM booking WHERE booking.flight_id = flightid1
    UNION
    SELECT booking.custom_id FROM booking WHERE booking.flight_id = flightid2);
END //
DELIMITER ;
