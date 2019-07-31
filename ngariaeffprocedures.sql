-- ADMIN: users who made a payment
DROP PROCEDURE IF EXISTS userPayment;
DELIMITER //
CREATE PROCEDURE userPayment ()
BEGIN
	SELECT custom_id FROM customer, booking
    WHERE customer.custom_id = booking.custom_id GROUP BY custom_id HAVING booking.payment > 0;
END //
DELIMITER ;

-- ADMIN: all users in database along with all users that are in booking
DROP PROCEDURE IF EXISTS userBooked;
DELIMITER //
CREATE PROCEDURE userBooked ()
BEGIN
	SELECT custom_id AS CustomerID FROM customer
    UNION ALL
    SELECT custom_id AS BookingID FROM booking;
END //
DELIMITER ;