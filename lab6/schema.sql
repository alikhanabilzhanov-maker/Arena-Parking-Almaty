PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL CHECK (role IN
        ('viewer','manager','operator','guard','admin'))
);

CREATE TABLE IF NOT EXISTS events (
    event_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    event_time TEXT NOT NULL,
    manager_id INTEGER NOT NULL REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS parking_zones (
    zone_id INTEGER PRIMARY KEY,
    zone_name TEXT NOT NULL UNIQUE,
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    is_open INTEGER NOT NULL DEFAULT 1 CHECK (is_open IN (0,1))
);

CREATE TABLE IF NOT EXISTS sector_mapping (
    mapping_id INTEGER PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(event_id),
    sector TEXT NOT NULL,
    zone_id INTEGER NOT NULL REFERENCES parking_zones(zone_id),
    UNIQUE (event_id, sector, zone_id)
);

CREATE TABLE IF NOT EXISTS bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    event_id INTEGER NOT NULL REFERENCES events(event_id),
    zone_id INTEGER NOT NULL REFERENCES parking_zones(zone_id),
    ticket_number TEXT NOT NULL,
    sector TEXT NOT NULL,
    car_number TEXT NOT NULL,
    entry_code TEXT UNIQUE,
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN
        ('pending','confirmed','entered','exited','cancelled')),
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    entered_at TEXT,
    exited_at TEXT,
    UNIQUE (event_id, ticket_number),
    FOREIGN KEY (event_id, sector, zone_id)
        REFERENCES sector_mapping(event_id, sector, zone_id)
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id INTEGER PRIMARY KEY,
    booking_id INTEGER NOT NULL UNIQUE REFERENCES bookings(booking_id),
    amount INTEGER NOT NULL CHECK (amount > 0),
    status TEXT NOT NULL CHECK (status IN ('success','failed')),
    paid_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS feedback (
    feedback_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    booking_id INTEGER NOT NULL REFERENCES bookings(booking_id),
    message TEXT NOT NULL,
    answer TEXT,
    responder_id INTEGER REFERENCES users(user_id),
    status TEXT NOT NULL DEFAULT 'new' CHECK (status IN
        ('new','in_review','answered'))
);
