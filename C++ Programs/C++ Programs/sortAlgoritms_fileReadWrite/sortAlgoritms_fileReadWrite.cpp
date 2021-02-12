#include <vector>
#include <iostream>
#include <time.h>
#include <string>
#include <stack>
#include <ctime>
#include <fstream>
#include "print.h"
#include <typeinfo>

using namespace std;

int datamode = 1; // Тип данных

class Info {
public:
	int info = -1;

	Info(int info) {
		this->info = info;
	}

	virtual string GetInfo() = 0;
};

class IntInfo : public Info {
public:

	IntInfo(int info) : Info(info) {
		this->info = info;
	}

	string GetInfo() override {
		return to_string(this->info);
	};
};

class Worker : public Info {
public:
	string name = "";
	string position = "";


	Worker(string name, string position, int info) : Info(info) {
		this->name = name;
		this->position = position;
		this->info = info;
	}

	string GetInfo() override {
		return this->name + " " + this->position + " " + to_string(this->info);
	}
};

string GetVectorInfo(vector<Info*> v) {
	
	string out = "";

	for (int i = 0; i < v.size(); i++) {
		out += to_string(i) + " " + v[i]->GetInfo() + "\n";
	}
	
	out += "\n";
	return out;
}

struct st {
	int top = -1;
	pair<int, int> st[100]; // Внезапно стэк не превышает даже 30 эл. при 10 миллионах элементов в векторе
};

void st_push(st& st, pair<int, int> info) {
	st.top++;
	st.st[st.top].first = info.first;
	st.st[st.top].second = info.second;
}

void st_pop(st& st) {
	st.st[st.top].first = -1;
	st.st[st.top].second = -1;
	st.top--;
}

string OutFix(string out) {
	if (out.size() < 20) {
		for (int i = 20 - out.size(); i > 0; i--) out += " ";
	}
	return out;
}

void WriteSortResult(string sort, int size, int time, int comp, int perm) {
	string DataStr = datamode == 1 ? "Structure" : "Int Array";
	ofstream out("output.txt", ios::app);
	if (out.is_open())
	{
		out << OutFix(sort) << OutFix(DataStr) << OutFix(to_string(size)) << OutFix(to_string(time)) << OutFix(to_string(comp)) << OutFix(to_string(perm)) << endl;
	}
	out.close();
}

// Функция сортировки прямым выбором
void SelectionSort(vector<Info*> mas) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int size = mas.size();
	int min; // для поиска минимального элемента и для обмена
	for (int i = 0; i < size - 1; i++)
	{
		min = i; // запоминаем индекс текущего элемента
		// ищем минимальный элемент чтобы поместить на место i-ого
		for (int j = i + 1; j < size; j++)  // для остальных элементов после i-ого
		{
			comp++;
			if (mas[j]->info < mas[min]->info) // если элемент меньше минимального,
				min = j;       // запоминаем его индекс в min
		}
		perm++;
		Info* temp = mas[i];      // меняем местами i-ый и минимальный элементы
		mas[i] = mas[min];
		mas[min] = temp;
	}
	int timeResult = ((float)clock() - (float)time) / CLOCKS_PER_SEC;

	WriteSortResult("SelectionSort", size, timeResult, comp, perm);
	print(GetVectorInfo(mas));
}

// Функция сортировки прямым обменом (метод "пузырька")
void BubbleSort(vector<Info*> mas) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int size = mas.size();
	// Для всех элементов
	for (int i = 0; i < size - 1; i++)
	{
		for (int j = (size - 1); j > i; j--) // для всех элементов после i-ого
		{
			comp++;
			if (mas[j - 1]->info > mas[j]->info) // если текущий элемент меньше предыдущего
			{
				Info* temp = mas[j - 1]; // меняем их местами
				mas[j - 1] = mas[j];
				mas[j] = temp;
				perm++;
			}
		}
	}
	int timeResult = ((float)clock() - (float)time) / CLOCKS_PER_SEC;

	WriteSortResult("BubbleSort", size, timeResult, comp, perm);
	print(GetVectorInfo(mas));
}

