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

-- ADMIN: users who are booked
DROP PROCEDURE IF EXISTS userBooked;
DELIMITER //
CREATE PROCEDURE userBooked()
BEGIN
	SELECT customer.custom_id FROM customer WHERE customer.custom_id IN (
	SELECT customer.custom_id FROM customer, booking WHERE customer.custom_id = booking.custom_id
    UNION
    SELECT booking.custom_id FROM customer, booking WHERE customer.custom_id = booking.custom_id);
END //
DELIMITER ;
