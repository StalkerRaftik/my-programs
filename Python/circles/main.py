import pygame
from random import *
import math

RES = 600
FPS = 60
Speed = 1

pygame.init()
sc = pygame.display.set_mode([RES,RES])
clock = pygame.time.Clock()

class Crcl:
    def __init__(self, x, y, r, clr):
        self.x = x
        self.y = y
        self.r = r
        self.clr = clr
        self.done = False

Circles = []

def IfCirclesTouch(x1,y1,x2,y2,r1,r2):
    D = math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))
    if (D==0):
        if r1 != r2: return False
        else: return True
    else:
        if D > r2+r2: return False
        elif D == r1+r2: return True
        elif abs(r1-r2)<D: return True
        elif abs(r1-r2)==D: return True



while True:
    sc.fill(pygame.Color(0,0,0))
    # Получение и обработка нажатий мыши
    for event in pygame.event.get():
        if event.type == pygame.MOUSEBUTTONDOWN:
            if event.button == 1:
                mpos = pygame.mouse.get_pos()
                newcircle = Crcl(mpos[0], mpos[1], 0, pygame.Color(randrange(150, 255), randrange(150, 255), randrange(150, 255)))
                Circles.append(newcircle)

    for Circle in Circles:
        if Circle.done == False:
            Circle.r += Speed
        pygame.draw.circle(
            sc,
            Circle.clr,
            pygame.Vector2(Circle.x,Circle.y),
            Circle.r,
            2,
        )

        for Circle2 in Circles:
            if Circle == Circle2:
                continue
            if IfCirclesTouch(Circle.x, Circle.y, Circle2.x, Circle2.y, Circle.r, Circle2.r):
                Circle.done = True
                Circle2.done = True

    pygame.display.flip()
    clock.tick(FPS)