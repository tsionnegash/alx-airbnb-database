---

## **Normalization to 3NF**
Normalization involves organizing a database to reduce redundancy and improve data integrity. The steps are:

### **First Normal Form (1NF):**
- Ensure all attributes contain atomic values (no lists or sets).
- Each record is uniquely identifiable by a primary key.

### **Second Normal Form (2NF):**
- Achieve 1NF.
- Eliminate partial dependency (no attribute should depend only on a part of a composite key).

### **Third Normal Form (3NF):**
- Achieve 2NF.
- Eliminate transitive dependency (non-key attributes should depend only on the primary key).

---

### **Review of Current Schema**

#### 1. **User**
- Already normalized:
  - Each user is uniquely identified by `user_id`.
  - No repeating groups or partial dependencies.

#### 2. **Property**
- Already normalized:
  - `property_id` uniquely identifies each property.
  - `host_id` (FK) references `user_id` in `User`, ensuring relationships are maintained.

#### 3. **Booking**
- Already normalized:
  - `booking_id` uniquely identifies each booking.
  - All attributes depend solely on `booking_id` without transitive dependency.

#### 4. **Payment**
- Already normalized:
  - `payment_id` uniquely identifies each payment.
  - Attributes depend only on `payment_id`.

#### 5. **Review**
- Already normalized:
  - `review_id` uniquely identifies each review.
  - Attributes depend only on `review_id`.

#### 6. **Message**
- Already normalized:
  - `message_id` uniquely identifies each message.
  - Attributes depend only on `message_id`.

---

### **Potential Issues and Adjustments**

#### **1. Redundancy in `Property` Table**
The `host_id` is a foreign key to `User`, but if additional host-specific attributes (e.g., host ratings or preferences) are added in the future, they may create redundancy. Solution:
- Separate `Host` attributes into their own table if necessary.

#### **2. Transitive Dependency in `Review` Table**
If a `review_id` references both `property_id` and `user_id`, and these attributes are already linked in other tables, this can cause redundancy. Solution:
- Ensure `Review` contains only minimal attributes and relationships.

---

### **Updated Schema in 3NF**
No major changes were needed for the provided schema as it already adheres to 3NF principles. The relationships and attributes are structured without redundancy or dependency violations.

---

### **Normalization Steps in Markdown**

```markdown
# Normalization Steps to 3NF

## Objective
To ensure the database design adheres to the Third Normal Form (3NF), reducing redundancy and maintaining data integrity.

## Steps Taken

### Step 1: Ensure 1NF
- All attributes contain atomic values.
- Each record is uniquely identifiable by a primary key.
- Achieved:
  - All entities have primary keys (`user_id`, `property_id`, `booking_id`, etc.).
  - No repeating groups or multi-valued attributes.

### Step 2: Ensure 2NF
- Removed partial dependencies (attributes depending only on part of a composite key).
- Achieved:
  - Each non-key attribute depends solely on the primary key.
  - No composite keys exist in the schema, avoiding partial dependencies.

### Step 3: Ensure 3NF
- Removed transitive dependencies (non-key attributes depending on other non-key attributes).
- Achieved:
  - Each attribute depends only on the primary key.
  - Tables such as `Review` and `Booking` reference `User` and `Property` through foreign keys, avoiding redundancy.

## Observations
- The database schema provided was already in 3NF.
- Potential areas for future optimization:
  - Create a separate `Host` table if additional host-related data grows complex.

## Conclusion
The database design adheres to normalization principles up to 3NF. No further adjustments were necessary.
```

