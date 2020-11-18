#include <iostream>
#include <string>

using namespace std;

struct elem {
    elem* left = nullptr;
    elem* right = nullptr;
    string color = "r";
    string info;
};

struct tree {
    elem* head = nullptr;
};


void print_Tree(elem* p, int level) {
    if(p != nullptr)
    {
        print_Tree(p->right,level + 1);
        for(int i = 0;i< level;i++) cout<<"   ";
        cout << p->info << p->color << endl;
        print_Tree(p->left,level + 1);
    }
}

int GetChar(elem* p) {
    return int(p->info[0]);
}

int GetNum(elem* p) {
    string str = "";
    for (int i = 1; i < 5; i++) {
        str += p->info[i];
    }
    return stoi(str);
}


// Центрированный обход aka симметричный(по возрастанию)
void print_LNR(elem* &head) {
    if (head->left != nullptr) print_LNR(head->left);
    cout << head->info << " ";
    if (head->right != nullptr) print_LNR(head->right);
}

// Прямой обход(кто первый тот и выводится)
void print_NLR(elem*& head) {
    cout << head->info << " ";
    if (head->left != nullptr) print_NLR(head->left);
    if (head->right != nullptr) print_NLR(head->right);
}

// Обратный обход
void print_LRN(elem*& head) {
    if (head->left != nullptr) print_NLR(head->left);
    if (head->right != nullptr) print_NLR(head->right);
    cout << head->info << " ";
}

// Справа налево
// Центрированный обход aka симметричный(по возрастанию)
void print_LNR_FRL(elem*& head) {
    if (head->right != nullptr) print_LNR(head->right);
    cout << head->info << " ";
    if (head->left != nullptr) print_LNR(head->left);
}

// Справа налево
// Прямой обход(кто первый тот и выводится)
void print_NLR_FRL(elem*& head) {
    cout << head->info << " ";
    if (head->right != nullptr) print_NLR(head->right);
    if (head->left != nullptr) print_NLR(head->left);
}

// Справа налево
// Обратный обход
void print_LRN_FRL(elem*& head) {
    if (head->right != nullptr) print_NLR(head->right);
    if (head->left != nullptr) print_NLR(head->left);
    cout << head->info << " ";
}


// Поиск родителя элемента-наследника(если таковой есть)
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

void ClearTree(tree& tree, elem* el) {
    if (el->left != nullptr) ClearTree(tree, el->left);
    if (el->right != nullptr) ClearTree(tree, el->right);

    elem* Parent = GetParent(tree, el);
    if (Parent == nullptr) tree.head = nullptr;
    delete el;
}

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
elem* FindMaxElem(elem* el) {
    if (el == nullptr) return nullptr;

    while(el->right != nullptr) {
        el = el->right;
    }
    return el;
}

elem* FindMinElem(elem* el) {
    if (el == nullptr) return nullptr;

    while (el->left != nullptr) {
        el = el->left;
    }
    return el;
}


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
                else {
                    Parent->color = "b";
                    Grandparent->color = "r";
                    RotateLeft(tree, Grandparent->right);
                }
            }
        }  
    }
    tree.head->color = "b";
}


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
        CheckBalance(tree, newelem);
        
    }
}


// Удаляет элемент у которого нет детей, либо ребенок только один.
// Меняет корректно связи.
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


void DeleteBalance(tree &tree, elem* el, elem* child) {
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);

    // Если был один ребенок(второй null), то он 100% красный. красим его в черный -> правим баланс.
    if (child != nullptr && child->color == "r") child->color = "b";
    // Изменилась черная высота, и это пизда!
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
                        lchild->color = "b"; // НЕ УВЕРЕН, ЭТО НЕ ТОЧНО
                        lchild->right->color = "r";
                        RotateRight(tree, lchild);
                    }
                    // Если у правого потомка lchild левый потомок красный
                    else if (lchild->right != nullptr && lchild->right->left->color == "r") {
                        lchild->right->left->color = "b";
                        RotateLeft(tree, lchild->right);
                        RotateRight(tree, el->left);
                    }
                }
                // И левый потомок черный
                else {
                    if (lchild->right->color == "r") {
                        lchild->right->color = "b";
                        RotateLeft(tree, lchild->right);
                        RotateRight(tree, el->left);
                    }
                    else if ((lchild->left == nullptr || lchild->left->color == "b") && (lchild->right == nullptr || lchild->right->color == "b")) {
                        lchild->color = "r";
                        DeleteBalance(tree, GetParent(tree, el), el);
                    }
                }
            }
        }
        // Если удаленный элемент слева
        else {
            elem* rchild = el->right;
            if (el->color == "r") {
                if (el->right->color == "b") {
                    if ((rchild->right == nullptr || rchild->right->color == "b") && (rchild->left == nullptr || rchild->left->color == "b")) {
                        el->color = "b";
                        rchild->color = "r";
                    }
                    else if (rchild->right->color == "r") {
                        rchild->color = "r";
                        rchild->right->color = "b";
                        el->color = "b";
                        RotateLeft(tree, rchild);
                    }
                }
            }
            // Если родитель черный
            else {
                if (rchild->color == "r") {
                    // Если у правого потомка lchild черные дети
                    if (rchild->left != nullptr && (rchild->left->right == nullptr || rchild->left->right->color == "b") && (rchild->left->left == nullptr || rchild->left->left->color == "b")) {
                        rchild->color = "b"; // НЕ УВЕРЕН, ЭТО НЕ ТОЧНО
                        rchild->left->color = "r";
                        RotateLeft(tree, rchild);
                    }
                    // Если у правого потомка lchild левый потомок красный
                    else if (rchild->left != nullptr && rchild->left->right->color == "r") {
                        rchild->left->right->color = "b";
                        RotateRight(tree, rchild->left);
                        RotateLeft(tree, el->right);
                    }
                }
                // И левый потомок черный
                else {
                    if (rchild->left->color == "r") {
                        rchild->left->color = "b";
                        RotateRight(tree, rchild->left);
                        RotateLeft(tree, el->right);
                    }
                    else if ((rchild->right == nullptr || rchild->right->color == "b") && (rchild->left == nullptr || rchild->left->color == "b")) {
                        rchild->color = "r";
                        DeleteBalance(tree, GetParent(tree, el), el);
                    }
                }
            }
        } 
    }
}

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
    tree tree;

    NewElem(tree, "a0010");
    NewElem(tree, "a0009");
    NewElem(tree, "a0008");
    NewElem(tree, "a0007");
    NewElem(tree, "a0012");
    NewElem(tree, "a0014");
    NewElem(tree, "a0016");

    NewElem(tree, "a0010");

    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;

    DeleteElem(tree, "a0010");


    
    
    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;

}