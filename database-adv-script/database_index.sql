-- 2. SQL CREATE INDEX Commands

-- Create index on user_id in the User table for faster JOIN operations
CREATE INDEX idx_user_id ON User(user_id);

-- Create index on email in the User table for faster lookups by email
CREATE INDEX idx_user_email ON User(email);

-- Create index on booking_id in the Booking table for faster JOIN operations
CREATE INDEX idx_booking_id ON Booking(booking_id);

-- Create index on user_id in the Booking table for faster lookup of all bookings by a specific user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on property_id in the Booking table for faster lookup of all bookings for a specific property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on status in the Booking table for faster filtering by booking status
CREATE INDEX idx_booking_status ON Booking(status);

-- Create index on start_date and end_date in the Booking table for faster range queries and sorting by date
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Create index on property_id in the Property table for faster JOIN operations with Booking and Review tables
CREATE INDEX idx_property_id ON Property(property_id);

-- Create index on host_id in the Property table for faster lookup of all properties owned by a host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Create index on pricepernight in the Property table for faster sorting and filtering by price
CREATE INDEX idx_property_price ON Property(pricepernight);


-- 3. Measure Query Performance Before and After Adding Indexes Using EXPLAIN or ANALYZE;


EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';

EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';

