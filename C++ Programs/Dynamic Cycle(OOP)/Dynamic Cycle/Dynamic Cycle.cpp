// Dynamic Cycle.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
#include <string>
using namespace std;

class CycleArray {
public:
    class elem {
    public:
        int info;
        elem* next = nullptr;
        elem(int info);
        elem();
    };

    elem* head = nullptr;


    elem* GetTail();
    void NewElem(int info);
    string GetData();
};

CycleArray::elem::elem(int info) {
    this->info = info;
}

CycleArray::elem::elem() {
}

CycleArray::elem* CycleArray::GetTail() {
    elem* mover = this->head;
    while (mover->next != this->head) mover = mover->next;
    
    return mover;
}

void CycleArray::NewElem(int info) {
    elem* NewElem = new elem(info);
    if (this->head == nullptr) {
        this->head = NewElem;
        NewElem->next = this->head;
    }
    else {
        NewElem->next = this->head;
        this->GetTail()->next = NewElem;
    }
}

string CycleArray::GetData() {
    string Data;
    elem* mover = this->head;
    while (mover->next != this->head) {
        Data += (to_string(mover->info) + "\n");
        mover = mover->next;
    }
    Data += (to_string(mover->info) + "\n");

    return Data;
}


int main()
{
    CycleArray Arr;
    for (int i = 0; i < 30; i++) {
        Arr.NewElem(i);
    }

    cout << Arr.GetData();
}
