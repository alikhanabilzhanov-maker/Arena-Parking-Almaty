import uuid

zones = {
    "P1": {"capacity": 20, "bookings": 0},
    "P2": {"capacity": 24, "bookings": 0},
    "P3": {"capacity": 30, "bookings": 0}
}

sector_zones = {"A": "P1", "B": "P2", "C": "P3"}
bookings = {}

while True:
    print("\nАЛМАТЫ СТАДИОНЫНЫҢ ТҰРАҒЫ")
    print("1. Бос орындарды көру")
    print("2. Тұрақты брондау")
    print("3. Кіру кодын тексеру")
    print("0. Шығу")

    choice = input("Таңдауыңыз: ").strip()

    if choice == "1":
        for name, zone in zones.items():
            free = zone["capacity"] - zone["bookings"]
            print(f"{name}: {free} бос орын")

    elif choice == "2":
        sector = input("Билет секторы (A/B/C): ").strip().upper()

        if sector not in sector_zones:
            print("Сектор дұрыс емес.")
            continue

        zone_name = sector_zones[sector]
        zone = zones[zone_name]

        if zone["bookings"] >= zone["capacity"]:
            print("Бұл аймақта бос орын жоқ.")
            continue

        car = input("Көлік нөмірі: ").strip().upper()
        if not car:
            print("Көлік нөмірін енгізіңіз.")
            continue

        payment = input("Оқу төлемін растау (иә/жоқ): ").strip().lower()
        if payment != "иә":
            print("Төлем расталмады. Бронь жасалмады.")
            continue

        code = uuid.uuid4().hex[:8].upper()
        while code in bookings:
            code = uuid.uuid4().hex[:8].upper()

        bookings[code] = {
            "car": car,
            "zone": zone_name,
            "status": "Расталды"
        }
        zone["bookings"] += 1

        print(f"Бронь расталды! Аймақ: {zone_name}")
        print(f"Кіру коды: {code}")

    elif choice == "3":
        code = input("Кіру коды: ").strip().upper()
        booking = bookings.get(code)

        if booking is None:
            print("Код табылмады.")
        elif booking["status"] == "Кірді":
            print("Бұл кодпен көлік кіріп қойған.")
        else:
            car = input("Көлік нөмірі: ").strip().upper()
            if car != booking["car"]:
                print("Көлік нөмірі сәйкес емес.")
            else:
                booking["status"] = "Кірді"
                print(f"Кіруге рұқсат! Аймақ: {booking['zone']}")

    elif choice == "0":
        break

    else:
        printл("Мәзірдегі санды таңдаңыз.")