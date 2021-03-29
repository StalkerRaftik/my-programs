#include <iostream>

using namespace std;

int main()
{
	setlocale(LC_ALL, "rus");

	const int rows = 8;
	const int cols = 8;

	float arrM1[rows][cols] = {};
	float arrM2[rows][cols] = {};
	float arrM3[rows][cols] = {};
	float arr2[rows] = {};
	float arr3[rows][cols] = {};

	float value = 0;

	cout << "Исходная матрица М1:" << endl;

	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			arrM1[i][j] = float(rand() % 50 + 1);
			cout << arrM1[i][j] << "\t";
		}
		cout << endl;
	}

	cout << "\nИсходная матрица М2:" << endl;

	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			arrM2[i][j] = float(rand() % 50 + 1);
			cout << arrM2[i][j] << "\t";
		}
		cout << endl;
	}

	cout << "\nНа сколько уменьшить элементы матрицы М1: ";
	cin >> value;

	for (int i = 0; i < rows; i++)
	{
		arr2[i] = value;
	}

	_asm
	{
		// уменьшение всех элементов матрицы в заданное количество раз
	mov edi, 0
	vmovups ymm1, arr2[edi * 8]
	CYCLE1:
		vmovups ymm0, arrM1[edi * 8] // Получаем строку
		vdivps ymm0, ymm0, ymm1 // Вычитаем из строки
		vmovups arr3[edi * 8], ymm0 // заносим результат в arr3
		add edi, 4 // переходим на след строку

		cmp edi, 32
		je CYCLE1END
		jmp CYCLE1

	CYCLE1END:

	mov esi, 0
	mov esi, 0
	CYCLE2:
		vmovss xmm0, arrM2[esi]

		vmovss xmm1, arrM2[esi + 32]
		VPERMILPS ymm1, ymm1, 11111110b
		vorps ymm0, ymm0, ymm1
	}

	cout << "\nИзмененная матрица М1: " << endl;
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			cout << arr3[i][j] << "\t";
		}
		cout << endl;
	}

	cout << "\nМатрица-произведение М3: " << endl;
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			cout << arrM3[i][j] << "\t";
		}
		cout << endl;
	}

	cout << "\nСложение матрицы М1 и матрицы-произведение: " << endl;
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			cout << arrM1[i][j] << "\t";
		}
		cout << endl;
	}

	return 0;
}