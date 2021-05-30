#include <random>
#include <iostream>
#include <time.h>
#include <stack>
#include <string>
#include "../print.h"

using namespace std;

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
		return to_string(this->info) + "\n";
	};
};

class Worker : public Info {
public:
	string name = "";
	string position = "";
	int year;


	Worker(string name, string position, int year, int code) : Info(info) {
		this->name = name;
		this->position = position;
		this->year = year;
		this->info = code;
	}

	string GetInfo() override {
		return this->name + ", должность: " + this->position + ", принят на работу в " + to_string(this->year) + " году. Код записи: " + to_string(this->info) + "\n";
	}
};

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

	//WriteSortResult("QuickSort", mas.size(), timeResult, comp, perm);
	//print(GetVectorInfo(mas));
}

Info* LinnearSearch(vector<Info*>& mas, int info) {
	for (int i = 0; i < mas.size(); i++) {
		if (mas[i]->info == info)
			return mas[i];
	}
	return nullptr;
}

Info* FibonacciSearch(vector<Info*>& mas, int start, int end, int info) {
	if (end - start <= 1) {
		if (mas[start]->info == info)
			return mas[start];
		else if(mas[end]->info == info)
			return mas[end];
		else
			return nullptr;
	}

	int f1 = 0;
	int f2 = 1;
	 
	while (true) { 
		if (f2 + start > end) {
			FibonacciSearch(mas, f1 + start, end, info);
			break;
		}

		//cout << mas[f2 + start] << endl;

		if (info <= mas[f2+start]->info) {
			FibonacciSearch(mas, f1+start, f2+start, info);
			break;
		}

		int f3 = f1 + f2;
		f1 = f2;
		f2 = f3;
	}


}

int main()
{
	setlocale(LC_ALL, "Russian");
	//srand(time(0));
	int datamode;
	int input;
	print("Выберите тип данных:\n1 - структура\n2 - массив");
	cin >> datamode;
	print("Какое количество элементов вы хотите добавить? (структура - 30, массив - 100 или 500)");
	cin >> input;

	if (datamode == 1 && input != 30) {
		print("Некорректное количество элементов!");
		return 0;
	}
	if (datamode == 2 && !(input == 100 || input == 500)) {
		print("Некорректное количество элементов!");
		return 0;
	}
	
	vector<Info*> mas;

	switch (datamode) {
		case 1: {
			for (int i = 0; i < input; i++) {
				Info* elem = new Worker("Антон Антонович", "Бухгалтер", rand()%21 + 2000, rand() % 171 - 120);
				mas.push_back(elem);
				cout << elem->GetInfo();
			}

			break;
		}
		case 2: {
			for (int i = 0; i < input; i++) {
				Info* elem = new IntInfo(rand() % 171 - 120);
				mas.push_back(elem);
				cout << elem->GetInfo();
			}

			break;
		}
	}
	
	print("Какое значение необходимо найти?");
	cin >> input;

	QuickSort(mas);
	cout << endl;

	print("Поиск Фибоначчи:");
	Info* SearchedInfo = FibonacciSearch(mas, 0, mas.size() - 1, input);
	if (SearchedInfo != nullptr)
		cout << SearchedInfo->GetInfo() << endl;
	else
		cout << "Элемент не найден" << endl;

	print("Линейный поиск:");
	SearchedInfo = LinnearSearch(mas, input);
	if (SearchedInfo != nullptr)
		cout << SearchedInfo->GetInfo() << endl;
	else
		cout << "Элемент не найден" << endl;
}

