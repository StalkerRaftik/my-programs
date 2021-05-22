#include <iostream>
#include <vector>
#include <algorithm> 
#include "string.h"

bool compareFunc(String str1, String str2)
{
	int length = str1.Length > str2.Length ? str2.Length : str1.Length;

	char chr1;
	char chr2;
	for (int i = 0; i < length; i++) {
		chr1 = str1[i];
		chr2 = str2[i];

		if (chr1 > 64 && chr1 < 91) {
			chr1 = (char)((int)chr1 + 32);
		}
		if (chr2 > 64 && chr2 < 91) {
			chr2 = (char)((int)chr2 + 32);
		}

		if (chr1 != chr2)
			return chr1 > chr2;
	}

	if (str1.Length < str2.Length)
		return false;
	else if (str1.Length > str2.Length) {
		return true;
	}

	return false;
}

int main()
{
	setlocale(LC_ALL, "Russian");
	
	std::cout << "Введите список строк через пробел:\n";
	
	std::vector<String> vec;


	char input[256];
	do {
		std::cin >> input;
		vec.push_back(String(input));
	} while (std::cin.peek() != '\n');

	compareFunc(vec[0], vec[1]);

	std::sort(vec.begin(), vec.end(), compareFunc);

	for (size_t i = 0; i < vec.size(); i++) {
		std::cout << vec[i] << '\n';
	}

	/*vec[0].Print();
	vec[1].Print();
	vec[0] = std::move(vec[1]);
	vec[0].Print();
	vec[1].Print();*/
}



