# stored procedure for user booking a flight
Drop procedure if exists `booking_flight`;
delimiter //
create procedure `booking_flight`(
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
end//
delimiter ;

call booking_flight(1003, 1006);



# cheapest n flight
drop procedure if exists `cheapest_n_flight`;
delimiter //
create procedure cheapest_n_flight(
in top_n int)
begin
	select * from airline order by price limit top_n;
end//
delimiter ;

call cheapest_n_flight(5);



# Check current available seats of a certain flight
Drop procedure if exists `check_available_seats`;
delimiter //
create procedure check_available_seats(
	in flightNumber int(10),
    out available_seats int)
begin
	select totalseats.seats - soldseats.seats into available_seats from
		(select seats from airline, airplane where airplane.plane_id=airline.plane_id and flight_id=flightNumber) as totalseats,
		(select count(*) as sbooking_flighteats from booking where booking.flight_id=flightNumber) as soldseats;
end//
delimiter ;

call check_available_seats(1001, @seats);
select @seats;





# stored procedure for adding new airline
Drop procedure if exists `insert_airlines_schedule`;
delimiter //
CREATE PROCEDURE `insert_airlines_schedule`(
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
end//
delimiter ;

call insert_airlines_schedule("2019-8-3","2019-8-3","12:00:00","14:00:00","SJC","SEA",1,350);




# check most popular flight
drop procedure if exists `most_popular_flight`;
delimiter //
create procedure most_popular_flight(
	out most_popular_flight_id int(10),
    out sold_tickets int)
begin
	select flight_id into most_popular_flight_id from (select flight_id , count(*) as tickets from booking group by flight_id order by tickets desc limit 1) TB;
    select tickets into sold_tickets from (select flight_id , count(*) as tickets from booking group by flight_id order by tickets desc limit 1) TB;
end//
delimiter ;

call most_popular_flight(@flight, @ticket);
select @flight;






# List all flights has been scheduled for the same depart_loc and same depart_time but with different depart_date.
drop procedure if exists `same_time_flight`
delimiter //
create procedure same_time_flight()
begin
	select flight_id from airline A1 where exists (select * from airline A2 where 
	A1.depart_time = A2.depart_time and A1.depart_loc=A2.depart_loc and A1.depart_date <> A2.depart_date);
end//
delimiter ;

call same_time_flight();





# top 2 destination for users who leave from the same place
drop procedure if exists `top_2_destination`;
delimiter //

create procedure top_2_destination(
	in n_depart_loc varchar(10))
begin
	select destination, count(*) from (select booking.custom_id, airline.destination 
	from booking, airline where booking.flight_id=airline.flight_id and airline.depart_loc=n_depart_loc) TB 
    group by destination order by count(*) desc limit 2;
end//
delimiter ;

call top_2_destination("SEA");





# return customers who have registered but not yet booked.
drop procedure if exists `unbooked_customers`;
delimiter //
create procedure unbooked_customers()
begin
	select customer.custom_id from customer left join booking on customer.custom_id=booking.custom_id where ticket_id is null;
end//
delimiter ;

call unbooked_customers();







# update airline information
drop procedure if exists `update_airline`;
delimiter //
create procedure update_airline(
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
end//
delimiter ;

call update_airline(1001, "2019-07-15", "2019-07-15", "10:52:00", "18:30:00", "SFO", "CMH", 1, 300);






# update customer information
drop procedure if exists `update_customer`
delimiter //
create procedure update_customer(
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
end //
delimiter ;

call update_customer(1005, "Hillary", "Hanson", "q975633123123", "hillaryhanson123@gmail.com",
"6479871092", 9145835732978470);