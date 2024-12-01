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
    AND b.status = 'confirmed'  -- Example: Only confirmed bookings
JOIN 
    Property p ON b.property_id = p.property_id
    AND p.pricepernight > 50  -- Example: Only properties with price greater than 50
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
    AND pay.payment_method = 'credit_card'  -- Example: Only include payments made by credit card
ORDER BY 
    b.booking_id;



-- ### 3. **Refactoring the Query for Better Performance**

-- #### **Adding Indexes**:
-- Create indexes on the columns that are frequently used in `JOIN`, `WHERE`, or `ORDER BY` clauses.

 on user_id in the Booking table for faster JOIN with User table
    CREATE INDEX idx_booking_user_id ON Booking(user_id);

    -- Index on property_id in the Booking table for faster JOIN with Property table
    CREATE INDEX idx_booking_property_id ON Booking(property_id);

    -- Index on booking_id in the Payment table for faster JOIN with Booking table
    CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

    -- Index on booking_id in the Booking table for ordering by booking_id
    CREATE INDEX idx_booking_id ON Booking(booking_id);
    ```



-- ### 4. **EXPLAIN After Refactoring**:

-- After refactoring the query and creating appropriate indexes, run `EXPLAIN` again to verify improvements:

EXPLAIN SELECT 
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
INNER JOIN 
    Payment pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.booking_id;
