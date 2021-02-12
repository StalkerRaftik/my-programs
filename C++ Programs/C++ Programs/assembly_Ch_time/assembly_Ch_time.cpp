#include <iostream>
#include <windows.h>
#include <iomanip>
#include <fstream>
#include <intrin.h>
#pragma intrinsic(__rdtsc)


unsigned __int64 rdtsc() {
	return __rdtsc();
}
using namespace std;
int main()
{
	setlocale(LC_ALL, "Russian");
	unsigned __int64 mintime1 = -1, mintime2 = -1;		//минимальное время для тактов
	unsigned int n = 10000000;			//кол-во слагаемых ряда N
	int min1 = -1, min2 = -1;   //мин время для мсек

	double ch1, ch2;
	double z, x;
	cout << "Enter x: ";			//ввод аргумента
	cin >> x;
	unsigned int n1;
	ofstream f("out.txt");			//создать файл
							//вывести начало таблицы
	f << "------------------------------------------------------------------------------" << "\n";
	f << "|  N |     ch(x)(C++)            |C++|         ch(x)(Asm)        |Asm|" << "\n";
	f << "------------------------------------------------------------------------------" << "\n";
	cout << "---------------------------------------------------------------------------" << "\n";
	cout << "|  N |     ch(x)(C++)         |C++|          ch(x)(Asm)        |Asm|" << "\n";
	cout << "---------------------------------------------------------------------------" << "\n";


	for (int j = 0; j < 15; j++)		//Зациклить программу и определять время работы кода в цикле 15 раз
	{
		unsigned __int64 t1;
		t1 = rdtsc();		//засечь время такты
		DWORD v1 = GetTickCount64();      //время мсек
		z = 1;							//слагаемое
		ch1 = 0;						//сумма ряда
		n1 = 0;
		do
		{
			ch1 += z;								//прибавить очередное слагаемое к сумме
			z *= x * x / ((n1 + 1.0) * (n1 + 2.0));	//вычислить очередное слагаемое
			n1 += 2;
		} while (n1 / 2 < n);				//продолжаем суммировать пока не достигнем заданного числа слагаемых
		z = 0;
		unsigned __int64 t2 = rdtsc();				//засечь время
		DWORD v2 = GetTickCount64();




		_asm
		{
			fldz					//0
			mov n1, 0				//n1=0 + сумма=0 и она остается в st0
			fld1					//1
			fstp z					//z=1
			cosm1 :
			fadd z					//s+z
				fld x				//x
				fmul st(0), st(0)	//x^2
				inc n1				//n1=n1+1
				fidiv n1			//-x^2/(n+1)
				inc n1				//n1=n1+1
				fidiv n1			//-x^2/((n+1)*(n+2))
				fmul z				//z*(-x^2/((n+1)*(n+2)))
				fstp z				//z=z*(-x^2/((n+1)*(n+2)))
				mov eax, n1			//текущее n1, поскольку оно увеличивается на 2 за одну итерацию цикла
				shr eax, 1			//делим его на 2
				cmp eax, n			//пока не достигли заданного числа слагаемых
				jb cosm1			//продолжить цикл
				fstp ch2			//сохранить результат
		}






		DWORD v3 = GetTickCount64();//засечь время
		int timer1 = v2 - v1;
		int timer2 = v3 - v2;
		if (min1 == -1)
		{
			min1 = timer1;
			min2 = timer2;
		}
		else
		{
			if (timer1 < min1)
				min1 = timer1;
			if (timer2 < min2)
				min2 = timer2;
		}



		unsigned __int64 t3 = rdtsc();
		unsigned __int64 time1 = (t2 - t1);			//вычислить время работы с++
		unsigned __int64 time2 = (t3 - t2);			//и ассемблерной части
		if (mintime1 == -1)			//при первой итерации
		{
			mintime1 = time1/ 2300000;		//инициализировать минимальное время работы
			mintime2 = time2/ 2300000;
		}
		else
		{					//выбираем минимальное время работы фрагментов
			if (time1 < mintime1)
				mintime1 = time1 / 2300000;
			if (time2 < mintime2)
				mintime2 = time2 / 2300000;
		}
		f << "| " << setw(2) << j + 1 << " | " << setw(12) << setprecision(8) << ch1 << "     " << setw(6) << time1 / 2300000 << " или " << timer1
			<< " | " << setw(12) << setprecision(8) << ch2 << " | " << setw(6) << time2 / 2300000 << " или " << timer2 << "    " << "\n";
		cout << "| " << setw(2) << j + 1 << " | " << setw(12) << setprecision(8) << ch1 << "     " << setw(6) << time1 / 2300000 << " или " << timer1
			<< " | " << setw(12) << setprecision(8) << ch2 << " | " << setw(6) << time2 / 2300000 << " или " << timer2 << "    " << "\n";
	}

	f << "Минимальное время (C++) = " << mintime1 << "   или   " << min1 << "\n";
	f << "Минимальное время (Asm) = " << mintime2 << "   или   " << min2 << "\n";
	cout << "---------------------------------------------------------------------------" << "\n";
	cout << "Минимальное время (C++) = " << mintime1 << "   или   " << min1 << "\n";
	cout << "Минимальное время (Asm) = " << mintime2 << "   или   " << min2 << "\n";
	system("pause");
	return 0;
}
