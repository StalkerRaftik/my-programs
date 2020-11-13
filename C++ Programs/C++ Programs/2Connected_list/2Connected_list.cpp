#include <iostream>
#include <string>
#include <ctime>	

using namespace std;

// Иниц. элементов списка
struct listelem {
	listelem* pred = NULL; //Ссылка на следущий элемент списка
	int value = 0; // Информация элемента
	listelem* next = NULL; //Ссылка на следущий элемент списка
};

// Иниц. дин. списка
struct dyn_list {
	listelem* head; // Первый элемент (голова) списка
	listelem* tail; // Последний элемент (хвост) списка
};

// Создание пустого списка
void constr_list(dyn_list& l)
{
	l.head = NULL;
	l.tail = NULL;
}
// Проверка списка на пустоту
bool chk_empty(dyn_list l)
{
	return (l.head == NULL && l.tail == NULL);
}

// Объявление функций
void NewElem(dyn_list& l, int info);
string GetListInfo(dyn_list l);
void DeleteAfterLastEven(dyn_list& l);




int main()
{
	srand(time(0));
	dyn_list List;

	constr_list(List);
	cout << "Is array empty: " << chk_empty(List) << endl;


	for (int i = 1; i <= 15; i++) {
		int info = -5;
		while (info < -4 || info > 25) {
			cout << "Enter " << i << " element: ";
			cin >> info;
		}
		NewElem(List, info);
	}

	cout << GetListInfo(List);
	DeleteAfterLastEven(List);
	cout << GetListInfo(List);
}



// Добавление элемента по убыванию
void NewElem(dyn_list& l, int info)
{
	listelem* elem = new listelem();
	elem->value = info;
	if (chk_empty(l)) {
		l.head = elem;
		l.tail = elem;
	}
	else {
		listelem* mover = l.head;
		while (mover != NULL && mover->value > info) {
			mover = mover->next;
		}
		if (mover == NULL) {
			l.tail->next = elem;
			elem->pred = l.tail;
			l.tail = elem;
		}
		else if (mover->pred == NULL) {
			l.head->pred = elem;
			elem->next = l.head;
			l.head = elem;
		}
		else {
			elem->next = mover;
			elem->pred = mover->pred;
			mover->pred->next = elem;
			mover->pred = elem;
		}
	}
}

// Получение информации об элементах списка
string GetListInfo(dyn_list l)
{
	listelem* mover = l.head;
	int counter = 1;
	string result;
	while (mover != NULL) {
		result = result + to_string(counter) + " " + to_string(mover->value) + "\n";
		counter++;
		mover = mover->next;
	}

	return result;
}

// Удаление после последнего четного
void DeleteAfterLastEven(dyn_list& l)
{
	listelem* lastevenelem = NULL;
	listelem* mover = l.head;
	while (mover != NULL) {
		if (mover->value % 2 == 0) lastevenelem = mover;
		mover = mover->next;
	}
	if (lastevenelem == NULL) return;

	if (lastevenelem->next != NULL) {
		listelem* elemtodelete = lastevenelem->next;
		if (lastevenelem->next->next != NULL) {
			lastevenelem->next = elemtodelete->next;
			delete elemtodelete;
		}
		else {
			delete elemtodelete;
			lastevenelem->next = NULL;
		}
	}

}