
-- ### 1. **Query to find the total number of bookings made by each user using the COUNT function and GROUP BY clause:**

SELECT 
    b.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
GROUP BY 
    b.user_id, u.first_name, u.last_name, u.email;

-- ### 2. **Query to rank properties based on the total number of bookings they have received using a window function (ROW_NUMBER, RANK):**

SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location,
    p.pricepernight,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS RANK
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.description, p.location, p.pricepernight
ORDER BY 
    RANK;
