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


void DeleteBalance(tree &tree, elem* el) {
    while (el != tree.head && (el == nullptr || el->color == "b")) {
        elem* Parent = GetParent(tree, el);
        elem* Grandparent = GetParent(tree, Parent);
        if (el == Parent->left) {
            elem* Brother = Parent->right;
            // Если брат красный - 1 случай
            if (Brother->color == "r") {
                Brother->color = "b";
                Parent->color = "r";
                RotateLeft(tree, Parent->right);
                Brother = Parent->right;
            }
            // Если брат черный,и у него дети черные - 2 случай
            if ((Brother->left == nullptr || Brother->left->color == "b") && (Brother->right == nullptr || Brother->right->color == "b")) {
                Brother->color = "r";
                el = Parent;
            }
            // Если брат черный, а внутренний ребенок - красный
            else {
                if (Brother->left != nullptr && Brother->left->color == "r") {
                    Brother->left->color = "b";
                    Brother->color = "r";
                    RotateRight(tree, Brother->left);
                    Brother = Parent->right;
                }
                Brother->color = Parent->color;
                Parent->color = "b";
                if (Brother->right != nullptr) Brother->right->color = "b";
                RotateLeft(tree, Parent->right);
                el = tree.head;
            }
        }
        else {
            elem* Brother = Parent->left;
            // Если брат красный - 1 случай
            if (Brother->color == "r") {
                Brother->color = "b";
                Parent->color = "r";
                RotateRight(tree, Parent->left);
                Brother = Parent->left;
            }
            // Если брат черный,и у него дети черные - 2 случай
            if ((Brother->right == nullptr || Brother->right->color == "b") && (Brother->left == nullptr || Brother->left->color == "b")) {
                Brother->color = "r";
                el = Parent;
            }
            // Если брат черный, а внутренний ребенок - красный
            else {
                if (Brother->right != nullptr && Brother->right->color == "r") {
                    Brother->right->color = "b";
                    Brother->color = "r";
                    RotateLeft(tree, Brother->right);
                    Brother = Parent->left;
                }
                Brother->color = Parent->color;
                Parent->color = "b";
                if (Brother->left != nullptr) Brother->left->color = "b";
                RotateRight(tree, Parent->left);
                el = tree.head;
            }
        }
    }
    el->color = "b";
}

void DeleteElem(tree &tree, string info) {
    elem* ElementToDelete = FindElem(tree.head, info);
    if (ElementToDelete == nullptr) return;
    string elclr = ElementToDelete->color;
    elem* Parent = GetParent(tree, ElementToDelete);
    if (Parent == nullptr) {
    } else {
        if (ElementToDelete->left == nullptr || ElementToDelete->right == nullptr) {
            string elclr = ElementToDelete->color;
            DeleteElemSubfunc(tree, ElementToDelete);
        }
        else {
            elem* max = FindMaxElem(ElementToDelete->left);
            Parent = GetParent(tree, max);
            string elclr = ElementToDelete->color;
            ElementToDelete->info = max->info;
            DeleteElemSubfunc(tree, max);
        }
        if (elclr == "b") DeleteBalance(tree, Parent);
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

    // Не работает сука ебаная
    DeleteElem(tree, "a0010");

    
    
    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;

}