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
int GetListSize(dyn_list l);
void DeleteLastElement(dyn_list& l);
int GetSmallestValue(dyn_list l);
void NewElemAfterEven(dyn_list& l, int info);
void DeleteElemAfterEven(dyn_list& l);




int main()
{
	srand(time(0));
	dyn_list List;

	constr_list(List);
	cout << "Is array empty: " << chk_empty(List) << endl;


	for (int i = 1; i < 6; i++) {
		NewElem(List, rand() % 11);
	}

	cout << GetListInfo(List) << "List size: " << GetListSize(List) << endl;

	DeleteLastElement(List);
	cout << "-------------\n";
	cout << GetListInfo(List) << "Smallest: " << GetSmallestValue(List) << endl;
	cout << "-------------\n";
	DeleteElemAfterEven(List);
	cout << GetListInfo(List);
	cout << "-------------\n";
	NewElemAfterEven(List, 228);
	cout << GetListInfo(List);

	system("pause");
}


// Удаление элементов после каждого четного
// Формальные параметры - список
// Входные данные - список
// Выходных данных нет
void DeleteElemAfterEven(dyn_list& l)
{
	listelem* mover = l.head;
	while (mover != NULL) {
		if (mover->value % 2 == 0 && mover->next != NULL) {
			if (mover->next->next != NULL) {
				listelem* nextelem;
				nextelem = mover->next->next;
				delete mover->next;
				mover->next = nextelem;
			}
			else {
				delete mover->next;
				mover->next = NULL;
			}
		}
		mover = mover->next;
	}
}


// Добавление новых элементов после каждого четного
// Формальные параметры - список и данные новых элементов
// Входные данные - список и данные новых элементов
// Выходных данных нет
void NewElemAfterEven(dyn_list& l, int info)
{
	if (!chk_empty(l)) {
		listelem* mover = l.head;
		while (mover != NULL) {
			if (mover->value % 2 == 0) {
				listelem* elem = new listelem();
				elem->value = info;
				if (mover->next != NULL) {
					elem->pred = mover;
					elem->next = mover->next;
					elem->pred->next = elem;
					elem->next->pred = elem;

					mover = mover->next;

				}
				else {
					elem->pred = mover;
					elem->next = NULL;
					mover->next = elem;
					l.tail = elem;
					mover = mover->next;
				}
			}
			mover = mover->next;
		}
	}
}


// Добавление элемента по убыванию
// Формальные параметры - список и данные нового элемента
// Входные данные - список и данные нового элемента
// Выходных данных нет
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
// Формальные параметры - список
// Входные данные - список
// Выходные данные - строка с информацией об элементах
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

// Получение размера списка
// Формальные параметры - список
// Входные данные - список
// Выходные данные - размер списка
int GetListSize(dyn_list l)
{
	listelem* mover = l.head;
	int counter = 0;
	string result;
	while (mover != NULL) {
		counter++;
		mover = mover->next;
	}

	return counter;
}

// Удаление последнего элемента
// Формальные параметры - список
// Входные данные - список
// Выходных данных нет
void DeleteLastElement(dyn_list& l)
{
	l.tail->pred->next = NULL;
	delete l.tail;
}

// Получить наименьшее значение в списке
// Формальные параметры - список
// Входные данные - список
// выходные данные - минимальное значение
int GetSmallestValue(dyn_list l)
{
	listelem* mover = l.head;
	int result = INT_MAX;
	while (mover != NULL) {
		if (mover->value < result) {
			result = mover->value;
		}
		mover = mover->next;
	}
	return result;
}
