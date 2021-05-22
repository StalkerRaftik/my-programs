import pygame
from random import *

# Объявление глобальных переменных
RES = 500
cube_size = 5
cube_amount = RES//cube_size
FPS = 60
mode = 1
count = 0

pygame.init()
sc = pygame.display.set_mode([RES,RES])
clock = pygame.time.Clock()

# Класс точки!
class Point:
    def __init__(self, x, y, exist):
        if wmap[x][y] != "-":
            return
        self.x = x
        self.y = y
        self.exist = exist

    def Create(self):
        if wmap[x][y] != "-":
            return
        else:
            if bool == True:
                Point(x, y, bool)
                wmap[x][y] = "#"
            else:
                Point(x, y, False)
                wmap[x][y] = "*"

    def Delete(point):
        if wmap[point.x][point.y] == "-":
            return

        wmap[point.x][point.y] = "-"
        if point.exist:
            Elements.remove(point)
        else:
            potentElements.remove(point)


# Карта.
wmap = [['-'] * cube_amount for i in range(cube_amount)]

Elements = []
potentElements = []


def Create(x,y,bool):
    if wmap[x][y] != "-":
        return
    else:
        if bool == True:
            Point(x,y,bool)
            wmap[x][y] = "#"
        else:
            Point(x,y,False)
            wmap[x][y] = "*"

def Delete(point):
    if wmap[point.x][point.y] == "-":
        return

    wmap[point.x][point.y] = "-"
    if point.exist:
        Elements.remove(point)
    else:
        potentElements.remove(point)




# Рисование!
def Draw(mpos):
    px = mpos[0]//cube_size
    py = mpos[1]//cube_size
    if px < 0 or px >= cube_amount or py < 0 or py >= cube_amount:
        return
    elexist = False
    for el in Elements:
        if el.x == px and el.y == py:
            elexist = True

    if elexist != True:
        Elements.append( Point(px, py, True) )
        wmap[px][py] = '#'
        for y in range(-1, 2):
            for x in range(-1, 2):
                if y == 0 and x == 0:
                    continue
                else:
                    if wmap[px+x][py+y] != '*' and wmap[px+x][py+y] == '#':
                        potentElements.append( Point(px+x, py+y, False) )
                        wmap[px+x][py+y] = '*'



def Del(mpos):
    if mpos[0] // cube_size < 0 or mpos[0] // cube_size >= cube_amount or mpos[1] // cube_size < 0 or mpos[1] // cube_size >= cube_amount:
        return
    map[mpos[0] // cube_size][mpos[1] // cube_size].Delete()


def Cellular_Automaton():
    global Elements
    global potentElements

    for el in Elements:
        camount = 0
        for y in range(-1, 2):
            for x in range(-1, 2):
                if y == 0 and x == 0:
                    continue
                else:
                    if wmap[el.x+x][el.y+y] == 1:
                        camount += 1
        if mode == 1:
            if camount == 3:
                map[x][y].Create()
        if mode == 2:
            if wmap[x][y] == 1:
                map[x][y].Create()


    for y in range(0, cube_amount):
        for x in range(0, cube_amount):
            CellsAround = 0
            for y2 in range(-1, 2):
                for x2 in range(-1, 2):
                    if x2 == 0 and y2 == 0:
                        continue
                    else:
                        if not (x + x2 < 0 or x + x2 >= cube_amount or y + y2 < 0 or y + y2 >= cube_amount):
                            if map[x + x2][y + y2].exist == True:
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


def PrintTable():
    for y in range(cube_amount):
        string = ""
        for x in range(cube_amount):
            if (map[x][y].exist != False):
                string += "#"
            else:
                string += "-"
        print(string)



IsUsrDrawing = False
IsUsrDeleting = False
automaton_start = False
while True:
    sc.fill(pygame.Color( int(count/(cube_amount*cube_amount) * 70) + 20, int(count/(cube_amount*cube_amount) * 10) + 20, int(count/(cube_amount*cube_amount) * 180) + 20 ))
    # Получение и обработка нажатий мыши
    for event in pygame.event.get():
        if event.type == pygame.MOUSEBUTTONDOWN:
            if event.button == 1:
                IsUsrDrawing = True
            elif event.button == 3:
                IsUsrDeleting = True
            elif event.button == 2:
                automaton_start = not automaton_start
        elif event.type == pygame.MOUSEBUTTONUP:
            if event.button == 1:
                IsUsrDrawing = False
            elif event.button == 3:
                IsUsrDeleting = False
        elif event.type == pygame.QUIT:
            exit()

    if IsUsrDrawing:
        mpos = pygame.mouse.get_pos()
        Draw(mpos)
    elif IsUsrDeleting:
        mpos = pygame.mouse.get_pos()
        Del(mpos)

    key = pygame.key.get_pressed()
    if key[pygame.K_1]:
        mode = 1
    elif key[pygame.K_2]:
        mode = 2
    if key[pygame.K_r]:
        PrintTable()

    # Отрисовка организмов
    count = 0
    for y in range(0, cube_amount):
        for x in range(0, cube_amount):
            if map[x][y].exist == True:
                pygame.draw.rect(sc, pygame.Color(255, 130, randrange(0, 50)), (x * cube_size, y * cube_size, cube_size, cube_size))
                count += 1
    if automaton_start:
        Cellular_Automaton()

    pygame.display.flip()
    clock.tick(FPS)
