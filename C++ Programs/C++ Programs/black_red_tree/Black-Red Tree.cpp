#include <iostream>
#include <string>

using namespace std;

// Красно-черное древо.

// Иниц. эл. древа
struct elem {
    elem* left = nullptr; // Левый потомок
    elem* right = nullptr; // Правый потомок
    string color = "r"; // Цвет узла
    string info; // Ключ узла
};


// Иниц. древа
struct tree {
    elem* head = nullptr; // Корень дерева
};


// Рекурсивный вывод дерева
// Формальные и входные параметры - корень дерева и уровень глубины(1) 
// Выходные данные - значения элементов дерева, цвет элементов
void print_Tree(elem* p, int level) {
    if(p != nullptr)
    {
        print_Tree(p->right,level + 1);
        for(int i = 0;i< level;i++) cout<<"   ";
        cout << p->info << p->color << endl;
        print_Tree(p->left,level + 1);
    }
}


// Получить буквенную часть ключа узла
// Формальные и входные параметры - узел 
// Выходные данные - буквенная часть узла
int GetChar(elem* p) {
    return int(p->info[0]);
}

// Получить числовую часть ключа узла
// Формальные и входные параметры - узел 
// Выходные данные - числовая часть узла
int GetNum(elem* p) {
    string str = "";
    for (int i = 1; i < 5; i++) {
        str += p->info[i];
    }
    return stoi(str);
}


// Центрированный или симметричный обход(по возрастанию)
// Формальные и входные параметры - корень дерева
// Выходные данные - значения элементов дерева, цвет элементов
void print_LNR(elem* &head) {
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
elem* GetParent(tree &tree, elem* child) {
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


// Поворот налево
// Формальные и входные параметры - дерево, узел который совершит поворот(отца указывать не надо)
// Выходные данные - нет
void RotateLeft(tree &tree, elem* el) {
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);

    Parent->right = el->left;
    el->left = Parent; 
    if (Parent != tree.head) {
        if (Grandparent->left == Parent) Grandparent->left = el;
        else if (Grandparent->right == Parent) Grandparent->right = el;
    }
    else {
        tree.head = el;
    }
}


// Поворот направо
// Формальные и входные параметры - дерево, узел который совершит поворот(отца указывать не надо)
// Выходные данные - нет
void RotateRight(tree &tree, elem* el) {
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);
    
    Parent->left = el->right;
    el->right = Parent; 
    if (Parent != tree.head) {
        if (Grandparent->right == Parent) Grandparent->right = el;
        else if (Grandparent->left == Parent) Grandparent->left = el;
    }
    else {
        tree.head = el;
    }
}


