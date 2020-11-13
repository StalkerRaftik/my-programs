#include <iostream>
#include <string>

using namespace std;

struct elem {
    elem* left = nullptr;
    elem* right = nullptr;
    string color = "r";
    int info;
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


// Рекурсивный алгоритм вывода элементов по возрастанию
void print_ElementsAscenging(elem* &head) {
    if (head->left != nullptr) print_ElementsAscenging(head->left);
    cout << head->info << " ";
    if (head->right != nullptr) print_ElementsAscenging(head->right);
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


void RotateLeft(tree &tree, elem* el) {
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);

    Parent->right = el->left;
    el->left = Parent; 
    if (Parent != tree.head) {
        if (Grandparent->left == Parent) Grandparent->left = el;
        else if (Grandparent->right == Parent) Grandparent->right = el;
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
}


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
elem* FindMaxElem(elem* el) {
    if (el == nullptr) return nullptr;

    while(el->right != nullptr) {
        el = el->right;
    }
    return el;
}


void CheckBalance(tree &tree, elem* el) {
    cout << "Проверка..." << endl;
    //print_Tree(tree.head, 0);
    elem* Parent = GetParent(tree, el);
    elem* Grandparent = GetParent(tree, Parent);
    if (el == nullptr || Parent == nullptr || Grandparent == nullptr) return;

    if (GetParent(tree, el)->color == "r" && el->color == "r") {
        cout << "problem detected" << endl;
        
        if (Grandparent->right == Parent) {
            cout << "case 1" << endl;
            if (Parent->left == el) {
                RotateRight(tree, el);
                CheckBalance(tree, Parent);
            } else if (Parent->right == el) {
                if ( Grandparent->left == nullptr || Grandparent->left->color == "b" ) {
                    RotateLeft(tree, Parent);
                    Parent->color = "b";
                    Grandparent->color = "r";
                    el->color = "r";
                    if (Grandparent == tree.head) {
                        tree.head = Parent;
                        Parent->color = "b";
                    }
                    // Нужны ли проверки снизу?
                    CheckBalance(tree, el);
                    CheckBalance(tree, Parent);
                    CheckBalance(tree, Grandparent);
                } else if (Grandparent->left->color == "r") {
                    Parent->color = "b";
                    Grandparent->left->color = "b";
                    if (Grandparent != tree.head) {
                        Grandparent->color = "r";
                    }

                    CheckBalance(tree, Parent);
                    CheckBalance(tree, Grandparent);
                }
            }
        } else if (Grandparent->left == Parent) {
            cout << "case 2" << endl;
            if (Parent->right == el) {
                RotateLeft(tree, el);
                CheckBalance(tree, Parent);
            } else if (Parent->left == el) {
                if ( Grandparent->right == nullptr || Grandparent->right->color == "b" ) {
                    RotateRight(tree, Parent);
                    Parent->color = "b";
                    Grandparent->color = "r";
                    el->color = "r";
                    if (Grandparent == tree.head) {
                        tree.head = Parent;
                        Parent->color = "b";
                    }
                    // Нужны ли проверки снизу?
                    CheckBalance(tree, el);
                    CheckBalance(tree, Parent);
                    CheckBalance(tree, Grandparent);
                } else if (Grandparent->right->color == "r") {
                    Parent->color = "b";
                    Grandparent->right->color = "b";
                    if (Grandparent != tree.head) {
                        Grandparent->color = "r";
                    }

                    CheckBalance(tree, Parent);
                    CheckBalance(tree, Grandparent);
                }
            }
        }
    }
}


void NewElem(tree &tree, int info) {
    elem* newelem = new elem();
    newelem->info = info;
    if (tree.head == nullptr) {
        newelem->color = "b";
        tree.head = newelem;
    } 
    else {
        elem* mover = tree.head;
        bool ok = false;
        while (ok != true) {
            if (newelem->info >= mover->info) {
                if (mover->right == nullptr) {
                    mover->right = newelem;
                    ok = true;
                } 
                else {
                    mover = mover->right;
                } 
            }
            else {
                if (mover->left == nullptr) {
                    mover->left = newelem;
                    ok = true;
                } 
                else {
                    mover = mover->left;
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


void DeleteBalance(tree &tree, elem* Parent, string elcolor) {
    if (elcolor == "r") return;

    if (elcolor == "b") {
        elem* sibling = Parent->left != nullptr ? Parent->left : (Parent->right != nullptr ? Parent->right : nullptr);
        if (sibling == nullptr || sibling->color == "b") {
            if (Parent->right == nullptr) {
                if(sibling->left != nullptr && sibling->left->color == "r") {
                    RotateRight(tree, sibling);
                    sibling->color = "r";
                    sibling->left->color = "b";
                    Parent->color = "b";
                }
                else if (sibling->left == nullptr || sibling->left->color == "b") {
                    sibling->color = "r";
                    sibling->right->color = "b";
                    RotateLeft(tree, sibling->right);
                    
                    DeleteBalance(tree, Parent, elcolor);
                }
                // Оба ребенка брата - черные
                else if( (sibling->left == nullptr || sibling->left->color == "b") && (sibling->right == nullptr || sibling->right->color == "b") ) {
                    sibling->color = "r";
                    Parent->color = "b";
                }
            }
        }
        else if (sibling->color == "r") {
            RotateRight(tree, sibling);
            if (Parent == tree.head) {
                tree.head = sibling;
            }
            sibling->color = "b";
            Parent->color = "r";
            DeleteBalance(tree, Parent, elcolor);
        }
    }

}

void DeleteElem(tree &tree, int info) {
    elem* ElementToDelete = FindElem(tree.head, info);
    string elclr = ElementToDelete->color;
    elem* Parent = GetParent(tree, ElementToDelete);
    if (Parent == nullptr) {
    } else {
        if (ElementToDelete->left == nullptr && ElementToDelete->right == nullptr) {
            string elclr = ElementToDelete->color;
            DeleteElemSubfunc(tree, ElementToDelete);

            if (elclr == "b") DeleteBalance(tree, Parent, elclr);
        }
        else if (ElementToDelete->left != nullptr && ElementToDelete->right == nullptr) {
            elem* max = FindMaxElem(ElementToDelete->left);
            string maxclr = max->color;
            int maxinfo = max->info;
            DeleteElemSubfunc(tree, max);
            ElementToDelete->info = maxinfo;

            if (elclr == "b") DeleteBalance(tree, Parent, maxclr);
        }
        else if (ElementToDelete->left == nullptr && ElementToDelete->right != nullptr) {
            elem* child = ElementToDelete->right;
            DeleteElemSubfunc(tree, ElementToDelete);
            child->color = "b";
        }
    } 
}




int main() {
    tree tree;

    NewElem(tree, 10);
    NewElem(tree, 9);
    NewElem(tree, 8);
    NewElem(tree, 7);
    NewElem(tree, 6);
    NewElem(tree, 5);
    NewElem(tree, 4);
    NewElem(tree, 16);
    NewElem(tree, 15);
    NewElem(tree, 12);
    NewElem(tree, 14);

    DeleteElem(tree, 10);
    DeleteElem(tree, 12);

    
    cout << "-------------" << endl;
    print_Tree(tree.head, 0);
    cout << endl;
}