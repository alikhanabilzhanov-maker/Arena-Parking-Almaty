INSERT INTO users VALUES
(1,'Көрермен','viewer@example.com','viewer'),
(2,'Іс-шара менеджері','manager@example.com','manager'),
(3,'Тұрақ операторы','operator@example.com','operator'),
(4,'Қауіпсіздік қызметкері','guard@example.com','guard'),
(5,'Жүйе әкімшісі','admin@example.com','admin'),
(6,'Айдос Серік','aidos@example.com','viewer'),
(7,'Аружан Болат','aruzhan@example.com','viewer'),
(8,'Диас Ермек','dias@example.com','viewer'),
(9,'Мадина Асқар','madina@example.com','viewer'),
(10,'Әлихан Нұрлан','alikhan@example.com','viewer');

INSERT INTO events VALUES
(1,'Алматы футбол матчы','2026-11-01 18:00:00',2),
(2,'Музыкалық концерт','2026-11-15 19:00:00',2),
(3,'Хоккей турнирі','2026-12-05 17:00:00',2);

INSERT INTO parking_zones VALUES
(1,'P1',20,1),
(2,'P2',24,1),
(3,'P3',30,1);

INSERT INTO sector_mapping VALUES
(1,1,'A',1),
(2,1,'B',2),
(3,1,'C',3),
(4,2,'A',1),
(5,2,'B',2),
(6,2,'C',3),
(7,3,'A',1),
(8,3,'B',2),
(9,3,'C',3);

INSERT INTO bookings
(booking_id,user_id,event_id,zone_id,ticket_number,
 sector,car_number,entry_code,status)
VALUES
(1,1,1,1,'TEST001','A','213AAA02','CODE001','pending'),
(2,6,1,2,'TICKET002','B','777BBB02','CODE002','confirmed'),
(3,7,1,3,'TICKET003','C','555CCC02','CODE003','entered'),
(4,8,2,1,'TICKET004','A','111DDD02','CODE004','confirmed'),
(5,9,2,2,'TICKET005','B','222EEE02','CODE005','pending'),
(6,10,2,3,'TICKET006','C','333FFF02','CODE006','cancelled'),
(7,1,3,1,'TICKET007','A','444GGG02','CODE007','entered'),
(8,6,3,2,'TICKET008','B','888HHH02','CODE008','confirmed'),
(9,7,3,3,'TICKET009','C','999JJJ02','CODE009','exited'),
(10,8,3,1,'TICKET010','A','123KKK02','CODE010','confirmed');

INSERT INTO payments
(payment_id,booking_id,amount,status)
VALUES
(1,1,2000,'success'),
(2,2,2000,'success'),
(3,3,2500,'success'),
(4,4,1800,'success'),
(5,5,1800,'failed'),
(6,6,2200,'failed'),
(7,7,2300,'success'),
(8,8,2300,'success'),
(9,9,2300,'success');

INSERT INTO feedback
(feedback_id,user_id,booking_id,message,answer,responder_id,status)
VALUES
(1,1,1,
 'P1 аймағына қай кіреберістен кіремін?',
 'P1 көрсеткіші бар кіреберіс арқылы кіріңіз.',
 2,'answered'),

(2,6,2,
 'P2 аймағында бос орын бар ма?',
 NULL,NULL,'new'),

(3,8,4,
 'Брон уақытын өзгертуге бола ма?',
 NULL,3,'in_review'),

(4,7,3,
 'Кіру коды жұмыс істеді.',
 'Рақмет, өтініш жабылды.',
 3,'answered'),

(5,9,5,
 'Төлем қайта орындала ма?',
 NULL,NULL,'new');

UPDATE bookings
SET status = 'confirmed'
WHERE booking_id = 1;

UPDATE parking_zones
SET capacity = 25
WHERE zone_id = 2;

-- DELETE операторының мысалы
INSERT INTO feedback
(feedback_id,user_id,booking_id,message)
VALUES
(6,1,1,'Қате жіберілген сынақ өтініші');

DELETE FROM feedback
WHERE feedback_id = 6;