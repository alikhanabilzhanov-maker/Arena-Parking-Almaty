SELECT zone_id, zone_name, capacity, is_open
FROM parking_zones;

SELECT booking_id, ticket_number, car_number, status
FROM bookings
WHERE status = 'confirmed';

SELECT zone_name, capacity
FROM parking_zones
WHERE is_open = 1
  AND capacity >= 25;

SELECT DISTINCT sector
FROM bookings
ORDER BY sector;

SELECT zone_name, capacity
FROM parking_zones
ORDER BY capacity DESC;

SELECT
    e.title AS event_title,
    COUNT(b.booking_id) AS booking_count
FROM events AS e
LEFT JOIN bookings AS b
    ON b.event_id = e.event_id
GROUP BY e.event_id, e.title
ORDER BY booking_count DESC, e.title;

SELECT
    COUNT(*) AS payment_count,
    COALESCE(SUM(amount), 0) AS total_amount,
    ROUND(AVG(amount), 2) AS average_amount,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM payments
WHERE status = 'success';

SELECT
    u.full_name,
    COUNT(b.booking_id) AS booking_count
FROM users AS u
JOIN bookings AS b
    ON b.user_id = u.user_id
GROUP BY u.user_id, u.full_name
HAVING COUNT(b.booking_id) >= 2
ORDER BY booking_count DESC, u.full_name;

SELECT
    u.full_name,
    b.ticket_number,
    p.amount
FROM payments AS p
JOIN bookings AS b
    ON b.booking_id = p.booking_id
JOIN users AS u
    ON u.user_id = b.user_id
WHERE p.status = 'success'
  AND p.amount > (
      SELECT AVG(amount)
      FROM payments
      WHERE status = 'success'
  )
ORDER BY p.amount DESC, p.payment_id;

SELECT
    status,
    COUNT(*) AS feedback_count
FROM feedback
GROUP BY status
ORDER BY feedback_count DESC, status;

SELECT
    e.title AS event_title,
    COUNT(p.payment_id) AS successful_payment_count,
    COALESCE(SUM(p.amount), 0) AS total_amount
FROM events AS e
LEFT JOIN bookings AS b
    ON b.event_id = e.event_id
LEFT JOIN payments AS p
    ON p.booking_id = b.booking_id
   AND p.status = 'success'
GROUP BY e.event_id, e.title
ORDER BY total_amount DESC, e.title;

SELECT zone_id, zone_name, capacity, is_open
FROM parking_zones;