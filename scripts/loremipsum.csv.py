#!/usr/bin/env python3

from faker import Faker
f = Faker('la')

print("lorem,ipsum")
for _ in range(3):
    print(f"{f.word()}, {f.sentence()}")
