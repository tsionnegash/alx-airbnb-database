# Database Requirements

## Overview

This document outlines the requirements for a database system designed to manage users, properties, bookings, payments, reviews, and messages for an online property rental platform.

---

## Functional Requirements

### User Management

- Users can register with their first name, last name, email, and password.
- Users can log in and access their accounts securely.
- Users are assigned roles: `guest`, `host`, or `admin`.
- Users can update their personal information (e.g., phone number).

### Property Management

- Hosts can list new properties, including name, description, location, and price per night.
- Hosts can update and delete their properties.
- Properties must be associated with a host (user).

### Booking Management

- Guests can book properties by selecting available dates.
- Bookings should record the start date, end date, total price, and booking status (`pending`, `confirmed`, or `canceled`).
- Users can view their booking history.

### Payment Processing

- Payments must be associated with a specific booking.
- Guests can make payments using `credit card`, `PayPal`, or `Stripe`.
- Payment records should include the amount, date, and payment method.

### Review System

- Guests can leave reviews for properties they have stayed in.
- Reviews must include a rating (1-5) and a comment.
- Each property should display its average rating based on reviews.

### Messaging System

- Users can send messages to one another (e.g., guest to host, host to admin).
- Messages should include the sender, recipient, message body, and timestamp.

---

## Non-Functional Requirements

- The system should ensure data integrity with appropriate constraints and indexing.
- Queries should execute efficiently even with a large dataset.
- Sensitive information (e.g., passwords) must be securely stored using hashing.
- The database must support concurrent transactions with minimal performance impact.

---

## Business Requirements

- The platform must handle at least 10,000 users and 100,000 bookings at any time.
- Properties listed must attract at least 20% new users monthly.
- Payment processing must meet PCI-DSS compliance standards.

---

## System Requirements

- Database: PostgreSQL 13+
- Hosting: Cloud-based infrastructure (AWS, GCP, or Azure)
- Backup: Daily automated backups with a 30-day retention policy
- Security: Role-based access control (RBAC) for admin, host, and guest roles

---

## Entities and Relationships

### User

- Each user has a unique `user_id` and role (`guest`, `host`, or `admin`).
- Hosts can list multiple properties.
- Guests can book multiple properties.

### Property

- Each property is associated with a single host (user).
- Properties can have multiple bookings and reviews.

### Booking

- Bookings link guests to properties.
- Each booking must include a total price and status.

### Payment

- Payments are linked to bookings.
- Payments must specify the method and amount.

### Review

- Reviews link guests to properties.
- Ratings are required and must be between 1 and 5.

### Message

- Messages connect users as sender and recipient.
- Each message must include a body and timestamp.

---

## Use Cases

### Use Case 1: User Registration

- **Actor**: Guest
- **Steps**:
  1. Fill out registration form with required details.
  2. Submit the form to create an account.
  3. Receive a confirmation email upon successful registration.

### Use Case 2: Booking a Property

- **Actor**: Guest
- **Steps**:
  1. Search for properties by location and price.
  2. Select a property and view availability.
  3. Choose dates and confirm the booking.
  4. Make a payment to complete the booking process.

### Use Case 3: Leaving a Review

- **Actor**: Guest
- **Steps**:
  1. Navigate to past bookings.
  2. Select the property and click "Leave a Review."
  3. Enter a rating (1-5) and a comment.
  4. Submit the review.

---

## Constraints

- Unique constraint on user emails.
- Foreign key constraints to ensure relationships:
  - `property_id` in the Booking and Review tables references `Property(property_id)`.
  - `user_id` in all related tables references `User(user_id)`.
- Rating values in reviews must be integers between 1 and 5.
- Status in bookings must be `pending`, `confirmed`, or `canceled`.

---

## Indexing

- Index `user_id` in all tables referencing the User table.
- Index `property_id` in Property, Booking, and Review tables.
- Index `booking_id` in Booking and Payment tables.
- Create a unique index on user emails.
