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

SELECT users.full_name, bookings.ticket_number, bookings.status
FROM users
JOIN bookings ON users.user_id = bookings.user_id;

SELECT bookings.ticket_number, events.title, parking_zones.zone_name
FROM bookings
JOIN events ON bookings.event_id = events.event_id
JOIN parking_zones ON bookings.zone_id = parking_zones.zone_id;

SELECT bookings.ticket_number, payments.amount, payments.status
FROM bookings
LEFT JOIN payments ON bookings.booking_id = payments.booking_id;

SELECT payment_id, amount
FROM payments
WHERE status = 'success'
AND amount > (
    SELECT AVG(amount)
    FROM payments
    WHERE status = 'success'
);

SELECT zone_name, capacity
FROM parking_zones
WHERE capacity = (
    SELECT MAX(capacity)
    FROM parking_zones
);

SELECT payment_id, booking_id, amount
FROM payments
WHERE status = 'success'
AND amount = (
    SELECT MIN(amount)
    FROM payments
    WHERE status = 'success'
);

SELECT user_id, full_name
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM bookings
    WHERE status = 'confirmed'
);

SELECT booking_id, ticket_number, car_number
FROM bookings
WHERE booking_id IN (
    SELECT booking_id
    FROM payments
    WHERE status = 'success'
);

SELECT event_id, title
FROM events
WHERE event_id IN (
    SELECT event_id
    FROM bookings
    WHERE status = 'confirmed'
);

SELECT zone_name,
CASE
    WHEN is_open = 1 THEN 'Ашық'
    ELSE 'Жабық'
END AS zone_state
FROM parking_zones;

SELECT ticket_number,
CASE
    WHEN status = 'pending' THEN 'Күтуде'
    WHEN status = 'confirmed' THEN 'Расталған'
    WHEN status = 'entered' THEN 'Кірген'
    WHEN status = 'exited' THEN 'Шыққан'
    WHEN status = 'cancelled' THEN 'Тоқтатылған'
    ELSE 'Белгісіз'
END AS booking_state
FROM bookings;

SELECT payment_id, amount,
CASE
    WHEN amount < 2000 THEN '2000-нан аз'
    WHEN amount <= 2500 THEN '2000–2500'
    ELSE '2500-ден жоғары'
END AS amount_group
FROM payments;

SELECT events.title, COUNT(*) AS booking_count
FROM events
JOIN bookings ON events.event_id = bookings.event_id
WHERE bookings.status = 'confirmed'
GROUP BY events.event_id, events.title
ORDER BY booking_count DESC;

SELECT events.title, SUM(payments.amount) AS total_amount
FROM events
JOIN bookings ON events.event_id = bookings.event_id
JOIN payments ON bookings.booking_id = payments.booking_id
WHERE payments.status = 'success'
GROUP BY events.event_id, events.title
ORDER BY total_amount DESC;

SELECT users.full_name, COUNT(*) AS booking_count
FROM users
JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.full_name
HAVING COUNT(*) >= 2
ORDER BY booking_count DESC;

