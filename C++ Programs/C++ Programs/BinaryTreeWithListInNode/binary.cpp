#include <iostream>
#include < Windows.h >
using namespace std;

struct Elem {
	char info;
	int number;
	Elem* next = nullptr;
	Elem* pred = nullptr;
};

struct Node {//Звено дерева
	Elem* list = nullptr;
	Node* left = nullptr;
	Node* right = nullptr;//Адресные поля
};


//Очистка дерева
void clear(Node*& Tree) {
	if (Tree != nullptr) {//Пока не встретилось пустое звено
		clear(Tree->left);//Рекурсивная функция прохода по левому поддереву
		clear(Tree->right);//Рекурсивгая функция прохода по правому поддереву
		Elem* mover = Tree->list;
		Elem* nexttodel = nullptr;
		while (mover != nullptr) {
			nexttodel = mover->next;
			delete mover;
			mover = nexttodel;
		}
		delete Tree;//Удаление конечного элемента дерева
		Tree = nullptr;//Обнуление дерева
	}
}

//Функция добавления элемента в дерево
void add_node(char i, int x, Node*& MyTree) {
	if (MyTree == nullptr) {//Если дерева нет
		MyTree = new Node;//Выделяем память под звено дерева
		MyTree->list = new Elem;
		MyTree->list->info = i;
		MyTree->list->number = x;//Записываем номер в звено
	}
	else if (MyTree != nullptr) {
		if (i < MyTree->list->info) {//Если новый элемент меньше
			if (MyTree->left != nullptr) add_node(i, x, MyTree->left);
			else {
				MyTree->left = new Node;//Выделяем память левому подзвену
				MyTree->left->list = new Elem;
				MyTree->left->list->info = i;
				MyTree->left->list->number = x;//В левое звено записываем значение
			}
		}
		else if (i > MyTree->list->info) {//Если новый элемент больше, либо равен
			if (MyTree->right != nullptr) add_node(i, x, MyTree->right);
			else {
				MyTree->right = new Node;//Выделяем память левому подзвену
				MyTree->right->list = new Elem;
				MyTree->right->list->info = i;
				MyTree->right->list->number = x;//В левое звено записываем значение
			}
		}
		else if ((i == MyTree->list->info) && (x != MyTree->list->number)) {//Если буквы нового элемента равны, а числа нет
			if (x < MyTree->list->number) {//Если новый элемент меньше
				if (MyTree->left != nullptr) add_node(i, x, MyTree->left);
				else {
					MyTree->left = new Node;//Выделяем память левому подзвену
					MyTree->left->list = new Elem;
					MyTree->left->list->info = i;
					MyTree->left->list->number = x;//В левое звено записываем значение
				}
			}
			else if (x > MyTree->list->number) {//Если новый элемент больше
				if (MyTree->right != nullptr) add_node(i, x, MyTree->right);
				else {
					MyTree->right = new Node;//Выделяем память левому подзвену
					MyTree->right->list = new Elem;
					MyTree->right->list->info = i;
					MyTree->right->list->number = x;//В левое звено записываем значение
				}
			}
		}
		else if ((i == MyTree->list->info) && (x == MyTree->list->number)) {//если ключи одинаковые
			Elem* mover = MyTree->list;
			while (mover->next != nullptr) mover = mover->next;
			mover->next = new Elem;
			mover->next->info = i;
			mover->next->info = x;
		}
	}
}

//Вывод дерева
void print(Node*& MyTree, int level) {
	if (MyTree)
	{
		print(MyTree->right, level + 1);
		for (int i = 0; i < level; i++) cout << "     ";
		cout << MyTree->list->info << MyTree->list->number;
		int count = 0;
		Elem* mover = MyTree->list;
		while (mover != nullptr) {
			count++;
			mover = mover->next;
		}
		if (count > 1) cout << "(x" << count << ")";
		cout << endl;
		print(MyTree->left, level + 1);
	}
}

