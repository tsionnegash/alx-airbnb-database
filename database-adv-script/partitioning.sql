-- ### Step 1: Implement Partitioning on the `Booking` Table Based on the `start_date` Column

-- Partitioning the `Booking` table by `start_date` allows the database to divide the table into smaller, more manageable chunks (partitions), which can improve query performance, particularly for queries that filter on the `start_date`. Here's how you can implement partitioning:

-- #### `partitioning.sql`:

-- ```sql
-- -- Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (start_date >= '2000-01-01')  -- Optional: Adding a date range check
) 
PARTITION BY RANGE (start_date);

-- Create partitions for each year (this is just an example, adjust as needed)
CREATE TABLE Booking_2020 PARTITION OF Booking
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
    
CREATE TABLE Booking_2021 PARTITION OF Booking
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');
    
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
    
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
    
-- You can add more partitions for future years as necessary

-- Indexing the partitions (if needed for performance on commonly used columns)
CREATE INDEX idx_booking_start_date_2020 ON Booking_2020(start_date);
CREATE INDEX idx_booking_start_date_2021 ON Booking_2021(start_date);
CREATE INDEX idx_booking_start_date_2022 ON Booking_2022(start_date);
CREATE INDEX idx_booking_start_date_2023 ON Booking_2023(start_date);
```


-- ### Step 2: Test the Performance of Queries on the Partitioned Table

-- After partitioning the table, run a sample query that fetches bookings within a specific date range and compare the performance before and after partitioning.

-- #### Sample Query (Fetching Bookings by Date Range):

-- Query to fetch bookings in 2022
EXPLAIN ANALYZE
SELECT 
    booking_id,
    start_date,
    end_date,
    total_price,
    status
FROM 
    Booking
WHERE 
    start_date BETWEEN '2022-01-01' AND '2022-12-31';
```

-- ### Step 3: Measure Query Performance

Run the `EXPLAIN ANALYZE` command on the query before and after partitioning to measure the performance improvements. Here's what you should look for:
