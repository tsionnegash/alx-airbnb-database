---
# README - Sample Data Insertion SQL Script

This SQL script is designed to insert sample data into a database for a property booking system. It includes data for multiple entities involved in the system, such as users, properties, bookings, payments, reviews, and messages.
### Tables and Data Inserted:
---

## 1. Sample Users

The `user` table is populated with sample user data. The script inserts users with different roles, such as `guest`, `host`, and `admin`. Each user has essential attributes, including first and last names, email, phone number, and role. A hashed password is also included for security purposes. The `created_at` field automatically records the timestamp of when each user is added.

---

## 2. Sample Properties

The `property` table contains details about various properties listed by hosts. Each property is associated with a host and includes a name, description, location, and price per night. The `created_at` and `updated_at` fields track when the property was created and last updated.

---

## 3. Sample Bookings

The `booking` table records each booking made by a user for a particular property. This table stores the booking's start and end dates, total price, booking status (such as `confirmed` or `pending`), and a timestamp for when the booking is created. Each booking links a user to a specific property.

---

## 4. Sample Payments

The `payment` table stores payment information related to bookings. Each entry includes a booking ID, payment amount, payment method (such as credit card or PayPal), and the date of the transaction. This data helps track the financial aspect of the booking process.

---

## 5. Sample Reviews

The `review` table contains user reviews for properties they have booked. Each review includes a rating (1-5), a comment, and a timestamp for when the review is submitted. Reviews are linked to a user and a property, allowing users to share feedback on their stays.

---

## 6. Sample Messages

The `message` table logs communication between users. These messages are sent from one user to another, typically to inquire about bookings or share other information. Each message includes the sender's and recipient's user IDs, the message content, and the timestamp for when the message was sent.

---

### Key Features of the Script:

- **Data Relationships:** The script creates relationships between tables by linking properties with hosts, bookings with users, payments with bookings, and reviews and messages with users and properties.
- **UUIDs for Uniqueness:** The script uses UUIDs (Universally Unique Identifiers) for primary keys to ensure that each record is uniquely identifiable across all tables.
- **Timestamps for Tracking:** Each record includes automatic timestamps (`created_at`) to track when entities are added or modified in the system.
- **Variety of Roles:** Users can have different roles (`guest`, `host`, `admin`), which may define their permissions or actions within the system.

---

### Usage Instructions:

1. **Database Setup:** Ensure your database schema is set up with the appropriate tables: `user`, `property`, `booking`, `payment`, `review`, and `message`.
2. **Run Script:** Execute this script in your SQL environment to insert sample data into the tables.
3. **Test the System:** Once the data is inserted, you can test and experiment with different features of the property booking system (such as booking properties, making payments, and leaving reviews).

---
