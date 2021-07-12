#include <iostream>
#include <string>
#include <ctime>	
#include <string>
#include <typeinfo>
#include <list>
#include <vector>
#include <fstream>
#include "print.h"

using namespace std;



class HashTable {
private:
	static const int SIZE = 50;
public:
	int ModeForhash = 1;
	struct Data
	{
		string Name = "";
		string Position = "";
		int JoinYear = -1;
	};

	 list<Data> Table[SIZE];

	 int hashFunction(Data dt) {
		 int hash = 0;
		 switch (this->ModeForhash) {
		 case 1:
			 hash = hashFunc1(dt);
			 break;
		 case 2:
			 hash = hashFunc2(dt);
			 break;
		 }
		 return hash;
	 }

	 // Хэш-функция метод деления
	 int hashFunc2(Data dt) {
		 int key = 0;

		 for (char ch : dt.Name) {
			 key += (int)ch;
		 }

		 for (char ch : dt.Position) {
			 key += (int)ch;
		 }
		 key += dt.JoinYear;

		 return key % SIZE;
	 }

	 // Хэш-функция метод свертывания
	 int hashFunc1(Data dt) {
		 int key = 0;

		 for (char ch : dt.Name) {
			 key += (int)ch;
		 }

		 for (char ch : dt.Position) {
			 key += (int)ch;
		 }
		 key += dt.JoinYear;

		 int sum = 1;
		 while (SIZE > (int)pow(10, sum)) sum++;

		 int finalKey = 0;
		 while (key > 0) {
			 for (int i = 0; i <= sum; i++) {
				 finalKey += key % (int)pow(10, sum);
				 key = key / (int)pow(10, sum);
			 }
		 }

		 return finalKey % SIZE;
	 }

	void Add(Data dt) {
		int key = hashFunction(dt);


		this->Table[key].push_back(dt);
	}

	void Find(Data dt) {
		int key = hashFunction(dt);
		list<Data> l = this->Table[key];
		
		for (std::list<Data>::iterator iter = l.begin(); iter != l.end(); ++iter) {
			Data dt2 = (*iter);
			if (dt.JoinYear == dt2.JoinYear && dt.Name == dt2.Name && dt.Position == dt2.Position) {
				print("Хэш:" + to_string(hashFunction(dt)) + ", " + dt.Name + ", должность: " + dt.Position + ", принят на работу в " + to_string(dt.JoinYear) + " году.");
				return;
			}
		}
		print("Элемент не был найден!");
	}

	void Remove(Data dt) {
		int key = hashFunction(dt);
		list<Data>* l = &(this->Table[key]);
		for (auto iter = (*l).begin(); iter != (*l).end(); ++iter) {
			Data dt2 = (*iter);
			if (dt.JoinYear == dt2.JoinYear && dt.Name == dt2.Name && dt.Position == dt2.Position) {
				(*l).erase(iter);
				return;
			}
		}
	}

	void ClearHashTable() {
		for (int i = 0; i < SIZE; i++) {
			Table[i].clear();
		}
	}

	string getInfo() {
		string output = "";
		for (int i = 0; i < SIZE; i++) {
			list<Data> l = this->Table[i];
			//output += "=========   " + to_string(i) + ":   =========\n";
			for (auto iter =  l.begin(); iter != l.end(); ++iter) {
				Data dt = (*iter);
				output += "Хэш:" + to_string(hashFunction(dt)) + ", " + dt.Name + ", должность: " + dt.Position + ", принят на работу в " + to_string(dt.JoinYear) + " году.\n";
			}
		}
		return output;
	}

};


int main()
{
	setlocale(LC_ALL, "Russian");
	HashTable Table;
	int input = -2;
	string strin = "";

	print("Выберите хэш функцию:\n1 - метод свертывания\n2 - метод деления");
	getline(cin, strin);
	input = stoi(strin);
	Table.ModeForhash = input;

	ifstream fin("table.txt");
		while (!fin.eof()) {
			getline(fin, strin);

			vector<string> words;
			
			string word = "";
			for (int i = 0; i < strin.size(); i++) {
				if (strin[i] != ' ') word += strin[i];
				else {
					words.push_back(word);
					word = "";
				}
			}
			words.push_back(word);

			HashTable::Data dt;
			dt.Name = words[0] + " " + words[1];
			for (int i = 2; i < words.size()-1; i++)
				dt.Position += words[i] + " ";
			dt.Position.erase(dt.Position.size() - 1);
			dt.JoinYear = stoi(words[words.size()-1]);

			Table.Add(dt);
		}
	fin.close();


	while (input != -1) {
		print("меню");
		print("1 - добавить элемент\n2 - удалить элемент\n3 - вывести хэш-таблицу\n4 - очистить хэш-таблицу\n5 - найти элемент\n6 - выйти");
		getline(cin, strin);
		input = stoi(strin);
		switch (input) {
			case 1: {
				HashTable::Data dt;

				print("Введите ФИО:");
				getline(cin, strin);
				dt.Name = strin;

				print("Введите должность:");
				getline(cin, strin);
				dt.Position = strin;

				print("Введите год принятия на работу:");
				getline(cin, strin);
				dt.JoinYear = stoi(strin);
			
				Table.Add(dt);
				break;
			}
			case 2: {
				HashTable::Data dt;

				print("Введите ФИО:");
				getline(cin, strin);
				dt.Name = strin;

				print("Введите должность:");
				getline(cin, strin);
				dt.Position = strin;

				print("Введите год принятия на работу:");
				getline(cin, strin);
				dt.JoinYear = stoi(strin);

				Table.Remove(dt);
				break;
			}
			case 3:
				print(Table.getInfo());
				break;
			case 4:
				Table.ClearHashTable();
				break;
			case 5: {
				HashTable::Data dt;

				print("Введите ФИО:");
				getline(cin, strin);
				dt.Name = strin;

				print("Введите должность:");
				getline(cin, strin);
				dt.Position = strin;

				print("Введите год принятия на работу:");
				getline(cin, strin);
				dt.JoinYear = stoi(strin);
				 
				Table.Find(dt);
				break;
			}
			case 6: {
				input = -1;
			}
		}
	}
}



