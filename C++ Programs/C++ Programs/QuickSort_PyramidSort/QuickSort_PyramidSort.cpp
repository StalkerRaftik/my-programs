#include <vector>
#include <iostream>
#include <time.h>
#include <string>
#include <stack>
#include <ctime>

using namespace std;


// Иниц. элементов списка
struct listelem {
	listelem* pred = nullptr; //Ссылка на следущий элемент списка
	int key = 0; // Информация элемента
	int pos = 0; // Позиция элемента в списке
	listelem* next = nullptr; //Ссылка на следущий элемент списка
};


// Иниц. дин. списка
struct list {
	listelem* head = nullptr; // Первый элемент (голова) списка
	listelem* tail = nullptr; // Последний элемент (хвост) списка
};


// Добавляет новый элемент в список
// Формальные и входные параметры - список, ключ нового элемента
// Выходные данные - нет
void NewElem(list& l, int key)
{
	listelem* elem = new listelem();
	elem->key = key;
	if (l.head == nullptr) {
		l.head = elem;
	}
	else {
		elem->pred = l.tail;
		l.tail->next = elem;
		elem->pos = l.tail->pos + 1;
	}
	l.tail = elem;
}


// Найти элемент по позиции
// Формальные и входные параметры - список, позиция элемента
// Выходные данные - нужный элемент либо nullptr, если элемента нет в списке
listelem* GetElemByPos(list& l, int pos) {
	listelem* mover = l.head;
	while (mover != nullptr) {
		if (mover->pos == pos) return mover;
		mover = mover->next;
	}
	return nullptr;
}


// Очистка списка от элементов
// Формальные и входные параметры - список
// Выходные данные - нет
void ClearList(list& l) {
	listelem* mover = l.head;
	while (mover != nullptr) {
		listelem* eltodel = mover;
		mover = mover->next;
		delete eltodel;
	}
	l.head = nullptr;
	l.tail = nullptr;
}


// Получение информации об элементах списка
// Формальные и входные параметры - список
// Выходные данные - строка с данными
string GetListInfo(list l)
{
	listelem* mover = l.head;
	string result;
	while (mover != NULL) {
		result = result + to_string(mover->pos) + " " + to_string(mover->key) + "\n";
		mover = mover->next;
	}

	return result;
}


// Получение длины списка
// Формальные и входные параметры - список
// Выходные данные - длина списка
int GetListLength(list l) {
	return l.tail->pos + 1;
}


// Проверка списка на пустоту
// Формальные и входные параметры - список
// Выходные данные - нет
bool chk_empty(list l)
{
	return (l.head == NULL && l.tail == NULL);
}


// Сортировка списка алгоритмом "Быстрая сортировка"
// Формальные и входные параметры - список
// Выходные данные - нет
void QuickSort(list& list) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int start = 0;
	int end = list.tail->pos;
	stack< pair<int, int> > stck;
	int l, r, s, e;
	stck.push(make_pair(start,end));

	int pivot; // Опорный эл.
	while (!stck.empty()) {
		l = s = stck.top().first;
		r = e = stck.top().second;
		pivot = GetElemByPos(list, l)->key;
		stck.pop();
		comp++;
		while (l <= r) {
			comp++;
			comp++;
			while (GetElemByPos(list, l)->key < pivot) {
				l++;
				comp++;
			}
			comp++;
			while (GetElemByPos(list, r)->key > pivot) {
				r--;
				comp++;
			}
			comp++;
			if (l <= r) {
				listelem* lel = GetElemByPos(list, l);
				listelem* rel = GetElemByPos(list, r);

				int buff = lel->key;
				lel->key = rel->key;
				rel->key = buff;
				perm++;
				r--;
				l++;
			}
		}
		comp++;
		if (s < r) {
			stck.push(make_pair(s, r));
		}
		comp++;
		if (l < e) {
			stck.push(make_pair(l, e));
		}
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}


