PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

DELETE FROM feedback;
DELETE FROM payments;
DELETE FROM bookings;
DELETE FROM sector_mapping;
DELETE FROM events;
DELETE FROM parking_zones;
DELETE FROM users;

INSERT INTO users (user_id, full_name, email, role)
VALUES
(1, 'Айдос Серік', 'aidos@example.com', 'viewer'),
(2, 'Данияр Мұрат', 'manager@example.com', 'manager'),
(3, 'Ерлан Асқар', 'operator@example.com', 'operator'),
(4, 'Нұрлан Болат', 'guard@example.com', 'guard'),
(5, 'Әлихан Нұрлан', 'admin@example.com', 'admin'),
(6, 'Аружан Болат', 'aruzhan@example.com', 'viewer'),
(7, 'Диас Ермек', 'dias@example.com', 'viewer'),
(8, 'Мадина Асқар', 'madina@example.com', 'viewer'),
(9, 'Айдана Серік', 'aidana@example.com', 'viewer'),
(10, 'Еркебұлан Әсет', 'erkebulan@example.com', 'viewer'),
(11, 'Ақерке Нұрлан', 'akerke@example.com', 'viewer'),
(12, 'Мирас Бекзат', 'miras@example.com', 'viewer'),
(13, 'Дильназ Ерлан', 'dilnaz@example.com', 'viewer'),
(14, 'Санжар Мұрат', 'sanzhar@example.com', 'viewer'),
(15, 'Айсұлу Болат', 'aisulu@example.com', 'viewer'),
(16, 'Арман Серік', 'arman@example.com', 'viewer'),
(17, 'Жансая Асқар', 'zhansaya@example.com', 'viewer'),
(18, 'Нұрасыл Ермек', 'nurasyl@example.com', 'viewer'),
(19, 'Аяулым Бекзат', 'ayaulym@example.com', 'viewer'),
(20, 'Расул Нұрлан', 'rasul@example.com', 'viewer');

INSERT INTO events (event_id, title, event_time, manager_id)
VALUES
(1, 'Футбол матчы', '2026-11-01 18:00:00', 2),
(2, 'Музыкалық концерт', '2026-11-15 19:00:00', 2),
(3, 'Хоккей турнирі', '2026-12-05 17:00:00', 2),
(4, 'Баскетбол чемпионаты', '2026-12-12 16:00:00', 2),
(5, 'Жаңа жылдық концерт', '2026-12-25 19:00:00', 2);

INSERT INTO parking_zones (zone_id, zone_name, capacity, is_open)
VALUES
(1, 'P1', 20, 1),
(2, 'P2', 24, 1),
(3, 'P3', 30, 1);

INSERT INTO sector_mapping (mapping_id, event_id, sector, zone_id)
VALUES
(1, 1, 'A', 1),
(2, 1, 'B', 2),
(3, 1, 'C', 3),
(4, 2, 'A', 1),
(5, 2, 'B', 2),
(6, 2, 'C', 3),
(7, 3, 'A', 1),
(8, 3, 'B', 2),
(9, 3, 'C', 3),
(10, 4, 'A', 1),
(11, 4, 'B', 2),
(12, 4, 'C', 3),
(13, 5, 'A', 1),
(14, 5, 'B', 2),
(15, 5, 'C', 3);

INSERT INTO bookings (
    booking_id, user_id, event_id, zone_id,
    ticket_number, sector, car_number, entry_code, status
)
VALUES
(1, 1, 1, 1, 'T001', 'A', '101AAA02', 'CODE001', 'pending'),
(2, 6, 1, 2, 'T002', 'B', '102AAA02', 'CODE002', 'confirmed'),
(3, 7, 1, 3, 'T003', 'C', '103AAA02', 'CODE003', 'confirmed'),
(4, 8, 1, 1, 'T004', 'A', '104AAA02', 'CODE004', 'pending'),
(5, 9, 1, 2, 'T005', 'B', '105AAA02', 'CODE005', 'cancelled'),
(6, 10, 1, 3, 'T006', 'C', '106AAA02', 'CODE006', 'confirmed'),

(7, 11, 2, 1, 'T007', 'A', '107AAA02', 'CODE007', 'confirmed'),
(8, 12, 2, 2, 'T008', 'B', '108AAA02', 'CODE008', 'confirmed'),
(9, 13, 2, 3, 'T009', 'C', '109AAA02', 'CODE009', 'pending'),
(10, 14, 2, 1, 'T010', 'A', '110AAA02', 'CODE010', 'cancelled'),
(11, 15, 2, 2, 'T011', 'B', '111AAA02', 'CODE011', 'confirmed'),
(12, 16, 2, 3, 'T012', 'C', '112AAA02', 'CODE012', 'confirmed'),

