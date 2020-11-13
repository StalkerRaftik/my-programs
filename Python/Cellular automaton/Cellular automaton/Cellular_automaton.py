from random import *
from tkinter import *

mode = 1
print("Chose automaton mode:")
print("1 - 3x23")
print("2 - 1x12345678")
mode = int(input())

# Объявление глобальных переменных
size = 500
root = Tk()
canvas = Canvas(root, width=size, height=size, bg = "white")
canvas.pack()
diapason = 0
cube_size = 5
cube_amount = size//cube_size



# Класс точки!
class Point():
    def __init__(self, x, y, exist): 
        self.x = x
        self.y = y
        self.exist = False

    def Create(self):
        self.exist = canvas.create_rectangle( self.x*cube_size, self.y*cube_size, (self.x+1)*cube_size, (self.y+1)*cube_size,
                       fill='black')

    def Delete(self):
        if (self.exist != False):
            canvas.delete(self.exist)
            self.exist = False

# Карта.
map = [[0]*cube_amount for i in range(cube_amount)]
for y in range(cube_amount):
    for x in range(cube_amount):
        map[x][y] = Point(x, y, False)

wmap = [[0]*cube_amount for i in range(cube_amount)]

# Рисование!
def Draw(event):
    if event.x//cube_size < 0 or event.x//cube_size >= cube_amount or event.y//cube_size < 0 or event.y//cube_size >= cube_amount:
        return
    if map[event.x//cube_size][event.y//cube_size].exist != False:
        return
    map[event.x//cube_size][event.y//cube_size].Create()
   
root.bind("<B1-Motion>", Draw)
root.bind("<Button-1>", Draw)

def Del(event):
    if event.x//cube_size < 0 or event.x//cube_size >= cube_amount or event.y//cube_size < 0 or event.y//cube_size >= cube_amount:
        return
    map[event.x//cube_size][event.y//cube_size].Delete()
root.bind("<B3-Motion>", Del)
root.bind("<Button-3>", Del)

automaton_start = False
def StartAutomaton(event):
    global automaton_start
    if automaton_start:
        automaton_start = False
        print("ВЫКЛ")
    else:
        automaton_start = True
        print("ВКЛ")

root.bind("<Button-2>", StartAutomaton)


def Cellular_Automaton():
    for y in range(0, cube_amount):
        for x in range(0, cube_amount):
            CellsAround = 0
            for y2 in range(-1, 2):
                for x2 in range(-1, 2):
                    if x2 == 0 and y2 == 0:
                        continue
                    else:
                        if not (x+x2 < 0 or x+x2 >= cube_amount or y+y2 < 0 or y+y2 >= cube_amount):
                            if map[x+x2][y+y2].exist != False:
                                CellsAround += 1
            wmap[x][y] = CellsAround
             
    for y in range(0, cube_amount):
        for x in range(0, cube_amount):
            if mode == 1:
                if map[x][y].exist == False:
                    if wmap[x][y] == 3:
                        map[x][y].Create()
                elif map[x][y].exist != False: 
                    if wmap[x][y] != 2 and wmap[x][y] != 3:
                        map[x][y].Delete()
            if mode == 2:
                if map[x][y].exist == False:
                    if wmap[x][y] == 1:
                        map[x][y].Create()

def Cellular_Automaton_Handle(event):
    if event.char == 'r' or event.char == 'к':
        for y in range(0, cube_amount):
            for x in range(0, cube_amount):
                CellsAround = 0
                for y2 in range(-1, 2):
                    for x2 in range(-1, 2):
                        if x2 == 0 and y2 == 0:
                            continue
                        else:
                            if not (x+x2 < 0 or x+x2 >= cube_amount or y+y2 < 0 or y+y2 >= cube_amount):
                                if map[x+x2][y+y2].exist != False:
                                    CellsAround += 1
                wmap[x][y] = CellsAround
                
        for y in range(0, cube_amount):
            for x in range(0, cube_amount):
                if map[x][y].exist == False:
                    if wmap[x][y] == 3:
                        map[x][y].Create()
                elif map[x][y].exist != False: 
                    if wmap[x][y] != 2 and wmap[x][y] != 3:
                        map[x][y].Delete()
                
    elif event.char == 'e' or event.char == 'у':
        for y in range(cube_amount):
            string = ""
            for x in range(cube_amount):
                if (map[x][y].exist != False):
                    string += "#"
                else:
                    string += "-"
            print(string)

root.bind('<Key>', Cellular_Automaton_Handle)

while True:
    root.update();
    

    if automaton_start:
        Cellular_Automaton()
