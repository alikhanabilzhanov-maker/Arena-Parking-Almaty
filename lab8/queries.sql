
SELECT
    users.full_name,
    bookings.ticket_number,
    bookings.sector,
    parking_zones.zone_name,
    bookings.entered_at
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN parking_zones ON bookings.zone_id = parking_zones.zone_id
WHERE bookings.entered_at IS NOT NULL;