//Поиск элемента (для основной программы, чтобы вывести на экран) 
Node* search(char i, int x, Node*& MyTree) {
	if (MyTree == nullptr) {
		return nullptr;
	}
	if (i == MyTree->list->info && x == MyTree->list->number) {
		return MyTree;
	}
	if (i > MyTree->list->info) {
		return search(i, x, MyTree->right);
	}
	else if (i < MyTree->list->info) {
		return search(i, x, MyTree->left);
	}
	else if (x > MyTree->list->number) {
		return search(i, x, MyTree->right);
	}
	else if (x < MyTree->list->number) {
		return search(i, x, MyTree->left);
	}
}

//Поиск элемента с родителем (процедура для удаления)
pair<Node*, Node*>  searchWithParent(char i, int x, Node*& MyTree) {
	if (MyTree == nullptr || (MyTree->left == nullptr && MyTree->right == nullptr)) {
		return make_pair(nullptr, nullptr);
	}
	if (i == MyTree->list->info && x == MyTree->list->number) {
		return make_pair(MyTree, nullptr);
	}
	if (i == MyTree->left->list->info && x == MyTree->left->list->number) {
		return make_pair(MyTree->left, MyTree);
	}
	if (i == MyTree->right->list->info && x == MyTree->right->list->number) {
		return make_pair(MyTree->right, MyTree);
	}
	if (i > MyTree->list->info) {
		return searchWithParent(i, x, MyTree->right);
	}
	else if (i < MyTree->list->info) {
		return searchWithParent(i, x, MyTree->left);
	}
	else if (x > MyTree->list->number) {
		return searchWithParent(i, x, MyTree->right);
	}
	else if (x < MyTree->list->number) {
		return searchWithParent(i, x, MyTree->left);
	}
}

//Поиск родителя для процедуры удаления
Node* getParent(Node*& elem, Node*& MyTree) {
	Node* mover = MyTree;
	while (mover != nullptr) {
		if (mover->left == elem || mover->right == elem) {
			return mover;
		}
		else {
			if (mover->list->info > elem->list->info || (mover->list->info == elem->list->info && mover->list->number >= elem->list->number)) {
				mover = mover->left;
			}
			else {
				mover = mover->right;
			}
		}
	}
	return nullptr;
}

//Поиск минимального с родителем
pair<Node*, Node*> searchMinWithParent(Node* ElemToStart, Node* MyTree) {
	if (ElemToStart == nullptr) {
		return make_pair(nullptr, nullptr);
	}
	else if (ElemToStart->left == nullptr) {
		return make_pair(ElemToStart, getParent(ElemToStart, MyTree));
	}
	else {
		Node* mover = ElemToStart;
		while (mover->left->left != nullptr) mover = mover->left;
		return make_pair(mover->left, mover);
	}
}

//Удаление с заменой на мминимальный справа
void del_node(char i, int x, Node*& MyTree) {
	pair<Node*, Node*> Pair = searchWithParent(i, x, MyTree);
	Node* elem_del = Pair.first;
	Node* parent = Pair.second;
	if (elem_del == nullptr) {
		return;
	}
	if (elem_del->list->next != nullptr) {
		Elem* mover = elem_del->list;
		while (mover->next->next != nullptr) mover = mover->next;
		delete mover->next;
		mover->next = nullptr;
	}
	else if (elem_del->left == nullptr && elem_del->right == nullptr) {//Удаление листа
		if (parent != nullptr) {
			if (parent->left == elem_del) {
				parent->left = nullptr;
			}
			else {
				parent->right = nullptr;
			}
		}
		delete elem_del;
	}
	else if (elem_del->left == nullptr || elem_del->right == nullptr) {//Если есть 1 ребенок
		Node* child;
		if (elem_del->left != nullptr) {
			child = elem_del->left;
		}
		else {
			child = elem_del->right;
		}
		if (parent != nullptr) {
			if (parent->left == elem_del) {
				parent->left = child;
			}
			else {
				parent->right = child;
			}
		}
		else {
			MyTree = child;
			delete elem_del;
		}
	}
	else {//Если 2 ребенка
		Pair = searchMinWithParent(elem_del->right, MyTree);
		Node* minelem = Pair.first;//мин элемент
		Node* minparent = Pair.second;//родитель мин элемента
		if (minelem->right != nullptr) {
			MyTree->list->next = minelem->list->next;
			MyTree->list->info = minelem->list->info;
			MyTree->list->number = minelem->list->number;
			if (minparent->left == minelem) {
				minparent->left = nullptr;
			}
			else {
				minparent->right = nullptr;
			}
			delete minelem;
		}
		else {
			MyTree->list->next = minelem->list->next;
			MyTree->list->info = minelem->list->info;
			MyTree->list->number = minelem->list->number;
			if (minparent->left == minelem) {
				minparent->left = nullptr;
			}
			else {
				minparent->right = nullptr;
			}
			delete minelem;
		}
	}
}