// Построение списка в виде бинарного древа, где n - родитель, 2n+1 - левый потомок меньше родителя, 2n+2 - правый потомок больше родителя
// Формальные и входные параметры - список
// Выходные данные - true, если правильно составлен, false в ином случае
bool TreeCheck(list& l) {
	listelem* mover = l.head;
	while (mover != nullptr) {
		listelem* lf = GetElemByPos(l, 2 * mover->pos + 1); // левый = 2*i + 1
		listelem* rt = GetElemByPos(l, 2 * mover->pos + 2); // правый = 2*i + 2

		// Если левый дочерний элемент больше корня
		if (lf != nullptr && lf->key > mover->key)
			return false;

		// Если правый дочерний элемент больше, чем самый большой элемент на данный момент
		if (rt != nullptr && rt->key > mover->key)
			return false;

		mover = mover->next;
	}
	return true;
}


// Построение списка в виде бинарного древа, где n - родитель, 2n+1 - левый потомок меньше родителя, 2n+2 - правый потомок больше родителя
// Функция вызывается в процедуре пирамидальной сортировки. НЕ ТРЕБУЕТ самостоятельного вызова
// Формальные и входные параметры - список, узел, длина списка, счетчик сравнений, счетчик перестановок
// Выходные данные - нет
void Heapify(list& l, listelem* el, int size, int& comp, int& perm)
{

	listelem* largest = el;
	// Инициализируем наибольший элемент как корень
	listelem* lf = GetElemByPos(l, 2*el->pos + 1); // левый = 2*i + 1
	listelem* rt = GetElemByPos(l, 2*el->pos + 2); // правый = 2*i + 2

 // Если левый дочерний элемент больше корня
	comp++;
	comp++;
	if (lf != nullptr && lf->pos < size && lf->key > largest->key) {
		largest = lf;
	}
		

	// Если правый дочерний элемент больше, чем самый большой элемент на данный момент
	comp++;
	comp++;
	if (rt != nullptr && rt->pos < size && rt->key > largest->key) {
		largest = rt;
		comp++;
	}
		

	// Если самый большой элемент не корень
	comp++;
	if (largest->key != el->key)
	{
		perm++;

		int buffer = el->key;
		el->key = largest->key;
		largest->key = buffer;

		// Рекурсивно преобразуем в двоичную кучу затронутое поддерево
		Heapify(l, largest, size, comp, perm);
	}
}


// Сортировка списка алгоритмом "Пирамидальная сортировка(сортировка кучей)"
// Формальные и входные параметры - список
// Выходные данные - нет
void HeapSort(list& l)
{
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	// Построение кучи (перегруппируем массив)
	for (int i = GetListLength(l) / 2 - 1; i >= 0; i--)
		Heapify(l, GetElemByPos(l, i), GetListLength(l), comp, perm);

	// Один за другим извлекаем элементы из кучи
	for (int i = GetListLength(l) - 1; i >= 0; i--)
	{
		listelem* elem = GetElemByPos(l, i);
		// Перемещаем текущий корень в конец
		int buffer = elem->key;
		elem->key = l.head->key;
		l.head->key = buffer;

		perm++;

		// вызываем процедуру heapify на уменьшенной куче
		Heapify(l, l.head, i, comp, perm);
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}

int main()
{
	srand(time(0));
	int elementsCount = 1001;

	cout << "//----------------------------" << endl;
	cout << "//----------Quick Sort--------" << endl;
	cout << "//----------------------------" << endl;

	list List;
	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, rand()%200);
	}

	QuickSort(List);
	cout << GetListInfo(List);
	ClearList(List);


	cout << "//----------------------------" << endl;
	cout << "//---------Heap Sort----------" << endl;
	cout << "//----------------------------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, rand()%200);
	}

	HeapSort(List);
	cout << GetListInfo(List);
	ClearList(List);

	cout << "//----------------------------" << endl;
	cout << "//----------Quick Sort--------" << endl;
	cout << "//-----(sustainability)-------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, 1);
	}

	QuickSort(List);
	ClearList(List);


	cout << "//----------------------------" << endl;
	cout << "//---------Heap Sort----------" << endl;
	cout << "//-----(sustainability)-------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, 1);
	}

	HeapSort(List);
	ClearList(List);

	cout << "//-----------From 0 to 99(Heap Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, i);
	}

	HeapSort(List);
	ClearList(List);

	cout << "//----------From 99 to 0(Heap Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, 99-i);
	}

	HeapSort(List);
	ClearList(List);

	cout << "//-----------From 0 to 99(Quick Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, i);
	}

	QuickSort(List);
	ClearList(List);

	cout << "//----------From 99 to 0(Quick Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		NewElem(List, 99 - i);
	}

	QuickSort(List);
	ClearList(List);

}
