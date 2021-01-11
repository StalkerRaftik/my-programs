#include <iostream>
#include <string>
#include <time.h>
#include <ctime>

using namespace std;

string getArrayInfo(int arr[], int size) {
	string str = "";
	for (int i = 0; i < size; i++) {
		str += to_string(i) + ' ' + to_string(arr[i]) + '\n';
	}
	str += "\n";
	return str;
}

int binarySearch(int arr[], int last, int x, int& comp) {
	int l = 0;
	int r = last;
	while (l < r) {
		int m = (l+r)/2;

		comp++;
		if (x < arr[m]) {
			r = m;
		}
		else {
			l = m+1;
		}
	}
	comp++;
	if (l == r) {
		comp++;
		if (arr[l] < x) {
			return l + 1;
		}
		else {
			return l;
		}
	}
	return l;
}

void insertionSort(int arr[], int size) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	for (int i = 0; i < size-1; i++) {
		int eltoplace = arr[i+1];
		int place = binarySearch(arr, i, eltoplace, comp);
		for (int j = i; j >= place; j--) {
			perm++;
			arr[j+1] = arr[j];
		}
		perm++;
		arr[place] = eltoplace;
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}

void shellSort(int arr[], int size) {
	float time = (float)clock();
	int comp = 0;
	int perm = 0;
	int step = size / 2;//инициализируем шаг.
	while (step > 0)//пока шаг не 0
	{
		for (int i = 0; i < (size - step); i++) {
			int j = i; //будем идти начиная с i-го элемента 
			comp++;
			while (j >= 0 && arr[j] > arr[j + step])
				//пока не пришли к началу массива
				//и пока рассматриваемый элемент больше
				//чем элемент находящийся на расстоянии шага
			{
				//меняем их местами
				int temp = arr[j];
				arr[j] = arr[j + step];
				arr[j + step] = temp;
				j--;
				perm++;
			}
		}
		cout << "AFTER CURRENT STEP: " << step << endl;
		cout << getArrayInfo(arr, size);
		
		step = step / 2;//уменьшаем шаг
	}
	cout << "Comparsions: " << comp << " Permutations: " << perm << endl;
	cout << "Time spent: " << ((float)clock() - (float)time) / CLOCKS_PER_SEC << " seconds" << endl << endl;
}

int main()
{
	const int size = 500;
	int arr[size];

	for (int i = 0; i < size; i++) {
		arr[i] = rand() % 200 - 100;
	}

	cout << getArrayInfo(arr, size);
	cout << endl;
	cout << "----shell sort-----\n";
	shellSort(arr, size);
	cout << "Final sort result:\n";
	cout << getArrayInfo(arr, size);

	cout << "----insertion sort-----\n";
	for (int i = 0; i < size; i++) {
		arr[i] = rand() % 200 - 100;
	}
	cout << getArrayInfo(arr, size);
	cout << endl;

	insertionSort(arr, size);
	cout << getArrayInfo(arr, size);
	cout << endl;

}