// Сортировка списка алгоритмом "Быстрая сортировка"
// Формальные и входные параметры - список
// Выходные данные - нет
void QuickSort(vector<Info*>& mas) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int start = 0;
	int end = mas.size() - 1;
	st stck;
	int maxstacksize = 0; // для дебага
	int l, r, s, e;
	st_push(stck, make_pair(start, end));

	int pivot; // Опорный эл.
	while (stck.top != -1) {
		l = s = stck.st[stck.top].first;
		r = e = stck.st[stck.top].second;
		pivot = (mas[l]->info + mas[r]->info + mas[(int)((l + r) / 2)]->info) / 3;
		//cout << "Pivot: " << pivot << endl;
		if (stck.top > maxstacksize) maxstacksize = stck.top; // для дебага
		st_pop(stck);
		comp++;
		while (l <= r) {
			comp++;
			comp++;
			while (mas[l]->info < pivot) {
				l++;
				comp++;
			}
			comp++;
			while (mas[r]->info > pivot) {
				r--;
				comp++;
			}
			comp++;
			if (l <= r) {
				Info* buff = mas[l];
				mas[l] = mas[r];
				mas[r] = buff;
				perm++;
				r--;
				l++;
			}
		}
		comp++;
		if (s < r) {
			st_push(stck, make_pair(s, r));
		}
		comp++;
		if (l < e) {
			st_push(stck, make_pair(l, e));
		}
	}
	/*cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Max static stack size(for debug): " << maxstacksize << endl;*/
	int timeResult = ((float)clock() - (float)time) / CLOCKS_PER_SEC;
	
	WriteSortResult("QuickSort", mas.size(), timeResult, comp, perm);
	print(GetVectorInfo(mas));
}

//
// Построение списка в виде бинарного древа, где n - родитель, 2n+1 - левый потомок меньше родителя, 2n+2 - правый потомок больше родителя
// Функция вызывается в процедуре пирамидальной сортировки. НЕ ТРЕБУЕТ самостоятельного вызова
// Формальные и входные параметры - список, узел, длина списка, счетчик сравнений, счетчик перестановок
// Выходные данные - нет
void Heapify(vector<Info*>& mas, int el, int size, int& comp, int& perm)
{

	int largest = el;
	// Инициализируем наибольший элемент как корень
	int lf = 2 * largest + 1; // левый = 2*i + 1
	int rt = 2 * largest + 2; // правый = 2*i + 2

 // Если левый дочерний элемент больше корня
	comp++;
	comp++;
	if (lf < size && mas[lf]->info > mas[largest]->info) {
		largest = lf;
	}


	// Если правый дочерний элемент больше, чем самый большой элемент на данный момент
	comp++;
	comp++;
	if (rt < size && mas[rt]->info > mas[largest]->info) {
		largest = rt;
		comp++;
	}


	// Если самый большой элемент не корень
	comp++;
	if (mas[largest]->info != mas[el]->info)
	{
		perm++;

		Info* buffer = mas[el];
		mas[el] = mas[largest];
		mas[largest] = buffer;

		// Рекурсивно преобразуем в двоичную кучу затронутое поддерево
		Heapify(mas, largest, size, comp, perm);
	}
}


// Сортировка списка алгоритмом "Пирамидальная сортировка(сортировка кучей)"
// Формальные и входные параметры - список
// Выходные данные - нет
void HeapSort(vector<Info*>& mas)
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
		Info* buffer = mas[i];
		mas[i] = mas[0];
		mas[0] = buffer;

		perm++;

		// вызываем процедуру heapify на уменьшенной куче
		Heapify(mas, 0, i, comp, perm);
	}
	//cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	//cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;

	WriteSortResult("PyramidSort", mas.size(), ((float)clock() - (float)time) / CLOCKS_PER_SEC, comp, perm);
	print(GetVectorInfo(mas));
}

int binarySearch(vector<Info*>& arr, int last, int x, int& comp) {
	int l = 0;
	int r = last;
	while (l < r) {
		int m = (l + r) / 2;

		comp++;
		if (x < arr[m]->info) {
			r = m;
		}
		else {
			l = m + 1;
		}
	}
	comp++;
	if (l == r) {
		comp++;
		if (arr[l]->info < x) {
			return l + 1;
		}
		else {
			return l;
		}
	}
	return l;
}

void InsertionSort(vector<Info*>& arr) {
	int size = arr.size();
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	for (int i = 0; i < size - 1; i++) {
		Info* eltoplace = arr[i + 1];
		int place = binarySearch(arr, i, eltoplace->info, comp);
		for (int j = i; j >= place; j--) {
			perm++;
			arr[j + 1] = arr[j];
		}
		perm++;
		arr[place] = eltoplace;
	}
	/*cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;*/
	WriteSortResult("InsertionSort", size, ((float)clock() - (float)time) / CLOCKS_PER_SEC, comp, perm);
	print(GetVectorInfo(arr));
}

