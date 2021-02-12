#include <stdlib.h>
#include <iostream>
#include <math.h> 
#include <vector>
#include <SFML/Graphics.hpp>
#include <time.h> 

using namespace std;
using namespace sf;

/*ФУНКЦИЯ ОПРЕДЕЛЯЮЩАЯ ЧИСЛО ОБЩИХ ТОЧЕК ДВУХ ОКРУЖНОСТЕЙ*/
int Tochek(int x1, int y1, float R1, int x2, int y2, float R2)
{
    double D = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)); 
    if (D == 0)
    {
        if (R1 != R2) return 0; else { return 1; }
    }
    else
        if (D > (double)R1 + (double)R2) { return 0; }
        else if (D == (double)R1 + (double)R2) { return 1; }
        else if (abs(R1 - R2) < D) { return 2; }
        else if (abs(R1 - R2) == D) { return 1; }
    return 0;
}

struct ResultData {
    CircleShape Circle1;
    CircleShape Circle2;
    int time;
};

int main()
{
    srand(time(0));
    setlocale(LC_ALL, "Russian");

    int SPEED = 1;
    int SIZE = 800;
    int FPS = 60;

    int time = 0;
    bool end = false;

    RenderWindow window(VideoMode(SIZE, SIZE), "Circles");
    window.setFramerateLimit(FPS);

    vector<CircleShape> Circles;
    vector<bool> CircleFreeze;
    vector<ResultData> Result;

    /*for (int i = 0; i < 3; i++) {
        CircleShape shape(15.0f);
        shape.setOrigin(shape.getRadius(), shape.getRadius());
        shape.setPosition( (rand() % SIZE), (rand()%SIZE) );
        shape.setOutlineColor(Color(255, 255, 255));
        shape.setOutlineThickness(2);
        shape.setFillColor(Color(0, 0, 0, 0));
        Circles.push_back(shape);
        CircleFreeze.push_back(false);
    }*/

    CircleShape shape(15.0f);
    shape.setOrigin(shape.getRadius(), shape.getRadius());
    shape.setPosition(0, 0);
    shape.setOutlineColor(Color(255, 255, 255));
    shape.setOutlineThickness(2);
    shape.setFillColor(Color(0, 0, 0, 0));
    Circles.push_back(shape);
    CircleFreeze.push_back(false);

    CircleShape shape2(15.0f);
    shape2.setOrigin(shape2.getRadius(), shape2.getRadius());
    shape2.setPosition(599, 599);
    shape2.setOutlineColor(Color(255, 255, 255));
    shape2.setOutlineThickness(2);
    shape2.setFillColor(Color(0, 0, 0, 0));
    Circles.push_back(shape2);
    CircleFreeze.push_back(false);

    int msgtimer = 0;
    while (window.isOpen())
    {
        time++;
        Event event;
        while (window.pollEvent(event))
        {
            if (event.type == Event::Closed) {
                window.close();
            }
        }
        

        window.clear();
        int checker = false;
        for (int i = 0; i < Circles.size(); i++) {
            window.draw(Circles[i]);
            for (int j = 0; j < Circles.size(); j++) {
                if (i == j) continue;
                if (CircleFreeze[i] == true && CircleFreeze[j] == true) continue;
                if (
                    Tochek(
                        Circles[i].getPosition().x,
                        Circles[i].getPosition().y,
                        Circles[i].getRadius(),
                        Circles[j].getPosition().x,
                        Circles[j].getPosition().y,
                        Circles[j].getRadius()
                    ) > 0) 
                {
                    CircleFreeze[i] = true;
                    CircleFreeze[j] = true;
                    ResultData res;
                    res.Circle1 = Circles[i];
                    res.Circle2 = Circles[j];
                    res.time = time;
                    Result.push_back(res);
                }
                
                if (CircleFreeze[i] == false) {
                    Circles[i].setRadius(Circles[i].getRadius() + SPEED);
                    Circles[i].setOrigin(Circles[i].getRadius(), Circles[i].getRadius());
                    checker = true;
                }
            }
        }  
        if (checker == false) {
            for (ResultData data : Result) {
                cout << data.Circle1.getRadius() << " " << data.Circle2.getRadius() << " " << data.time << endl;
            }
            window.close();
        }

        window.display();
    }

    return 0;
}