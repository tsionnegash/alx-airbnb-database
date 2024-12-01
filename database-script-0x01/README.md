---

# **Database Schema README**

## **Overview**
This database schema is designed for a booking platform where users can create accounts, make bookings for properties, leave reviews, and send messages. The schema consists of six main entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

The goal is to store and manage data related to users, properties, bookings, payments, reviews, and messaging.

---

## **Tables and Relationships**

### **1. User Table**

- **Purpose**: Stores user information.
- **Primary Key**: `user_id` (UUID)
- **Attributes**:
  - `first_name`: User's first name.
  - `last_name`: User's last name.
  - `email`: User's unique email address.
  - `password_hash`: Encrypted password for authentication.
  - `phone_number`: Optional phone number.
  - `role`: User's role (guest, host, admin).
  - `created_at`: Timestamp of user account creation.

### **2. Property Table**

- **Purpose**: Stores details about properties listed by hosts.
- **Primary Key**: `property_id` (UUID)
- **Foreign Key**: `host_id` (references `User(user_id)`)
- **Attributes**:
  - `name`: Property name.
  - `description`: Description of the property.
  - `location`: Property location.
  - `pricepernight`: Price per night for booking.
  - `created_at`: Timestamp of property listing.
  - `updated_at`: Timestamp of the last property update.

### **3. Booking Table**

- **Purpose**: Records the bookings made by users for properties.
- **Primary Key**: `booking_id` (UUID)
- **Foreign Keys**:
  - `property_id` (references `Property(property_id)`)
  - `user_id` (references `User(user_id)`)
- **Attributes**:
  - `start_date`: Start date of the booking.
  - `end_date`: End date of the booking.
  - `total_price`: Total price for the booking.
  - `status`: Booking status (pending, confirmed, canceled).
  - `created_at`: Timestamp when the booking was made.

### **4. Payment Table**

- **Purpose**: Stores payment information for bookings.
- **Primary Key**: `payment_id` (UUID)
- **Foreign Key**: `booking_id` (references `Booking(booking_id)`)
- **Attributes**:
  - `amount`: Amount paid for the booking.
  - `payment_date`: Timestamp when the payment was made.
  - `payment_method`: Method of payment (credit_card, paypal, stripe).

### **5. Review Table**

- **Purpose**: Stores user reviews for properties.
- **Primary Key**: `review_id` (UUID)
- **Foreign Keys**:
  - `property_id` (references `Property(property_id)`)
  - `user_id` (references `User(user_id)`)
- **Attributes**:
  - `rating`: Rating value (1-5).
  - `comment`: Review comment from the user.
  - `created_at`: Timestamp of review submission.

### **6. Message Table**

- **Purpose**: Stores messages exchanged between users.
- **Primary Key**: `message_id` (UUID)
- **Foreign Keys**:
  - `sender_id` (references `User(user_id)`)
  - `recipient_id` (references `User(user_id)`)
- **Attributes**:
  - `message_body`: Content of the message.
  - `sent_at`: Timestamp of when the message was sent.

---

## **SQL Script**

The SQL script provided defines the following:

1. **CREATE TABLE Statements**: Defines the structure for each table and the relationships between entities.
2. **Primary Keys**: Each table has a primary key to ensure data uniqueness.
3. **Foreign Keys**: Ensures relationships between tables by linking foreign keys.
4. **Constraints**:
   - `NOT NULL`: Ensures that essential attributes cannot be left empty.
   - `CHECK`: Validates values for certain attributes (e.g., ratings).
   - `UNIQUE`: Ensures that the email in the `User` table is unique.
5. **Indexes**: Improves query performance by indexing frequently queried fields (e.g., `email`, `property_id`, `booking_id`).

---

## **Usage Instructions**

### **Step 1: Create Database**

Run the following SQL query to create the database (if not already created):

```sql
CREATE DATABASE booking_platform;
USE booking_platform;
```

### **Step 2: Execute the SQL Script**

Copy and execute the SQL script to create the tables and their relationships. This will set up the schema for the booking platform.

### **Step 3: Indexes**

Indexes are created for frequently queried fields to improve query performance, such as `email` in the `User` table and `property_id` in the `Property` and `Review` tables.

---

## **Schema Diagram**

The schema diagram visually represents the relationships between the entities:

1. **User** can have multiple **Properties** (one-to-many).
2. **Property** can have multiple **Bookings** (one-to-many).
3. **Booking** can have one **Payment** (one-to-one).
4. **User** can send and receive multiple **Messages** (one-to-many).
5. **User** can leave multiple **Reviews** for **Properties** (one-to-many).

---

## **Example Queries**

### **1. Create a New User**

```sql
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES (UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password', '123-456-7890', 'guest');
```

### **2. Book a Property**

```sql
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES (UUID(), 'property-uuid', 'user-uuid', '2024-12-15', '2024-12-20', 500.00, 'pending');
```

### **3. Add a Review**

```sql
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES (UUID(), 'property-uuid', 'user-uuid', 5, 'Great property, had a wonderful stay!');
```

---
