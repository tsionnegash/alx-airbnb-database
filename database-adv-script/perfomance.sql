-- SQL query that retrieves all bookings along with the user details, property details, and payment details. This query uses JOIN operations to fetch data from the Booking, User, Property, and Payment tables:
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    u.phone_number AS user_phone_number,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight AS property_price_per_night,
    p.description AS property_description,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date AS payment_date,
    pay.payment_method AS payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.booking_id;
