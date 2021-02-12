#include <iostream>
#include <string>
#include <cmath>
#include <math.h>

using namespace std;

// Бинарное древо

// Иниц. эл. древа
struct elem {
    elem* left = nullptr; // Левый потомок
    elem* right = nullptr; // Правый потомок
    int info; // Ключ узла
};


// Иниц. древа
struct tree {
    elem* head = nullptr; // Корень дерева
};


// Рекурсивный вывод дерева
// Формальные и входные параметры - корень дерева и уровень глубины(1) 
// Выходные данные - значения элементов дерева, цвет элементов
void print_Tree(elem* p, int level) {
    if (p != nullptr)
    {
        print_Tree(p->right, level + 1);
        for (int i = 0; i < level; i++) std::cout << "   ";
        cout << p->info << endl;
        print_Tree(p->left, level + 1);
    }
}

// Центрированный или симметричный обход(по возрастанию)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_LNR(elem*& head) {
    if (head->left != nullptr) print_LNR(head->left);
    cout << head->info << " ";
    if (head->right != nullptr) print_LNR(head->right);
}


// Прямой обход(кто первый тот и выводится)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_NLR(elem*& head) {
    cout << head->info << " ";
    if (head->left != nullptr) print_NLR(head->left);
    if (head->right != nullptr) print_NLR(head->right);
}


// Обратный обход
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_LRN(elem*& head) {
    if (head->left != nullptr) print_NLR(head->left);
    if (head->right != nullptr) print_NLR(head->right);
    cout << head->info << " ";
}


// Справа налево
// Центрированный обход aka симметричный(по возрастанию)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_LNR_FRL(elem*& head) {
    if (head->right != nullptr) print_LNR(head->right);
    cout << head->info << " ";
    if (head->left != nullptr) print_LNR(head->left);
}


// Справа налево
// Прямой обход(кто первый тот и выводится)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_NLR_FRL(elem*& head) {
    cout << head->info << " ";
    if (head->right != nullptr) print_NLR(head->right);
    if (head->left != nullptr) print_NLR(head->left);
}


// Справа налево
// Обратный обход
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_LRN_FRL(elem*& head) {
    if (head->right != nullptr) print_NLR(head->right);
    if (head->left != nullptr) print_NLR(head->left);
    cout << head->info << " ";
}


// Поиск родителя элемента-наследника(если таковой есть)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
elem* GetParent(tree& tree, elem* child) {
    if (child == nullptr) return nullptr;
    elem* mover = tree.head;
    if (mover == child) return nullptr;

    while (mover->left != child && mover->right != child) {
        if (child->info >= mover->info)
            mover = mover->right;
        else mover = mover->left;
    }

    return mover;
}


// Очистка дерева от элементов
// Формальные и входные параметры - дерево, корень дерева
// Выходные данные - нет
void ClearTree(tree& tree, elem* el) {
    if (el->left != nullptr) ClearTree(tree, el->left);
    if (el->right != nullptr) ClearTree(tree, el->right);

    elem* Parent = GetParent(tree, el);
    if (Parent == nullptr) tree.head = nullptr;
    delete el;
}


// Поиск элемента в дереве
// Формальные и входные параметры - корень дерева, ключ элемента который нужно найти
// Выходные данные - нужный элемент либо nullptr, если элемента нет в древе
elem* FindElem(elem* el, int info) {
    if (el == nullptr) return nullptr;

    if (el->info == info) return el;

    elem* ElementToReturn = FindElem(el->left, info);
    if (ElementToReturn != nullptr) return ElementToReturn;

    ElementToReturn = FindElem(el->right, info);
    if (ElementToReturn != nullptr) return ElementToReturn;

    return nullptr;
}


// Находит максимальный элемент в древе/поддреве.
// Формальные и входные параметры - корень древа
// Выходные данные - максимальный элемент древа
elem* FindMaxElem(elem* el) {
    if (el == nullptr) return nullptr;

    while (el->right != nullptr) {
        el = el->right;
    }
    return el;
}


// Находит минимальный элемент в древе/поддреве.
// Формальные и входные параметры - корень древа
// Выходные данные - минимальный элемент древа
elem* FindMinElem(elem* el) {
    if (el == nullptr) return nullptr;

    while (el->left != nullptr) {
        el = el->left;
    }
    return el;
}


