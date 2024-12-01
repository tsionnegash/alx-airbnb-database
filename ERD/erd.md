### Entities and Relationships

1. **User**

   - Attributes:
     - `user_id` (Primary Key, UUID, Indexed)
     - `first_name`, `last_name`, `email`, `password_hash` (NOT NULL)
     - `phone_number` (nullable)
     - `role` (ENUM: guest, host, admin)
     - `created_at` (Default: CURRENT_TIMESTAMP)
   - Relationships:
     - `User` can create multiple **Properties** (host_id relationship).
     - `User` can make multiple **Bookings**.
     - `User` can send/receive multiple **Messages**.
     - `User` can write multiple **Reviews** for **Properties**.

2. **Property**

   - Attributes:
     - `property_id` (Primary Key, UUID, Indexed)
     - `host_id` (Foreign Key referencing `User(user_id)`)
     - `name`, `description`, `location`, `pricepernight` (NOT NULL)
     - `created_at` (Default: CURRENT_TIMESTAMP)
     - `updated_at` (ON UPDATE CURRENT_TIMESTAMP)
   - Relationships:
     - Each **Property** belongs to one **User** (host).
     - Each **Property** can have multiple **Bookings**.
     - Each **Property** can have multiple **Reviews**.

3. **Booking**

   - Attributes:
     - `booking_id` (Primary Key, UUID, Indexed)
     - `property_id` (Foreign Key referencing `Property(property_id)`)
     - `user_id` (Foreign Key referencing `User(user_id)`)
     - `start_date`, `end_date`, `total_price` (NOT NULL)
     - `status` (ENUM: pending, confirmed, canceled)
     - `created_at` (Default: CURRENT_TIMESTAMP)
   - Relationships:
     - Each **Booking** is linked to one **Property**.
     - Each **Booking** is made by one **User**.
     - Each **Booking** can have one **Payment**.

4. **Payment**

   - Attributes:
     - `payment_id` (Primary Key, UUID, Indexed)
     - `booking_id` (Foreign Key referencing `Booking(booking_id)`)
     - `amount`, `payment_method` (NOT NULL)
     - `payment_date` (Default: CURRENT_TIMESTAMP)
   - Relationships:
     - Each **Payment** is associated with one **Booking**.

5. **Review**

   - Attributes:
     - `review_id` (Primary Key, UUID, Indexed)
     - `property_id` (Foreign Key referencing `Property(property_id)`)
     - `user_id` (Foreign Key referencing `User(user_id)`)
     - `rating` (INTEGER, 1-5)
     - `comment` (NOT NULL)
     - `created_at` (Default: CURRENT_TIMESTAMP)
   - Relationships:
     - Each **Review** is written by one **User**.
     - Each **Review** is for one **Property**.

6. **Message**
   - Attributes:
     - `message_id` (Primary Key, UUID, Indexed)
     - `sender_id` (Foreign Key referencing `User(user_id)`)
     - `recipient_id` (Foreign Key referencing `User(user_id)`)
     - `message_body` (NOT NULL)
     - `sent_at` (Default: CURRENT_TIMESTAMP)
   - Relationships:
     - Each **Message** has one sender and one recipient, both are **Users**.

---
