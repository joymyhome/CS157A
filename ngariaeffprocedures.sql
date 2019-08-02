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

-- ADMIN: all users in database along with all users that are in booking
DROP PROCEDURE IF EXISTS userBooked;
DELIMITER //
CREATE PROCEDURE userBooked()
BEGIN
	SELECT custom_id AS CustomerID FROM customer
    UNION ALL
    SELECT custom_id AS BookingID FROM booking;
END //
DELIMITER ;