// Добавляет новый элемент в древо, запускает ф-ю проверки баланса
// Формальные и входные параметры - корень древа, ключ нового элемента
// Выходные данные - нет
void NewElem(tree& tree, int info) {
    if (FindElem(tree.head, info) != nullptr) {
        cout << "Element " << info << " is already exists." << endl;
        return;
    }

    elem* newelem = new elem();
    newelem->info = info;
    if (tree.head == nullptr) {
        tree.head = newelem;
    }
    else {
        elem* mover = tree.head;
        while (true) {
            if (info >= mover->info) {
                if (mover->right == nullptr) {
                    mover->right = newelem;
                    break;
                }
                else {
                    mover = mover->right;
                }
            }
            else {
                if (mover->left == nullptr) {
                    mover->left = newelem;
                    break;
                }
                else {
                    mover = mover->left;
                }
            }
        }
    }
}


// Удаляет элемент у которого нет детей, либо ребенок только один. Меняет корректно связи.
// Вызывать функцию отдельно при удалении НЕ НАДО. Она сама вызывается в основной функции удаления
// Формальные и входные параметры - корень древа, удаляемый элемент.
// Выходные данные - нет
void DeleteElemSubfunc(tree& tree, elem* el) {
    elem* Parent = GetParent(tree, el);
    if (Parent == nullptr) {
        if (el->left != nullptr) tree.head = el->left;
        if (el->right != nullptr) tree.head = el->right;
    }
    else {
        if (el->left == nullptr && el->right == nullptr) {
            if (Parent->left == el) {
                Parent->left = nullptr;
            }
            else {
                Parent->right = nullptr;
            }
        }
        else if (el->right != nullptr) {
            if (Parent->left == el) {
                Parent->left = el->right;
            }
            else {
                Parent->right = el->right;
            }
        }
        else if (el->left != nullptr) {
            if (Parent->left == el) {
                Parent->left = el->left;
            }
            else {
                Parent->right = el->left;
            }
        }
    }
    delete el;
}


// Основная функция удаления элемента из дерева. Удаляет элемент, вызывает функцию балансировки древа.
// Формальные и входные параметры - древо, ключ удаляемого элемента
// Выходные данные - нет
void DeleteElem(tree& tree, int info) {
    elem* ElementToDelete = FindElem(tree.head, info);
    if (ElementToDelete == nullptr) return;
    elem* Parent = GetParent(tree, ElementToDelete);

    if (ElementToDelete->left == nullptr || ElementToDelete->right == nullptr) {
        DeleteElemSubfunc(tree, ElementToDelete);
    }
    else {
        elem* max = FindMaxElem(ElementToDelete->left);

        Parent = GetParent(tree, max);
        ElementToDelete->info = max->info;
        DeleteElemSubfunc(tree, max);
    }
}

void print_NeterSqrt(elem*& head) {
    if (head == nullptr) return;
    if (head->left == nullptr && head->right == nullptr) return;
    if (head->left != nullptr) print_NeterSqrt(head->left);
    if (head->right != nullptr) print_NeterSqrt(head->right);
    
    double itgpt;
    if (modf((double)sqrt(abs(head->info)), &itgpt) == 0) {
        cout << head->info << endl;
    }
}



int main() {
    setlocale(LC_ALL, "Russian");
    int input;
    tree tree;
    bool end = false;
    int keysamount = 7;

    while (end != true) {
        cout << "1 - добавить новый элемент\n2 - удалить элемент\n3 - очистить дерево\n4 - вывести дерево\n5 - найти элемент\n6 - найти минимальный элемент дерева.\n7 - выйти\n";
        int userkey = -1;
        cin >> userkey;
        while (userkey < 1 || userkey > keysamount) {
            cout << "Некорректный ввод. Введите еще раз: ";
            cin >> userkey;
        }

        switch (userkey)
        {
        case 1:
            cout << "Хотите добавить свой ключ или случайный?\n1 - свой\n2 - случайный\n";
            input = 0;
            cin >> input;
            while (input < 1 || input > keysamount) {
                cout << "Некорректный ввод. Введите еще раз: ";
                cin >> input;
            }
            if (input == 1) {
                cout << "Введите ключ элемента: ";
                cin >> input;
                NewElem(tree, input);
            }
            else {
                NewElem(tree, rand()%100);
            }
            
            break;
        case 2:
            cout << "Введите ключ элемента: ";
            cin >> input;
            DeleteElem(tree, input);
            break;
        case 3:
            cout << "Дерево очищено";
            ClearTree(tree, tree.head);
            break;
        case 4:
            cout << "-------------" << endl;
            print_Tree(tree.head, 0);
            cout << endl;
            break;
        case 5:
            cout << "Введите ключ элемента: ";
            cin >> input;
            cout << endl << FindElem(tree.head, input) << endl;
            break;
        case 6:
            cout << "\nАдрес в оперативной памяти минимального элемента в дереве: ";
            cout << FindMinElem(tree.head);
            cout << "\nЕго значение - ";
            cout << FindMinElem(tree.head)->info;
            cout << endl;
            break;
        case 7:
            end = true;
            break;
        }
    }
}