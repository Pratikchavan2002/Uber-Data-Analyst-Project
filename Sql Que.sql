create database uber;
use uber;


#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        booking_status = 'completed';

SELECT 
    *
FROM
    Successful_Bookings;


#2. Find the average ride distance for each vehicle type:

CREATE VIEW Avg_Ride_Distance_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS avg_distance
    FROM
        bookings
    GROUP BY Vehicle_Type;

SELECT 
    *
FROM
    Avg_Ride_Distance_each_vehicle; 


#3. Get the total number of cancelled rides by customers:

CREATE VIEW total_number_of_cancelled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Booking_Status = 'Cancelled Rides by Customer';

select * from total_number_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:


CREATE VIEW top_5_customers AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS total_rides
    FROM
        bookings
    GROUP BY Customer_ID
    ORDER BY total_rides DESC
    LIMIT 5;

SELECT 
    *
FROM
    top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Cancelled_Rides_Personal_and_Car_related_issue AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Cancelled_Rides_by_Driver = 'Personal & Car related issue';

SELECT 
    *
FROM
    Cancelled_Rides_Personal_and_Car_related_issue;



#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW max_and_min_driver_rating AS
    SELECT 
        MAX(Driver_Ratings) AS max_ratings,
        MIN(Driver_Ratings) AS min_rating
    FROM
        bookings
    WHERE
        Vehicle_Type = 'Prime Sedan';

SELECT 
    *
FROM
    max_and_min_driver_rating;



#8. Find the average customer rating per vehicle type:

CREATE VIEW avg_customer_rating AS
    SELECT 
        Vehicle_Type, AVG(Customer_Ratings) AS avg_customer_rating
    FROM
        bookings
    GROUP BY Vehicle_Type;

SELECT 
    *
FROM
    avg_customer_rating;


#9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Completed_Booking AS
    SELECT 
        SUM(Booking_Value) AS total_successful_value
    FROM
        bookings
    WHERE
        Booking_Status = 'Completed';

SELECT 
    *
FROM
    Completed_Booking;



#10. List all incomplete rides along with the reason:

CREATE VIEW incomplete_ride_reeason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        bookings
    WHERE
        Incomplete_Rides = 'yes';

SELECT 
    *
FROM
    incomplete_ride_reeason; 