// Поиск элемента в дереве
// Формальные и входные параметры - корень дерева, ключ элемента который нужно найти
// Выходные данные - нужный элемент либо nullptr, если элемента нет в древе
elem* FindElem(elem* el, string info) {
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

    while(el->right != nullptr) {
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


// Проверяет и выравнивает баланс черной глубины древа после добавления нового элемента.
// Вызывать эту функцию отдельно при добавлении НЕ НУЖНО. Она сама вызывается после добавления нового элемента.
// Формальные и входные параметры - корень древа, добавленный элемент
// Выходные данные - нет
void CheckBalance(tree &tree, elem* el) {
    while (GetParent(tree, el) != nullptr && GetParent(tree, el)->color == "r") {
        elem* Parent = GetParent(tree, el);
        elem* Grandparent = GetParent(tree, Parent);
        if (Parent == Grandparent->left) {
            elem* Uncle = Grandparent->right;
            // 1 случай
            if (Uncle != nullptr && Uncle->color == "r") {
                Parent->color = "b";
                Uncle->color = "b";
                Grandparent->color = "r";
                el = Grandparent;
                if (el == tree.head) el->color = "b";
            }
            else {
                // 2 случай ИНОГДА
                if (el == Parent->right) {
                    el = Parent;
                    RotateLeft(tree, el->right);
                }
                elem* Parent = GetParent(tree, el);
                elem* Grandparent = GetParent(tree, Parent);
                // 3 случай ВСЕГДА
                Parent->color = "b";
                Grandparent->color = "r";
                RotateRight(tree, Grandparent->left);
            }
        }
        else {
            elem* Uncle = Grandparent->left;
            if (Uncle != nullptr && Uncle->color == "r") {
                Parent->color = "b";
                Uncle->color = "b";
                Grandparent->color = "r";
                el = Grandparent;
                if (el == tree.head) el->color = "b";
            }
            else {
                if (el == Parent->left) {
                    el = Parent;
                    RotateRight(tree, el->left);
                }
                elem* Parent = GetParent(tree, el);
                elem* Grandparent = GetParent(tree, Parent);
                Parent->color = "b";
                Grandparent->color = "r";
                RotateLeft(tree, Grandparent->right);
            }
        }  
    }
    tree.head->color = "b";
}

// Добавляет новый элемент в древо, запускает ф-ю проверки баланса
// Формальные и входные параметры - корень древа, ключ нового элемента
// Выходные данные - нет
void NewElem(tree &tree, string info) {
    if (FindElem(tree.head, info) != nullptr) {
        cout << "Element " << info << " is already exists." << endl;
        return;
    }

    elem* newelem = new elem();
    newelem->info = info;
    if (tree.head == nullptr) {
        newelem->color = "b";
        tree.head = newelem;
    } 
    else {
        elem* mover = tree.head;
        int ch = GetChar(newelem);
        int nb = GetNum(newelem);
        while (true) {
            int ch2 = GetChar(mover);
            int nb2 = GetNum(mover);
            if (ch == ch2) {
                if (nb >= nb2) {
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
            else {
                if (ch >= ch2) {
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
        cout << "-------------" << endl;
        print_Tree(tree.head, 0);
        cout << endl;
        CheckBalance(tree, newelem);
        cout << "-----Done:------" << endl;
        print_Tree(tree.head, 0);
        cout << endl;
    }
}


// Удаляет элемент у которого нет детей, либо ребенок только один. Меняет корректно связи.
// Вызывать функцию отдельно при удалении НЕ НАДО. Она сама вызывается в основной функции удаления
// Формальные и входные параметры - корень древа, удаляемый элемент.
// Выходные данные - нет
void DeleteElemSubfunc(tree &tree, elem* el) {
    elem* Parent = GetParent(tree, el);
    if (Parent != nullptr) {
        if( el->left == nullptr && el->right == nullptr ) {
            if (Parent->left == el) { 
                Parent->left = nullptr;
            } else {
                Parent->right = nullptr;
            } 
        }
        else if (el->right != nullptr) {
            if (Parent->left == el) { 
                Parent->left = el->right;
            } else {
                Parent->right = el->right;
            } 
        }
        else if (el->left != nullptr) {
            if (Parent->left == el) { 
                Parent->left = el->left;
            } else {
                Parent->right = el->left;
            } 
        }
    }
    delete el;

    
}

// Проверяет и выравнивает баланс черной глубины древа после удаления элемента
// Вызывать функцию отдельно при удалении НЕ НАДО. Она сама вызывается в основной функции удаления
// Формальные и входные параметры - корень древа, родитель удаленного элемента
// Выходные данные - нет
void DeleteBalance(tree &tree, elem* el, elem* child) {
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);

    // Если был один ребенок(второй null), то он 100% красный. красим его в черный -> правим баланс.
    if (child != nullptr && child->color == "r") child->color = "b";
    // Изменилась черная высота, и это плохо!
    else {
        // Если удаленный элемент справа
        if (el->right == nullptr || el->right == child) {
            elem* lchild = el->left;
            if (el->color == "r") {
                if (el->left->color == "b") {
                    if ((lchild->left == nullptr || lchild->left->color == "b") && (lchild->right == nullptr || lchild->right->color == "b")) {
                        el->color = "b";
                        lchild->color = "r";
                    }
                    else if (lchild->left->color == "r") {
                        lchild->color = "r";
                        lchild->left->color = "b";
                        el->color = "b";
                        RotateRight(tree, lchild);
                    }
                }
            }
            // Если родитель черный
            else {
                if (lchild->color == "r") {
                    // Если у правого потомка lchild черные дети
                    if (lchild->right != nullptr && (lchild->right->left == nullptr || lchild->right->left->color == "b") && (lchild->right->right == nullptr || lchild->right->right->color == "b")) {
                        lchild->color = "b";
                        lchild->right->color = "r";
                        RotateRight(tree, lchild);
                    }
                    // Если у правого потомка lchild левый потомок красный
                    else if (lchild->right != nullptr && lchild->right->left->color == "r") {
                        lchild->right->left->color = "b";
                        RotateLeft(tree, lchild->right);
                        RotateRight(tree, el->left);
                    }
                    else if (lchild->right->color == "r") {
                        lchild->color = "b";
                        el->color = "b";
                        RotateLeft(tree, lchild->right);
                        RotateRight(tree, el->left);
                    }
                }
                // И левый потомок черный
                else {
                    if (lchild->right != nullptr && lchild->right->color == "r") {
                        lchild->right->color = "b";
                        RotateLeft(tree, lchild->right);
                        RotateRight(tree, el->left);
                    }
                    else if ((lchild->left == nullptr || lchild->left->color == "b") && (lchild->right == nullptr || lchild->right->color == "b")) {
                        lchild->color = "r";
                        DeleteBalance(tree, GetParent(tree, el), el);
                    }
                    else if (lchild->left != nullptr && lchild->left->color == "r") {
                        lchild->left->color = "b";
                        RotateRight(tree, lchild);
                    }
                }
            }
        }
        // Если удаленный элемент слева
        else {
            elem* rchild = el->right;
            if (el->color == "r") {
                if (el->right->color == "b") {
                    // Есть a0014
                    if ((rchild->right == nullptr || rchild->right->color == "b") && (rchild->left == nullptr || rchild->left->color == "b")) {
                        el->color = "b";
                        rchild->color = "r";
                    }
                    // есть a0010
                    else if (rchild->right != nullptr && rchild->right->color == "r") {
                        rchild->color = "r";
                        rchild->right->color = "b";
                        el->color = "b";
                        RotateLeft(tree, rchild);
                    }
                    // есть !a0013
                    else if (rchild->left->color == "r") {
                        rchild->color = "b";
                        el->color = "b";
                        RotateRight(tree, rchild->left);
                        RotateLeft(tree, el->right);
                    }
                }
            }
            // Если родитель черный
            else {
                if (rchild->color == "r") {
                    // Если у правого потомка lchild черные дети
                    // да a0008
                    if (rchild->left != nullptr && (rchild->left->right == nullptr || rchild->left->right->color == "b") && (rchild->left->left == nullptr || rchild->left->left->color == "b")) {
                        rchild->color = "b";
                        rchild->left->color = "r";
                        RotateLeft(tree, rchild);
                    }
                    // Если у правого потомка lchild левый потомок красный
                    // да !!a0013. По-своему балансирует, не так как визуализатор. Тем не менее баланс высот сохраняется
                    else if (rchild->left != nullptr && rchild->left->right->color == "r") {
                        rchild->left->right->color = "b";
                        RotateRight(tree, rchild->left);
                        RotateLeft(tree, el->right);
                    }
                }
                // И левый потомок черный
                else {
                    //
                    if (rchild->left != nullptr && rchild->left->color == "r") {
                        rchild->left->color = "b";
                        RotateRight(tree, rchild->left);
                        RotateLeft(tree, el->right);
                    }
                    // Есть !!a0008
                    else if ((rchild->right == nullptr || rchild->right->color == "b") && (rchild->left == nullptr || rchild->left->color == "b")) {
                        rchild->color = "r";
                        DeleteBalance(tree, GetParent(tree, el), el);
                    }
                    // Есть !!a0010 (зеркально)
                    else if (rchild->right != nullptr && rchild->right->color == "r") {
                        rchild->right->color = "b";
                        RotateLeft(tree, rchild);
                    }
                }
            }
        } 
    }
}

// Основная функция удаления элемента из дерева. Удаляет элемент, вызывает функцию балансировки древа.
// Формальные и входные параметры - древо, ключ удаляемого элемента
// Выходные данные - нет
void DeleteElem(tree &tree, string info) {
    elem* ElementToDelete = FindElem(tree.head, info);
    if (ElementToDelete == nullptr) return;
    elem* child = nullptr;
    string elclr = ElementToDelete->color;
    elem* Parent = GetParent(tree, ElementToDelete);
    if (Parent == nullptr) {
    } else {
        if (ElementToDelete->left == nullptr || ElementToDelete->right == nullptr) {
            if (ElementToDelete->left != nullptr) child = ElementToDelete->left;
            else if (ElementToDelete->right != nullptr) child = ElementToDelete->right;

            string elclr = ElementToDelete->color;
            DeleteElemSubfunc(tree, ElementToDelete);
        }
        else {
            elem* max = FindMaxElem(ElementToDelete->left);

            if (max->left != nullptr) child = max->left;
            else if (max->right != nullptr) child = max->right;

            Parent = GetParent(tree, max);
            string elclr = max->color;
            ElementToDelete->info = max->info;
            DeleteElemSubfunc(tree, max);
        }
        if (elclr == "b") DeleteBalance(tree, Parent, child);
    } 
}




int main() {
    setlocale(LC_ALL, "Russian");
    tree tree;
    

    NewElem(tree, "a0010");
    NewElem(tree, "a0009");
    NewElem(tree, "a0008");
    NewElem(tree, "a0007");
    NewElem(tree, "a0012");
    NewElem(tree, "a0014");
    NewElem(tree, "b0001");

    /*NewElem(tree, "a0013");
    NewElem(tree, "a0015");*/

    //NewElem(tree, "a0099");
    //NewElem(tree, "a0055");


    NewElem(tree, "a0013");

    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;

    DeleteElem(tree, "a0014");
    
    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;

    cout << "Max elem: " << FindMaxElem(tree.head)->info << endl;
    cout << "Min elem: " << FindMinElem(tree.head)->info << endl;
    cout << "in-order, in-order right-to-left: " << endl;
    print_LNR(tree.head);
    cout << endl;
    print_LNR_FRL(tree.head);
    cout << endl;
    cout << "pre-order: " << endl;
    print_NLR(tree.head);
    cout << endl;
    cout << "post-order: " << endl;
    print_LRN(tree.head);
    cout << endl;
}