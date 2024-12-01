-- ### 1. **INNER JOIN to retrieve all bookings and the respective users who made those bookings:**

SELECT b.booking_id,
       b.property_id,
       b.start_date,
       b.end_date,
       b.total_price,
       b.status,
       u.user_id,
       u.first_name,
       u.last_name,
       u.email
  from booking b
 inner join user u
on b.user_id = u.user_id;



-- ### 2. **LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews:**

SELECT p.property_id,
       p.name,
       p.description,
       p.location,
       p.pricepernight,
       r.review_id,
       r.rating,
       r.comment,
       r.created_at as review_created_at
  from property p
  left join review r
on p.property_id = r.property_id;


-- ### 3. **FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user:**

SELECT u.user_id,
       u.first_name,
       u.last_name,
       u.email,
       b.booking_id,
       b.property_id,
       b.start_date,
       b.end_date,
       b.total_price,
       b.status
  from user u
  full outer join booking b
on u.user_id = b.user_id;