# SQL Queries for Booking System

## 1. Retrieve All Bookings and the Respective Users Who Made Those Bookings

- **Purpose**: This query retrieves all booking records along with the details of the users who made those bookings. Only bookings that have an associated user are included.
- **JOIN Type**: **INNER JOIN**
- **Tables Involved**: `Booking`, `User`

## 2. Retrieve All Properties and Their Reviews, Including Properties Without Reviews

- **Purpose**: This query retrieves all property records and their corresponding reviews. Properties that do not have reviews will still be included, with `NULL` values for review-related fields.
- **JOIN Type**: **LEFT JOIN**
- **Tables Involved**: `Property`, `Review`

## 3. Retrieve All Users and All Bookings, Even if the User Has No Booking or a Booking Is Not Linked to a User

- **Purpose**: This query retrieves all user records and all booking records. It ensures that users who haven't made any bookings are still shown, and bookings not linked to any user are included with `NULL` values for user-related fields.
- **JOIN Type**: **FULL OUTER JOIN**
- **Tables Involved**: `User`, `Booking`

---

Here’s a simple README for the provided queries:

---

# SQL Queries for Property and User Analysis

## 1. Retrieve Properties with an Average Rating Greater Than 4.0

- **Purpose**: This query retrieves all properties where the average rating from the reviews is greater than 4.0.
- **Key Feature**: **Subquery** is used to calculate the average rating for each property from the `Review` table. Only properties with an average rating greater than 4.0 are included in the results.

## 2. Retrieve Users Who Have Made More Than 3 Bookings

- **Purpose**: This query identifies users who have made more than 3 bookings.
- **Key Feature**: **Correlated Subquery** is used to count the number of bookings made by each user. The query returns users who have more than 3 bookings by referencing the `user_id` from the outer query in the subquery.

---
