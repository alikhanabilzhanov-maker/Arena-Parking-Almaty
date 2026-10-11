import sqlite3
from pathlib import Path

project = Path(__file__).resolve().parent.parent
database = project / "lab6" / "arena_lab6_demo.db"

if not database.exists():
    raise SystemExit(
        "База табылмады. Алдымен жоба ішіндегі lab6.py файлын іске қосыңыз."
    )

queries = [
    (
        "1. Барлық тұрақ аймақтары",
        """
        SELECT zone_name, capacity, is_open
        FROM parking_zones;
        """
    ),
    (
        "2. Расталған брондар",
        """
        SELECT booking_id, ticket_number, car_number, status
        FROM bookings
        WHERE status = 'confirmed';
        """
    ),
    (
        "3. Сыйымдылығы кемінде 20 болатын ашық аймақтар",
        """
        SELECT zone_name, capacity
        FROM parking_zones
        WHERE is_open = 1 AND capacity >= 20;
        """
    ),
    (
        "4. Брон жасалған бірегей секторлар",
        """
        SELECT DISTINCT sector
        FROM bookings
        ORDER BY sector;
        """
    ),
    (
        "5. Тұрақ аймақтарын сыйымдылығы бойынша сұрыптау",
        """
        SELECT zone_name, capacity
        FROM parking_zones
        ORDER BY capacity DESC, zone_name ASC;
        """
    ),
    (
        "6. Әр іс-шара мен аймақ бойынша белсенді брондар саны",
        """
        SELECT e.title, z.zone_name,
               COUNT(b.booking_id) AS booking_count
        FROM bookings AS b
        JOIN events AS e ON e.event_id = b.event_id
        JOIN parking_zones AS z ON z.zone_id = b.zone_id
        WHERE b.status IN ('confirmed', 'entered')
        GROUP BY e.event_id, e.title, z.zone_id, z.zone_name
        ORDER BY booking_count DESC;
        """
    ),
    (
        "7. Сәтті төлемдердің жалпы және орташа сомасы",
        """
        SELECT COUNT(*) AS payment_count,
               COALESCE(SUM(amount), 0) AS total_amount,
               AVG(amount) AS average_amount,
               MIN(amount) AS minimum_amount,
               MAX(amount) AS maximum_amount
        FROM payments
        WHERE status = 'success';
        """
    ),
    (
        "8. Кемінде бір брон жасаған пайдаланушылар",
        """
        SELECT u.user_id, u.full_name,
               COUNT(b.booking_id) AS booking_count
        FROM users AS u
        JOIN bookings AS b ON b.user_id = u.user_id
        GROUP BY u.user_id, u.full_name
        HAVING COUNT(b.booking_id) >= 1
        ORDER BY booking_count DESC, u.full_name;
        """
    ),
    (
        "9. Орташа сомадан кем емес сәтті төлемдер",
        """
        SELECT payment_id, booking_id, amount
        FROM payments
        WHERE status = 'success'
          AND amount >= (
              SELECT AVG(amount)
              FROM payments
              WHERE status = 'success'
          )
        ORDER BY amount DESC;
        """
    ),
    (
        "10. Кері байланыс мәртебелері бойынша өтініштер саны",
        """
        SELECT status, COUNT(*) AS feedback_count
        FROM feedback
        GROUP BY status
        ORDER BY feedback_count DESC;
        """
    ),
    (
        "11. Әр іс-шара бойынша сәтті төлемдерден түскен сома",
        """
        SELECT e.event_id, e.title,
               COUNT(p.payment_id) AS payment_count,
               SUM(p.amount) AS total_amount
        FROM events AS e
        JOIN bookings AS b ON b.event_id = e.event_id
        JOIN payments AS p ON p.booking_id = b.booking_id
        WHERE p.status = 'success'
        GROUP BY e.event_id, e.title
        ORDER BY total_amount DESC;
        """
    ),
]

# Базаны тек оқу режимінде ашамыз.
with sqlite3.connect(database.as_uri() + "?mode=ro", uri=True) as connection:
    for title, sql in queries:
        print("\n" + title)
        cursor = connection.execute(sql)

        columns = [column[0] for column in cursor.description]
        print(" | ".join(columns))

        rows = cursor.fetchall()
        if not rows:
            print("Шартқа сәйкес дерек жоқ.")
        else:
            for row in rows:
                print(" | ".join(str(value) for value in row))

print("\n7-зертханалық жұмыс: 11 сұраныс орындалды.")