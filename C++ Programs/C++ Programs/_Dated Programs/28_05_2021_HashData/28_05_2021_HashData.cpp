#include <iostream>
#include <string>
#include <ctime>	
#include <string>
#include <typeinfo>
#include <list>
#include <vector>
#include <fstream>
#include "../print.h"

using namespace std;



class HashTable {
private:
	static const int SIZE = 10;
	int hashMode = 1;
public:
	struct Data
	{
		string Name = "";
		string Position = "";
		int JoinYear = -1;
	};

	 list<Data> tbl[SIZE];


	 int hashFunc(Data dt) {
		 int hash = 0;
		 switch (this->hashMode) {
			case 1:
				hash = hashFunc1(dt);
			case 2:
				hash = hashFunc2(dt);
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

	// Хэш-функция середина квадрата
	int hashFunc1(Data dt) {
		int key = 0;

		for (char ch : dt.Name) {
			key += (int)ch;
		}

		for (char ch : dt.Position) {
			key += (int)ch;
		}
		key += dt.JoinYear;

		key = key * key;
		key = key >> 11; // Отбрасываем 11 младших бит
		key = key % 1024; // Возвращаем 10 младших бит

		return key % SIZE;
	}

	void Add(Data dt) {
		int key = hashFunc(dt);


		this->tbl[key].push_back(dt);
	}

	Data* Find(Data dt) {
		int key = hashFunc(dt);
		list<Data> l = this->tbl[key];
		
		for (auto iter = l.begin(); iter != l.end(); ++iter) {
			Data dt2 = (*iter);
			if (dt.JoinYear == dt2.JoinYear && dt.Name == dt2.Name && dt.Position == dt2.Position) {
				return &(*iter);
			}
		}

		return nullptr;
	}

	void Remove(Data dt) {
		int key = hashFunc(dt);
		list<Data> l = this->tbl[key];
		for (auto iter = l.begin(); iter != l.end(); ++iter) {
			Data dt2 = (*iter);
			if (dt.JoinYear == dt2.JoinYear && dt.Name == dt2.Name && dt.Position == dt2.Position) {
				l.erase(iter);
				return;
			}
		}
	}

	void ClearHashTable() {
		for (int i = 0; i < SIZE; i++) {
			tbl[i].clear();
		}
	}

	string getInfo() {
		string output = "";
		for (int i = 0; i < SIZE; i++) {
			list<Data> l = this->tbl[i];
			output += "=========   " + to_string(i) + ":   =========\n";
			for (auto iter =  l.begin(); iter != l.end(); ++iter) {
				Data dt = (*iter);
				output += "#" + to_string(hashFunc(dt)) + " | " + dt.Name + ", должность: " + dt.Position + ", принят на работу в " + to_string(dt.JoinYear) + " году.\n";
			}
		}
		return output;
	}

};


int main()
{
	setlocale(LC_ALL, "Russian");
	HashTable tbl;
	int input = -2;
	string strin = "";

	ifstream fin("table.txt"); // создаём объект класса ofstream для записи и связываем его с файлом cppstudio.txt
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
			dt.Name = words[0] + words[1];
			for (int i = 2; i < words.size()-1; i++)
				dt.Position += words[i] + " ";
			dt.Position[dt.Position.size() - 1] = '\0';
			dt.JoinYear = stoi(words[words.size()-1]);

			tbl.Add(dt);
		}
	fin.close(); // закрываем файл


	while (input != -1) {
		print("======Меню=====");
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
			
				tbl.Add(dt);
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

				tbl.Remove(dt);
				break;
			}
			case 3:
				print(tbl.getInfo());
				break;
			case 4:
				tbl.ClearHashTable();
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

				tbl.Find(dt);

				break;
			}
			case 6: {
				input = -1;
			}
		}
	}
}



