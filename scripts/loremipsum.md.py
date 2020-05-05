#!/usr/bin/env python3

from faker import Faker
f = Faker('la')

for _ in range(3):
    print(f"# {f.sentence().replace(' .','')}\n")
    print(f"{f.paragraph(7)}\n")
