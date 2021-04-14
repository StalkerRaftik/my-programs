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
		vdivps ymm0, ymm0, ymm1 // Делим строку
		vmovups arr3[edi * 8], ymm0 // заносим результат в arr3
		add edi, 4 // переходим на след строку

		cmp edi, 32
		je CYCLE1END
		jmp CYCLE1

	CYCLE1END:
	// Умножить M1 на M2
	mov edi, 0
	mov esi, 0
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	CYCLE2:
		vmovups ymm4, arrM1[edi * 8]

		// Собираем YMM
		vmovss xmm0, arrM2[esi + 128] 

		vmovss xmm1, arrM2[esi + 160]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 192]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 224]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		VPERM2F128 ymm0, ymm0, ymm0, 01b // Меняем значения старшей части и младшей местами


		// Собираем XMM
		vmovss xmm1, arrM2[esi] 
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 32]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 64]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 96]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		// Перемножаем
		vmulps ymm1, ymm0, ymm4

		VPERM2F128 ymm1, ymm1, ymm1, 01b
		movups xmm2, xmm1
		VPERM2F128 ymm1, ymm1, ymm1, 01b
		addps xmm1, xmm2

		xorps xmm2, xmm2
		addss xmm2, xmm1
		VPERMILPS ymm1, ymm1, 00111001b
		addss xmm2, xmm1
		VPERMILPS ymm1, ymm1, 00111001b
		addss xmm2, xmm1
		VPERMILPS ymm1, ymm1, 00111001b
		addss xmm2, xmm1
		
		// Решаем куда закинуть: в xmm5 или xmm4
		add esi, 4

		cmp esi, 20
		jae BIGPART // Равен или больше
		jmp SMALLPART

		SMALLPART:
		addss xmm5, xmm2
		VPERMILPS ymm5, ymm5, 00111001b
		jmp CONTINUE
		BIGPART:
		addss xmm6, xmm2
		VPERMILPS ymm6, ymm6, 00111001b
		CONTINUE:


		cmp esi, 32
		je COLUMNDONE
		jmp CYCLE2

		// Если все 8 чисел получены, то мы переходим к следующей строке
		COLUMNDONE:
			movups xmm3, xmm6
			VPERM2F128 ymm3, ymm3, ymm3, 01b
			movups xmm3, xmm5
		    vmovups arrM3[edi * 8], ymm3
			add edi, 4
			mov esi, 0
			xorps xmm5, xmm5
			xorps xmm6, xmm6

			cmp edi, 32
			je CYCLE2END
			jmp CYCLE2

	CYCLE2END:

	// Сложение первой матрицы и матрицы-произведения
	mov edi, 0
	CYCLE3:
		vmovups ymm0, arrM1[edi * 8] // Получаем 1 строку
		vmovups ymm1, arrM3[edi * 8] // Получаем 2 строку
		VADDPS ymm0, ymm0, ymm1

		vmovups arrM1[edi * 8], ymm0

		add edi, 4

		cmp edi, 32
		je CYCLE3END
		jmp CYCLE3

	CYCLE3END:

	}

	int firstRow;
	int secondRow;
	cin >> firstRow;
	cin >> secondRow;
	firstRow *= 4;
	secondRow *= 4;

	__asm {
		mov esi, firstRow
		mov edi, secondRow

		// Собираем YMM
		vmovss xmm0, arrM2[esi + 128]

		vmovss xmm1, arrM2[esi + 160]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 192]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 224]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		VPERM2F128 ymm0, ymm0, ymm0, 01b // Меняем значения старшей части и младшей местами


		// Собираем XMM
		vmovss xmm1, arrM2[esi]
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 32]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 64]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[esi + 96]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		
		vmovups ymm2, ymm0


		// Собираем YMM
		vmovss xmm0, arrM2[edi + 128]

		vmovss xmm1, arrM2[edi + 160]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[edi + 192]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[edi + 224]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		VPERM2F128 ymm0, ymm0, ymm0, 01b // Меняем значения старшей части и младшей местами


		// Собираем XMM
		vmovss xmm1, arrM2[edi]
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[edi + 32]
		VPERMILPS ymm1, ymm1, 11100001b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[edi + 64]
		VPERMILPS ymm1, ymm1, 11000110b
		vorps ymm0, ymm0, ymm1

		vmovss xmm1, arrM2[edi + 96]
		VPERMILPS ymm1, ymm1, 00100111b
		vorps ymm0, ymm0, ymm1

		vmulps ymm0, ymm0, ymm2
		vmovups arr2[0 * 8], ymm0
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

	cout << "\nПеремножение двух столбцов: " << endl;
	for (int i = 0; i < rows; i++)
	{
		cout << arr2[i] << " ";
		cout << endl;
	}
}