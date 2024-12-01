### 1. **Identify High-Usage Columns in User, Booking, and Property Tables**

In order to optimize the performance of queries, it’s important to identify which columns are frequently used in operations like `WHERE`, `JOIN`, and `ORDER BY`. These columns are candidates for indexing.

Here are the high-usage columns for each table based on typical use cases:

- **User Table**:
  - `user_id`: Frequently used in `JOIN` operations (e.g., joining with `Booking` or `Review`).
  - `email`: Often used in `WHERE` clauses for user lookups or login processes.

- **Booking Table**:
  - `booking_id`: Frequently used in `JOIN` operations (e.g., with `Payment` or `Property`).
  - `user_id`: Used to find all bookings made by a specific user.
  - `property_id`: Used to find all bookings for a specific property.
  - `status`: Frequently used in `WHERE` clauses to filter booking statuses (e.g., confirmed, pending, canceled).
  - `start_date` and `end_date`: Often used for range queries or sorting bookings by date.

- **Property Table**:
  - `property_id`: Frequently used in `JOIN` operations (e.g., with `Booking` or `Review`).
  - `host_id`: Used to find all properties owned by a specific user (host).
  - `pricepernight`: Frequently used in `ORDER BY` or filtering queries for price-based searches.

---

### 2. **SQL CREATE INDEX Commands**

Based on the identified high-usage columns, here are the recommended SQL `CREATE INDEX` commands to optimize query performance:

```sql
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
```

---

### 3. **Measure Query Performance Before and After Adding Indexes Using EXPLAIN or ANALYZE**

To measure the query performance before and after adding indexes, you can use the `EXPLAIN` or `ANALYZE` command (depending on your database system).

#### **Before Adding Indexes**:
Run your queries with the `EXPLAIN` or `ANALYZE` command to analyze the execution plan and see the current performance.

Example:
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
```

This will provide information about how the query is executed, including the type of scan used (e.g., full table scan or index scan), the number of rows examined, and the cost of the query.

#### **After Adding Indexes**:
After creating the indexes, re-run the same query with `EXPLAIN` or `ANALYZE` to see if the database uses the indexes to optimize query performance.

Example:
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
```

The output should now show an **Index Scan** instead of a **Seq Scan** (sequential scan), indicating that the index is being used to speed up the query. Also, you should see a reduction in the number of rows examined and a decrease in the query cost, indicating better performance.

### Conclusion:

By creating indexes on frequently used columns, the database can optimize queries, especially those involving `JOIN`, `WHERE`, and `ORDER BY` clauses. The use of `EXPLAIN` or `ANALYZE` helps compare performance before and after the indexing process, allowing you to measure the effectiveness of the changes.

