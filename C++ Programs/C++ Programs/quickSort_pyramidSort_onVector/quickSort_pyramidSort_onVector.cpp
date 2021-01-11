#include <vector>
#include <iostream>
#include <time.h>
#include <string>
#include <stack>
#include <ctime>

using namespace std;

const int elementsCount = 1000; // Количество элементов в стэке
struct st {
	int top = -1;
	pair<int, int> st[100]; // Внезапно стэк не превышает даже 30 эл. при 10 миллионах элементов в векторе
};

void st_push(st& st, pair<int,int> info) {
	st.top++;
	st.st[st.top].first = info.first;
	st.st[st.top].second = info.second;
}

void st_pop(st& st) {
	st.st[st.top].first = -1;
	st.st[st.top].second = -1;
	st.top--;
}


// Сортировка списка алгоритмом "Быстрая сортировка"
// Формальные и входные параметры - список
// Выходные данные - нет
void QuickSort(vector<int>& mas) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int start = 0;
	int end = mas.size()-1;
	st stck;
	int maxstacksize = 0; // для дебага
	int l, r, s, e;
	st_push(stck, make_pair(start, end));

	int pivot; // Опорный эл.
	while (stck.top != -1) {
		l = s = stck.st[stck.top].first;
		r = e = stck.st[stck.top].second;
		pivot = (mas[l] + mas[r] + mas[(int)((l+r)/2)])/3;
		//cout << "Pivot: " << pivot << endl;
		if (stck.top > maxstacksize) maxstacksize = stck.top; // для дебага
		st_pop(stck);
		comp++;
		while (l <= r) {
			comp++;
			comp++;
			while (mas[l] < pivot) {
				l++;
				comp++;
			}
			comp++;
			while (mas[r] > pivot) {
				r--;
				comp++;
			}
			comp++;
			if (l <= r) {
				int buff = mas[l];
				mas[l] = mas[r];
				mas[r] = buff;
				perm++;
				r--;
				l++;
			}
		}
		comp++;
		if (s < r) {
			st_push(stck,make_pair(s, r));
		}
		comp++;
		if (l < e) {
			st_push(stck, make_pair(l, e));
		}
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Max static stack size(for debug): " << maxstacksize << endl; 
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}

//
// Построение списка в виде бинарного древа, где n - родитель, 2n+1 - левый потомок меньше родителя, 2n+2 - правый потомок больше родителя
// Функция вызывается в процедуре пирамидальной сортировки. НЕ ТРЕБУЕТ самостоятельного вызова
// Формальные и входные параметры - список, узел, длина списка, счетчик сравнений, счетчик перестановок
// Выходные данные - нет
void Heapify(vector<int>& mas, int el, int size, int& comp, int& perm)
{

	int largest = el;
	// Инициализируем наибольший элемент как корень
	int lf = 2 * largest + 1; // левый = 2*i + 1
	int rt = 2 * largest + 2; // правый = 2*i + 2

 // Если левый дочерний элемент больше корня
	comp++;
	comp++;
	if (lf < size && mas[lf] > mas[largest]) {
		largest = lf;
	}


	// Если правый дочерний элемент больше, чем самый большой элемент на данный момент
	comp++;
	comp++;
	if (rt < size && mas[rt] > mas[largest]) {
		largest = rt;
		comp++;
	}


	// Если самый большой элемент не корень
	comp++;
	if (mas[largest] != mas[el])
	{
		perm++;

		int buffer = mas[el];
		mas[el] = mas[largest];
		mas[largest] = buffer;

		// Рекурсивно преобразуем в двоичную кучу затронутое поддерево
		Heapify(mas, largest, size, comp, perm);
	}
}


// Сортировка списка алгоритмом "Пирамидальная сортировка(сортировка кучей)"
// Формальные и входные параметры - список
// Выходные данные - нет
void HeapSort(vector<int>& mas)
{
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	// Построение кучи (перегруппируем массив)
	for (int i = mas.size() / 2 - 1; i >= 0; i--)
		Heapify(mas, i, mas.size(), comp, perm);

	// Один за другим извлекаем элементы из кучи
	for (int i = mas.size() - 1; i >= 0; i--)
	{
		// Перемещаем текущий корень в конец
		int buffer = mas[i];
		mas[i] = mas[0];
		mas[0] = buffer;

		perm++;

		// вызываем процедуру heapify на уменьшенной куче
		Heapify(mas, 0, i, comp, perm);
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}

string GetVectorInfo(vector<int>& v) {
	string out = "";
	for (int i = 0; i < v.size(); i++) {
		out += to_string(i) + " " + to_string(v[i]) + "\n";
	}
	out += "\n";
	return out;
}

int main()
{
	srand(time(0));

	cout << "//----------------------------" << endl;
	cout << "//----------Quick Sort--------" << endl;
	cout << "//----------------------------" << endl;

	vector<int> mas;
	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	QuickSort(mas);
	cout << GetVectorInfo(mas);
	mas.clear();
	

	cout << "//----------------------------" << endl;
	cout << "//---------Heap Sort----------" << endl;
	cout << "//----------------------------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	HeapSort(mas);
	cout << GetVectorInfo(mas);
	mas.clear();

	cout << "//----------------------------" << endl;
	cout << "//----------Quick Sort--------" << endl;
	cout << "//-----(sustainability)-------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	QuickSort(mas);
	mas.clear();


	cout << "//----------------------------" << endl;
	cout << "//---------Heap Sort----------" << endl;
	cout << "//-----(sustainability)-------" << endl;

	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	HeapSort(mas);
	mas.clear();

	cout << "//-----------From 0 to 99(Heap Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	HeapSort(mas);
	mas.clear();

	cout << "//----------From 99 to 0(Heap Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	HeapSort(mas);
	mas.clear();

	cout << "//-----------From 0 to 99(Quick Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	QuickSort(mas);
	mas.clear();

	cout << "//----------From 99 to 0(Quick Sort)------------" << endl;
	for (int i = 0; i < elementsCount; i++) {
		mas.push_back(rand() % 20000);
	}

	QuickSort(mas);
	mas.clear();

}
