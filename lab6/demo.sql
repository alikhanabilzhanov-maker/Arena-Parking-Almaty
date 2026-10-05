INSERT INTO users VALUES
(1,'Көрермен','viewer@example.com','viewer'),
(2,'Іс-шара менеджері','manager@example.com','manager'),
(3,'Тұрақ операторы','operator@example.com','operator'),
(4,'Қауіпсіздік қызметкері','guard@example.com','guard'),
(5,'Жүйе әкімшісі','admin@example.com','admin');

INSERT INTO events VALUES
(1,'Сынақ матчы','2026-11-01 18:00:00',2);

INSERT INTO parking_zones VALUES
(1,'P1',20,1),(2,'P2',24,1),(3,'P3',30,1);

INSERT INTO sector_mapping VALUES
(1,1,'A',1),(2,1,'B',2),(3,1,'C',3);

INSERT INTO bookings
(booking_id,user_id,event_id,zone_id,ticket_number,
 sector,car_number,entry_code,status)
VALUES (1,1,1,1,'TEST001','A','213AAA02','C164DEFC','pending');

INSERT INTO payments (payment_id,booking_id,amount,status)
VALUES (1,1,2000,'success');

INSERT INTO feedback (feedback_id,user_id,booking_id,message)
VALUES (1,1,1,'P1 аймағына қай кіреберістен кіремін?');

UPDATE bookings SET status = 'confirmed' WHERE booking_id = 1;
UPDATE parking_zones SET capacity = 25 WHERE zone_id = 2;
UPDATE feedback
SET answer = 'P1 көрсеткіші бар кіреберіс арқылы кіріңіз.',
    responder_id = 2, status = 'answered'
WHERE feedback_id = 1;

-- Уақытша өтінішті енгізу және тек сол жазбаны жою.
INSERT INTO feedback (feedback_id,user_id,booking_id,message)
VALUES (2,1,1,'Қате жіберілген сынақ өтініші');
DELETE FROM feedback WHERE feedback_id = 2;
