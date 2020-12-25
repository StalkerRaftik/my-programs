#include <iostream>
#include <string> 
#include <time.h>
#include <vector>
using namespace std;

class Student {
public:
    int mratio;
    int hratio;
    int eratio;
    string fraction;


    int hp;
    int cash = 500;

    Student(int mratio, int hratio, int eratio) {
        this->mratio = mratio;
        this->hratio = hratio;
        this->eratio = eratio;
    }

    virtual int GetCount() = 0;
    virtual void SetCountMinusOne() = 0;
    virtual void SetStartHP() = 0;
};

class Mathematician : public Student {
private:
    static int count;
public:
    Mathematician(int mratio, int hratio, int eratio):Student(mratio, hratio, eratio) { this->count++; }

    void SetStartHP() override {
        this->hp = mratio * 1.1 + hratio * 0.9 + eratio * 0.9;
    }

    int GetCount() override {
        return this->count;
    }

    void SetCountMinusOne() override {
        this->count--;
    }
};
int Mathematician::count = 0;

class Engineer : public Student {
private:
    static int count;
public:
    Engineer(int mratio, int hratio, int eratio) :Student(mratio, hratio, eratio) { this->count++; }

    void SetStartHP() override {
        this->hp = mratio * 0.9 + hratio * 0.9 + eratio * 1.1;
    }

    int GetCount() override {
        return this->count;
    }

    void SetCountMinusOne() override {
        this->count--;
    }
};
int Engineer::count = 0;

class Humanities : public Student {
private:
    static int count;
public:
    Humanities(int mratio, int hratio, int eratio) :Student(mratio, hratio, eratio) { this->count++; }

    void SetStartHP() override {
        this->hp = mratio * 0.9 + hratio * 1.1 + eratio * 0.9;
    }

    int GetCount() override {
        return this->count;
    }

    void SetCountMinusOne() override {
        this->count--;
    }
};
int Humanities::count = 0;

class Gyms : public Student {
private:
    static int count;
public:
    Gyms(int mratio, int hratio, int eratio) :Student(mratio, hratio, eratio) { this->count++; }

    void SetStartHP() override {
        this->hp = (mratio * 0.8 + hratio * 0.8 + eratio * 0.8) * 1.1;
    }

    int GetCount() override {
        return this->count;
    }

    void SetCountMinusOne() override {
        this->count--;
    }
};
int Gyms::count = 0;

void Fight(Student* s1, Student* s2, Student* Mas[], int size) {
    if (s1->hp == s2->hp || s1->cash == 0 || s2->cash == 0) return;

    cout << "-------БИТВА---------" << "\n" << s1->fraction << "(" << s1->hp << ") VS " << s2->fraction << "(" << s2->hp << ")!" << endl;


    Student* winner = s1->hp > s2->hp ? s1 : s2;
    Student* loser = s1->hp > s2->hp ? s2 : s1;
    cout << winner->fraction << "(" << winner->hp << ") ПОБЕДИЛ!" << endl << "---------------------\n\n";
    winner->cash += loser->cash * 0.5;
    winner->hp *= 1.01;

    if (winner->fraction == loser->fraction) {
        loser->cash = 0;
        loser->SetCountMinusOne();
    }
    else {
        loser->SetCountMinusOne();
        int cashforfractionmembers = (loser->cash * 0.5) / winner->GetCount();
        for (int i = 0; i < size; i++) {
            if (Mas[i]->fraction == winner->fraction && Mas[i]->cash != 0) {
                Mas[i]->cash += cashforfractionmembers;
                Mas[i]->hp *= 1.005;
            }
        }
        loser->cash = 0;
    }
}

int main() {
    srand(time(0));
    setlocale(LC_ALL, "RUS");
    Student* Students[100];

    for (int i = 0; i < 100; i++) {
        switch (rand() % 4 + 1) {
        case 1:
            Students[i] = new Mathematician(rand() % 101, rand() % 101, rand() % 101);
            Students[i]->fraction = "Математики";
            Students[i]->SetStartHP();
            break;
        case 2:
            Students[i] = new Gyms(rand() % 101, rand() % 101, rand() % 101);
            Students[i]->fraction = "Качки";
            Students[i]->SetStartHP();
            break;
        case 3:
            Students[i] = new Humanities(rand() % 101, rand() % 101, rand() % 101);
            Students[i]->fraction = "Гуманитарии";
            Students[i]->SetStartHP();
            break;
        case 4:
            Students[i] = new Engineer(rand() % 101, rand() % 101, rand() % 101);
            Students[i]->fraction = "Инженеры";
            Students[i]->SetStartHP();
            break;
        }
    }

    for (int i = 0; i < 16000; i++) {
        Fight(Students[rand() % 100], Students[rand() % 100], Students, 100);
    }

    for (int i = 0; i < 100; i++) {
        if (Students[i]->cash == 0) continue;
        cout << Students[i]->cash << "\n" << Students[i]->hp << "\n" << Students[i]->fraction << "\n--------------\n";
    }
}