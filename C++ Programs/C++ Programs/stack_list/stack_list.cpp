#include <iostream>
#include <string>
using namespace std;

class Array {
public:
    class elem {
    public:
        string info;
        elem* next = nullptr;
        elem(string info);
        elem();
    };

    elem* head = nullptr;


    elem* GetTail();
    void NewElem(string info);
    void NewElem2(string info);
    void DeleteElem();
    string GetData();
};

Array::elem::elem(string info) {
    this->info = info;
}
Array::elem::elem() {
}

Array::elem* Array::GetTail() {
    elem* mover = this->head;
    while (mover->next != nullptr) mover = mover->next;
    
    return mover;
}

void Array::NewElem(string info) {
    elem* NewElem = new elem(info);
    if (this->head == nullptr) {
        this->head = NewElem;
    }
    else {
        NewElem->next = this->head;
        this->head = NewElem;
    }
}

void Array::NewElem2(string info) {
    const string arr_lett("AaEeIiOoUuYy");

    int counter = 0;
    for (int i = 0; i < info.length(); i++) {
        if (arr_lett.find(info[i], 0) != arr_lett.npos) counter++; else counter = 0;
        if (counter >= 2) {
            this->NewElem(info);
            break;
        }
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
        Data += (mover->info + "\n");
        mover = mover->next;
    }

    return Data;
}


int main()
{

    Array Arr;
    for (int i = 1; i <= 7; i++) {
        string info;
        cin >> info;
        Arr.NewElem(info);
    }

    string ElementToAdd;
    cin >> ElementToAdd;
    Arr.NewElem2(ElementToAdd);
    
    cout << endl;
    cout << Arr.GetData();
}

