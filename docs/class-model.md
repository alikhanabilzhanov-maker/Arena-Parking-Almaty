# Кластар

## Пайдаланушы
id: integer
аты: string
рөл: string
кіру()

## Бронь
id: integer
пайдаланушыId: integer
ісШараId: integer
аймақId: integer
билетНөмірі: string
көлікНөмірі: string
кіруКоды: string
статус: string
брондау()
кірудіТіркеу()

## ІсШара
id: integer
атауы: string
күні: datetime
енгізу()

## Төлем
id: integer
броньId: integer
сома: decimal
статус: string
растау()

## СекторСәйкестігі
id: integer
ісШараId: integer
сектор: string
аймақId: integer
аймақТабу()

## ТұрақАймағы
id: integer
атауы: string
сыйымдылық: integer
ашық: boolean
қордыЕсептеу()

## КеріБайланыс
id: integer
пайдаланушыId: integer
броньId: integer [0..1]
мәтін: string
жауап: string
жауапБерy()

SQL кестелері: users, events, parking_zones, sector_mappings, reservations, payments, feedback.
