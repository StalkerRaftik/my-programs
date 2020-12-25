import random
from random import randint
a = [
    ["sword", 40],
    ["shield", 50],
    ["shield", 50],
    ["shield", 50],
    ["shield", 50],
    ["shield", 50],
    ["shield", 50],
    ["ring", 10],
]

counter = 0
for i in range(1, 100):
    number = randint(0, 50)
    itemtbl = []
    for item in a:
        if item[1] >= number:
            itemtbl.append(item[0])


    if len(itemtbl) > 0:
        if random.choice(itemtbl) == "ring":
            counter += 1


print(counter)