void inputCheck(int& input, int first, int last) {
	while (input < first || input > last) {
		print("Некорректный ввод! Введите выбор еще раз!");
		cin >> input;
	}
}

int main()
{
	setlocale(LC_ALL, "Russian");

	vector<Info*> data;

	ofstream out;          // поток для записи
	out.open("output.txt"); // окрываем файл для записи чтобы сделать красивую первую строчку
	if (out.is_open())
	{
		out << OutFix("Sort type:") << OutFix("Data type:") << OutFix("Elem. amount:") << OutFix("Time(s):") << OutFix("Comparsions:") << OutFix("Permutations:") << endl;
	}
	out.close();

	print("Выберите тип данных:\n1 - структура\n2 - массив");
	print("3 - Сгенерировать input-файл(со случайными значениями)");
	print("(Внимание: данные должны храниться в файле input.txt, который находится в папке проекта)");
	cin >> datamode;
	inputCheck(datamode, 1, 3);

	int infocount = 0;
	if (datamode == 3) { // Генерация данных в input.txt
		print("Выберите тип данных:\n1 - структура\n2 - массив");
		cin >> datamode;
		inputCheck(datamode, 1, 2);
		print("Какое количество элементов вы хотите добавить?");
		cin >> infocount;
		out.open("input.txt");
		if (out.is_open())
		{
			switch (datamode) {
			case 1:
				for (int i = 0; i < infocount; i++) {
					out << "Антон Антонович" << endl;
					out << "Бухгалтер" << endl;
					out << rand() % 16 + 10 << endl;
				}
				break;
			case 2:
				for (int i = 0; i < infocount; i++) {
					out << rand() % 171 - 120 << endl;
				}
				break;
			}
		}
		out.close();
		infocount = 0;
	}

	string Text;
	string line;
	ifstream input("input.txt");
	if (input.is_open())
	{
		int infotype = 0;
		string name;
		string position;
		int year;
		switch (datamode) {
		case 1:
			while (getline(input, line)) {
				switch (infotype) {
				case 0:
					name = line;
					infotype++;
					break;
				case 1:
					position = line;
					infotype++;
					break;
				case 2:
					year = stoi(line);
					data.push_back(new Worker(name, position, stoi(line)));
					infotype = 0;
					infocount++;
					break;
				}
			}
		break;
		case 2:
			while (getline(input, line)) {
				data.push_back(new IntInfo( stoi(line) ));
				infocount++;
			}
		break;
		}
	}
	input.close();
	print("Количество полученных данных: ", infocount);

	int end = false;
	// Проверки входных данных
	if (datamode == 2 && (infocount != 500 && infocount != 1000 && infocount != 5000)) { 
		print("Внимание! Количество чисел не равно 500/1000/5000! Программа завершается!");
		end = true;
	}
	else if (datamode == 1 && infocount != 10 && infocount != 25) {
		print("Внимание! Количество элементов не равно 10/25! Программа завершается!");
		end = true;
	}
	else if (datamode == 2) {
		for (Info* i : data) {
			if (i->info < -120 || i->info > 50) {
				end = true;
				print("Внимание! Данные ", i->GetInfo(), " выходят за границы(год)! Программа завершается!");
			}
		}
	}

	if (!end) print(GetVectorInfo(data)); // Вывод исходных данных

	int inp;
	ifstream sortdata;
	while (!end) {
		print("Выберите пункт меню:");
		print("1 - Cортировка простыми вставками");
		print("2 - Cортировка простым обменом");
		print("3 - Cортировка простым выбором");
		print("4 - Пирамидальная сортировка");
		print("5 - Быстрая сортировка");
		print("6 - Характеристики сортировок");
		print("7 - Выход");
		cin >> inp;
		inputCheck(inp, 1, 7);

		switch (inp) {
		case 1:
			InsertionSort(data);
			break;
		case 2:
			BubbleSort(data);
			break;
		case 3:
			SelectionSort(data);
			break;
		case 4:
			HeapSort(data);
			break;
		case 5:
			QuickSort(data);
			break;
		case 6:
			sortdata.open("output.txt");
			if (sortdata.is_open())
			{
				while (getline(sortdata, line)) {
					print(line);
				}
			}
			sortdata.close();
			break;
		case 7:
			end = true;
			break;
		}
	}
}
