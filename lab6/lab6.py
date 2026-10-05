import sqlite3
from pathlib import Path

folder = Path(__file__).resolve().parent
# Оқу мысалын әр іске қосқанда таза жадтағы базада орындаймыз.
connection = sqlite3.connect(':memory:')
connection.executescript((folder / 'schema.sql').read_text(encoding='utf-8'))
connection.executescript((folder / 'demo.sql').read_text(encoding='utf-8'))
connection.commit()

for table in ['users', 'events', 'parking_zones', 'sector_mapping',
              'bookings', 'payments', 'feedback']:
    cursor = connection.execute(f'SELECT * FROM {table}')
    print('\nКесте:', table)
    print(' | '.join(column[0] for column in cursor.description))
    for row in cursor.fetchall():
        print(' | '.join(str(value) for value in row))

# Дискіге көшірме сақталады; басқа атаулы базалар өзгермейді.
with sqlite3.connect(folder / 'arena_lab6_demo.db') as saved:
    connection.backup(saved)
connection.close()
print('\nДайын! CREATE, INSERT, UPDATE, DELETE орындалды.')
print('База:', folder / 'arena_lab6_demo.db')