(13, 17, 3, 1, 'T013', 'A', '113AAA02', 'CODE013', 'confirmed'),
(14, 18, 3, 2, 'T014', 'B', '114AAA02', 'CODE014', 'pending'),
(15, 19, 3, 3, 'T015', 'C', '115AAA02', 'CODE015', 'cancelled'),
(16, 20, 3, 1, 'T016', 'A', '116AAA02', 'CODE016', 'confirmed'),
(17, 1, 3, 2, 'T017', 'B', '101AAA02', 'CODE017', 'confirmed'),
(18, 6, 3, 3, 'T018', 'C', '102AAA02', 'CODE018', 'confirmed'),

(19, 7, 4, 1, 'T019', 'A', '103AAA02', 'CODE019', 'pending'),
(20, 8, 4, 2, 'T020', 'B', '104AAA02', 'CODE020', 'confirmed'),
(21, 9, 4, 3, 'T021', 'C', '105AAA02', 'CODE021', 'confirmed'),
(22, 10, 4, 1, 'T022', 'A', '106AAA02', 'CODE022', 'cancelled'),
(23, 11, 4, 2, 'T023', 'B', '107AAA02', 'CODE023', 'confirmed'),
(24, 12, 4, 3, 'T024', 'C', '108AAA02', 'CODE024', 'confirmed'),

(25, 13, 5, 1, 'T025', 'A', '109AAA02', 'CODE025', 'confirmed'),
(26, 14, 5, 2, 'T026', 'B', '110AAA02', 'CODE026', 'cancelled'),
(27, 15, 5, 3, 'T027', 'C', '111AAA02', 'CODE027', 'confirmed'),
(28, 16, 5, 1, 'T028', 'A', '112AAA02', 'CODE028', 'pending'),
(29, 17, 5, 2, 'T029', 'B', '113AAA02', 'CODE029', 'confirmed'),
(30, 18, 5, 3, 'T030', 'C', '114AAA02', 'CODE030', 'confirmed');

INSERT INTO payments (payment_id, booking_id, amount, status)
VALUES
(1, 1, 2000, 'success'),
(2, 2, 2200, 'success'),
(3, 3, 2500, 'success'),
(4, 5, 2200, 'failed'),
(5, 6, 2500, 'success'),
(6, 7, 1800, 'success'),
(7, 8, 2000, 'success'),
(8, 10, 1800, 'failed'),
(9, 11, 2000, 'success'),
(10, 12, 2300, 'success'),
(11, 13, 2300, 'success'),
(12, 15, 2800, 'failed'),
(13, 16, 2300, 'success'),
(14, 17, 2500, 'success'),
(15, 18, 2800, 'success'),
(16, 20, 2100, 'success'),
(17, 21, 2400, 'success'),
(18, 22, 1900, 'failed'),
(19, 23, 2100, 'success'),
(20, 24, 2400, 'success'),
(21, 25, 3000, 'success'),
(22, 26, 3200, 'failed'),
(23, 27, 3500, 'success'),
(24, 29, 3200, 'success');

INSERT INTO feedback (
    feedback_id, user_id, booking_id,
    message, answer, responder_id, status
)
VALUES
(1, 1, 1,
 'P1 аймағына қай кіреберістен кіремін?',
 'P1 көрсеткіші бар кіреберістен кіріңіз.',
 3, 'answered'),

(2, 6, 2,
 'Броньды қалай тексеремін?',
 NULL, NULL, 'new'),

(3, 7, 3,
 'Көлік нөмірін өзгертуге бола ма?',
 NULL, 3, 'in_review'),

(4, 8, 4,
 'Броньды растау үшін не істеу керек?',
 'Сынақ төлемін орындап, броньды растаңыз.',
 3, 'answered'),

(5, 9, 5,
 'Сәтсіз төлемді қайта жасауға бола ма?',
 NULL, NULL, 'new'),

(6, 11, 7,
 'P1 аймағының орналасуын көрсетіңізші.',
 'P1 аймағы A секторына сәйкес келеді.',
 3, 'answered'),

(7, 12, 8,
 'Броньды тоқтатуға бола ма?',
 NULL, 3, 'in_review'),

(8, 13, 9,
 'Төлем қашан жасалады?',
 NULL, NULL, 'new'),

(9, 17, 13,
 'Кіру кодын қайдан табамын?',
 'Кіру коды бронь мәліметтерінде көрсетіледі.',
 3, 'answered'),

(10, 13, 25,
 'P1 аймағы ашық па?',
 NULL, NULL, 'new');

UPDATE bookings
SET status = 'confirmed'
WHERE booking_id = 1;

UPDATE parking_zones
SET capacity = 25
WHERE zone_id = 2;

INSERT INTO feedback (
    feedback_id, user_id, booking_id, message
)
VALUES
(11, 1, 1, 'Қате жіберілген сынақ өтініші');

DELETE FROM feedback
WHERE feedback_id = 11;

COMMIT;

SELECT * FROM users;
SELECT * FROM events;
SELECT * FROM parking_zones;
SELECT * FROM sector_mapping;
SELECT * FROM bookings;
SELECT * FROM payments;
SELECT * FROM feedback;