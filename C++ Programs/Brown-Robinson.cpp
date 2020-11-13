#include <iostream>
#include <time.h> 
#include <vector>
#include <limits>
#include <cstddef>
using namespace std;

const int m = 3; // Стратегии игрока B (ширина)
const int n = 3; // Стратегии игрока A (высота)
const int Iterations = 20; // Количество итераций игры

int Game[m][n];

int B_CurrentStrategy;
int A_CurrentStrategy;

int A_StrUsageArr[n];
int B_StrUsageArr[m];



float Roof = numeric_limits<float>::min();
float Floor = numeric_limits<float>::max();


int A_StrategyUsage[n]; // Суммарное количество выборов стратегий игрока A
int B_StrategyUsage[m]; // Суммарное количество выбранных стратегий игрока B

int counter;

// Находит индекс массива, в котором находится максимальный элемент данного массива. Если таких индексов несколько, берёт рандомный.
int GetMinOrMaxRandomValueInArray(int arr[], int size, bool min) {
	if (size < 1) { return -1; };
	if (min == false) {
		int MaxValue = arr[0];

		for (int i = 1; i < size; i++) {
			if (arr[i] > MaxValue) {
				MaxValue = arr[i];
			}
		}


		int Elem;
		vector<int> EqualElements;
		for (int i = 0; i < size; i++) {
			if (arr[i] == MaxValue) {
				Elem = i;
				EqualElements.push_back(Elem);
			}
		}

		return EqualElements[rand() % EqualElements.size()];
	}
	else if (min == true) {
		int MinValue = arr[0];

		for (int i = 1; i < size; i++) {
			if (arr[i] < MinValue) {
				MinValue = arr[i];
			}
		}


		int Elem;
		vector<int> EqualElements;
		for (int i = 0; i < size; i++) {
			if (arr[i] == MinValue) {
				Elem = i;
				EqualElements.push_back(Elem);
			}
		}

		return EqualElements[rand() % EqualElements.size()];
	}

	return -1;
}

int main()
{
	srand(time(0));
	cout << 3.0 / 2;
	int Mode = 1;
	cout << "Select the matrix filling mode. 1 - Random, 2 - Manually: ";
	cin >> Mode;
	cout << "\n";
	if (Mode == 1) {
		// Заполняем рандомные коэфф. в таблицу
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				Game[i][j] = rand() % 5;
			}
		}
	}
	else if (Mode == 2) {
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				cout << "Enter number " << i + 1 << "x" << j + 1 << ": ";
				cin >> Game[j][i];
				cout << "\n";
			}
		}
	}

	cout << "   B1 B2 B3\n";
	// Вывод таблицы
	for (int i = 0; i < m; i++) {
		cout << "A" << (i + 1) << "  ";
		for (int j = 0; j < n; j++) {
			cout << Game[j][i] << " ";
		}
		cout << "\n";
	}

	// Первый ход(рандомный)
	counter = 1;
	A_CurrentStrategy = rand() % n;
	for (int i = 0; i < m; i++) {
		B_StrUsageArr[i] = Game[i][A_CurrentStrategy];
	}
	B_CurrentStrategy = GetMinOrMaxRandomValueInArray(B_StrUsageArr, m, true);
	for (int i = 0; i < n; i++) {
		A_StrUsageArr[i] = Game[B_CurrentStrategy][i];
	}
	B_StrategyUsage[B_CurrentStrategy]++;
	A_StrategyUsage[A_CurrentStrategy]++;

	// Выводы для первого хода
	//cout << "A selected: " << A_CurrentStrategy+1 << " strategy\nB selected:" << B_CurrentStrategy+1 << " strategy\n";

	cout << "\nA ARRAY:\n";
	for (int i = 0; i < n; i++) {
		cout << A_StrUsageArr[i] << " ";
	}
	cout << "\nB ARRAY:\n";
	for (int i = 0; i < m; i++) {
		cout << B_StrUsageArr[i] << " ";
	}
	cout << "\n--------------";


	// Основная часть
	counter++;
	while (counter <= Iterations) {
		
		B_CurrentStrategy = GetMinOrMaxRandomValueInArray(B_StrUsageArr, m, true);
		A_CurrentStrategy = GetMinOrMaxRandomValueInArray(A_StrUsageArr, n, false);

		cout << "Roof: " << Roof << " " << A_StrUsageArr[A_CurrentStrategy]/(counter-1) << endl;
		cout << "Floor: " << Floor << " " << B_StrUsageArr[B_CurrentStrategy]/(counter-1) << endl;

		Roof = A_StrUsageArr[A_CurrentStrategy]/(counter-1) > Roof ? A_StrUsageArr[A_CurrentStrategy]/(counter-1) : Roof;
		Floor = B_StrUsageArr[B_CurrentStrategy]/(counter-1) < Floor ? B_StrUsageArr[B_CurrentStrategy]/(counter-1) : Floor;

		cout << "Roof: " << Roof << endl;
		cout << "Floor: " << Floor << endl;

		for (int i = 0; i < n; i++) {
			A_StrUsageArr[i] += Game[B_CurrentStrategy][i];
		}
		for (int i = 0; i < m; i++) {
			B_StrUsageArr[i] += Game[i][A_CurrentStrategy];
		}
		A_StrategyUsage[A_CurrentStrategy]++;
		B_StrategyUsage[B_CurrentStrategy]++;

		
		counter++;
	}

	cout << "\n";
	for (int i = 0; i < n; i++) {
		cout << (float)(A_StrategyUsage[i]) / (float)(counter - 1) << " ";
	}
	cout << "\n";
	for (int i = 0; i < m; i++) {
		cout << (float)(B_StrategyUsage[i]) / (float)(counter - 1) << " ";
	}

	cout << "\n";
	cout << "Roof: " << Roof;
	cout << "\n";
	cout << "Floor: " << Floor;
	cout << "\n";
	cout << "Game cost: " << (Floor+Roof)/2;
}
