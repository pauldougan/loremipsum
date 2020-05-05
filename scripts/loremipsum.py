#!/usr/bin/env python3

from faker import Faker
f = Faker('la')

def txt():
    print("lorem,ipsum")
    for _ in range(3):
        print(f"{f.word()}, {f.sentence()}")


def markdown():
    for _ in range(3):
        print(f"# {f.sentence().replace(' .','')}\n")
        print(f"{f.paragraph(7)}\n")

        
txt()
markdown()