void detour1(Node*& MyTree) {//Прямой обход
	if (MyTree != nullptr) {
		cout << MyTree->list->info << MyTree->list->number << " ";
		detour1(MyTree->left);
		detour1(MyTree->right);
	}
}

void detour2(Node*& MyTree) {//Обратны обход
	if (MyTree != nullptr) {
		detour2(MyTree->left);
		detour2(MyTree->right);
		cout << MyTree->list->info << MyTree->list->number << " ";
	}
}

void detour3(Node*& MyTree) {//Симметричный обход(Слева направо)
	if (MyTree != nullptr) {
		detour3(MyTree->left);
		cout << MyTree->list->info << MyTree->list->number << " ";
		detour3(MyTree->right);
	}
}

void detour4(Node*& MyTree) {//Симметричный обход(Справа налево)
	if (MyTree != nullptr) {
		detour4(MyTree->right);
		cout << MyTree->list->info << MyTree->list->number << " ";
		detour4(MyTree->left);
	}
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	setlocale(LC_ALL, "RUS");
	Node* Tree = nullptr;//Создаем указатель
	int quantity;//Кол-во элементов
	char bmc;
	int N;
	cout << "Введите кол-во элементов: ";
	cin >> quantity;
	for (int i = 0; i < quantity; i++) {
		cout << "Введите б/м/с: ";
		cin >> bmc;
		cout << "Введите номер группы: ";
		cin >> N;
		add_node(bmc, N, Tree);
	}
	cout << '\n';
	print(Tree, 0);

	int choise;
	choise = 1;
	while (choise != 0) {
		cout << "\nЧто Вы хотите сделать? 1. Добавить элемент 2. Удалить элемент\n3. Обход дерева 4. Поиск элемента 5. Очистить дерево\n";
		cin >> choise;
		if (choise == 1) {
			cout << "Введите б/м/с: ";
			cin >> bmc;
			cout << "Введите номер группы: ";
			cin >> N;
			add_node(bmc, N, Tree);
			print(Tree, 0);
		}
		else if (choise == 2) {
			cout << "\nВведите букву и номер элемента, который нужно удалить: ";
			cin >> bmc;
			cin >> N;
			del_node(bmc, N, Tree);
			cout << "\n";
			print(Tree, 0);
		}
		else if (choise == 3) {
			cout << "Прямой обход: ";
			detour1(Tree);
			cout << "\nОбратный обход: ";
			detour2(Tree);
			cout << "\nСимметричный обход (Слева направо): ";
			detour3(Tree);
			cout << "\nСимметричный обход (Справа налево): ";
			detour4(Tree);
		}
		else if (choise == 4) {
			cout << "\nВведите букву и номер элемента, который нужно найти: ";
			cin >> bmc;
			cin >> N;
			if (search(bmc, N, Tree) != nullptr) {
				cout << "Элемент найден";
			}
			else {
				cout << "Элемент не найден";
			}
		}
		else if (choise == 5) {
			clear(Tree);
			cout << "Очищенное дерево: " << '\n';
			print(Tree, 0);
		}
		else if (choise == 0) {
			break;
		}
	}
	cin.get();
	return 0;
}
