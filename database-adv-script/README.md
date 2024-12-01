# SQL Queries for Booking System

This README provides an overview of various SQL queries designed to retrieve specific information from the booking system database. These queries involve using different types of JOIN operations to gather related data across multiple tables.

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
