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

		if ((int)chr1 > 64 && (int)chr1 < 91) {
			chr1 = (char)+32;
		}
		if ((int)chr2 > 64 && (int)chr2 < 91) {
			chr2 = (char)+32;
		}

		if ((int)chr1 > (int)chr2) {
			return true;
		}
		else {
			return false;
		}
	}

	if (str1.Length == str2.Length)
		return false;
	else
		return length == str1.Length ? true : false;
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

	std::sort(vec.begin(), vec.end(), compareFunc);

	for (int i = 0; i < vec.size(); i++) {
		std::cout << vec[i] << '\n';
	}

	/*vec[0].Print();
	vec[1].Print();
	vec[0] = std::move(vec[1]);
	vec[0].Print();
	vec[1].Print();*/
}



