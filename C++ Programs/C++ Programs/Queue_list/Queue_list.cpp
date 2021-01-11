#include <iostream>
#include <string>
using namespace std;

class Array {
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
    void NewElem2();
    void DeleteElem();
    string GetData();
};

Array::elem::elem(int info) {
    this->info = info;
}
Array::elem::elem() {
}

Array::elem* Array::GetTail() {
    elem* mover = this->head;
    while (mover->next != nullptr) mover = mover->next;

    return mover;
}

void Array::NewElem(int info) {
    elem* NewElem = new elem(info);
    if (this->head == nullptr) {
        this->head = NewElem;
    }
    else {
        this->GetTail()->next = NewElem;
    }
}

void Array::NewElem2() {
    elem* mover = this->head;
    int info = INT_MIN;
    while (mover != nullptr) {
        if (mover->info > info) info = mover->info;
        mover = mover->next;
    }

    elem* NewElem = new elem(info);
    if (this->head == nullptr) {
        this->head = NewElem;
    }
    else {
        this->GetTail()->next = NewElem;
    }
}


void Array::DeleteElem() {
    elem* ElemToDel = this->head;
    this->head = this->head->next;
    delete ElemToDel;
}

string Array::GetData() {
    string Data;
    elem* mover = this->head;
    while (mover != nullptr) {
        Data += (to_string(mover->info) + "\n");
        mover = mover->next;
    }

    return Data;
}


int main()
{


    Array Arr;
    for (int i = 1; i <= 15; i++) {
        int info = -5;
        while (info < -4 || info > 25) {
            cout << "Enter " << i << " element: ";
            cin >> info;
        }
        Arr.NewElem(info);
    }

    Arr.NewElem2();
    cout << endl;
    cout << Arr.GetData();
}

