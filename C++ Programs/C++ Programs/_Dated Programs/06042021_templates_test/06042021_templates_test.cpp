#include <iostream>

using namespace std;

class Example { // Создание класса Example
private:
    int info; // внутри объектов будет значение info
public:
    void SetInfo(int info) { this->info = info; }

    friend bool operator== (const Example& d1, const Example& d2); // Объявление перегрузки оператора сравнения
};

bool operator== (const Example& e1, const Example& e2) { // Перегрузка оператора сравнения для класса
    return e1.info == e2.info;
}


template <typename T>
bool FindInArray(T* arr[], const int& size, const T& findElem) // Функция поиска элемента в массиве, где T - любой тип 
{
    for (int i = 0; i < size; i++) {
        if (*arr[i] == findElem) return true; // Если нашли возвращаем true
    }
    return false; // Иначе False
}

int main()
{
    const int size = 30;
    Example* arr[size]; // Массив указателей на объекты example
    for (int i = 0; i < size; i++) { 
        arr[i] = new Example(); // Заполняем его
        (*arr[i]).SetInfo(i);
    }

    Example ex = Example();
    ex.SetInfo(33);
    cout << FindInArray(arr, size, ex) << endl; // Проверяем


    const int size2 = 40;
    int* arr2[size2]; // Массив указателей на целочисленные объекты
    for (int i = 0; i < size2; i++) {
        arr2[i] = new int(30); // Заполняем
    }
    cout << FindInArray(arr2, size2, 31); // Проверяем
}
