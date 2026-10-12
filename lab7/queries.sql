SELECT *
FROM parking_zones;

SELECT *
FROM bookings
WHERE status = 'confirmed';

SELECT *
FROM parking_zones
WHERE is_open = 1 AND capacity >= 25;

SELECT DISTINCT sector
FROM bookings;

SELECT zone_name, capacity
FROM parking_zones
ORDER BY capacity DESC;

SELECT event_id, COUNT(*) AS booking_count
FROM bookings
GROUP BY event_id;

SELECT SUM(amount) AS total_amount
FROM payments
WHERE status = 'success';

SELECT AVG(amount) AS average_amount,
       MIN(amount) AS minimum_amount,
       MAX(amount) AS maximum_amount
FROM payments
WHERE status = 'success';

SELECT user_id, COUNT(*) AS booking_count
FROM bookings
GROUP BY user_id
HAVING COUNT(*) >= 2;

SELECT status, COUNT(*) AS feedback_count
FROM feedback
GROUP BY status;

sysss

SELECT zone_id, COUNT(*) AS active_booking_count
FROM bookings
WHERE status IN ('confirmed', 'entered')
GROUP BY zone_id
ORDER BY active_booking_count DESC;
