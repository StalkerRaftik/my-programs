#include <iostream>
#include <string>
#include <ctime>	
#include <string>
#include <typeinfo>
#include "../print.h"

using namespace std;



class HashTable {
private:
	static const int SIZE = 2;
	class TwoLinkedList {
	private:
		// Иниц. элементов списка
		struct listelem {
			listelem* pred = nullptr; //Ссылка на следущий элемент списка
			string value; // Информация элемента
			listelem* next = nullptr; //Ссылка на следущий элемент списка
		};

		// Иниц. дин. списка
		struct dyn_list {
			listelem* head; // Первый элемент (голова) списка
			listelem* tail; // Последний элемент (хвост) списка
		};

		dyn_list l;
	public:

		// Конструктор
		TwoLinkedList() {
			constr_list();
		}

		void clear_list()
		{
			if (l.head == nullptr) return;
			listelem* mover = l.head;
			while (mover->next != nullptr) {
				mover = mover->next;
				delete mover->pred;
			}
			delete mover;
			constr_list();
		}

		// Проверка на пустоту
		bool is_empty() {
			return l.head == nullptr && l.tail == nullptr;
		}

		// Удаление элемента
		bool delete_elem(string info) {
			listelem* mover = l.head;
			while (mover != nullptr && mover->value != info) {
				mover = mover->next;
			}
			if (mover != nullptr) {
				if (mover->next != nullptr) {
					if (mover->pred != nullptr) {
						mover->next->pred = mover->pred;
					}
					else {
						mover->next->pred = nullptr;
					}
				}
				if (mover->pred != nullptr) {
					if (mover->next != nullptr) {
						mover->pred->next = mover->next;
					}
					else {
						mover->pred->next = nullptr;
					}
				}
				if (mover == l.head) l.head = mover->next;
				if (mover == l.tail) l.tail = mover->pred;
				delete mover;
				return true;
			}
			return false;
		}

		// Создание пустого списка
		void constr_list()
		{
			l.head = nullptr;
			l.tail = nullptr;
		}

		// Поиск элемента в списке
		listelem* FindElem(string info) {
			listelem* mover = l.head;
			while (mover != nullptr) {
				if (mover->value == info) return mover;
				mover = mover->next;
			}
			return nullptr;
		}

		// Добавление элемента по убыванию
		bool add_elem(string info)
		{
			if (FindElem(info)) return false;

			listelem* elem = new listelem();
			elem->value = info;
			if (is_empty()) {
				l.head = elem;
				l.tail = elem;
			}
			else {
				listelem* mover = l.head;
				while (mover != nullptr && mover->value > info) {
					mover = mover->next;
				}
				if (mover == nullptr) {
					l.tail->next = elem;
					elem->pred = l.tail;
					l.tail = elem;
				}
				else if (mover->pred == nullptr) {
					l.head->pred = elem;
					elem->next = l.head;
					l.head = elem;
				}
				else {
					elem->next = mover;
					elem->pred = mover->pred;
					mover->pred->next = elem;
					mover->pred = elem;
				}
			}
			return true;
		}

		// Получение информации об элементах списка
		string GetListInfo()
		{
			listelem* mover = l.head;
			int counter = 1;
			string result;
			while (mover != nullptr) {
				result = result + to_string(counter) + " " + mover->value + "\n";
				counter++;
				mover = mover->next;
			}

			return result;
		}
	};
public:
	TwoLinkedList tbl[SIZE];

	// Хэш-функция
	int hashFunc(string str) {
		int key = 0;

		for (char ch : str) {
			key += (int)ch;
		}

		key = key * key;
		key = key >> 11; // Отбрасываем 11 младших бит
		key = key % 1024; // Возвращаем 10 младших бит

		return key % SIZE;
	}

	void Add(string str) {
		int key = hashFunc(str);
		int SuccessfulAdd = tbl[key].add_elem(str);
		if (SuccessfulAdd) {
			print("Element " + str + " successfully added to the table");
			return;
		}
		else {
			print("Element " + str + " is already exists in the table");
		}
	}

	void Remove(string str) {
		int key = hashFunc(str);
		int SuccessfulDelete = tbl[key].delete_elem(str);
		if (SuccessfulDelete) {
			print("Element " + str + " successfully removed from the table");
		}
		else {
			print("Element not found");
		}
	}

	void ClearHashTable() {
		for (int i = 0; i < SIZE; i++) {
			tbl[i].clear_list();
		}
	}

	string getInfo() {
		string output = "";
		for (int i = 0; i < SIZE; i++) {
			output += "=========   " + to_string(i) + ":   =========\n";
			output += tbl[i].GetListInfo();
		}
		return output;
	}

};


int main()
{
	setlocale(LC_ALL, "Russian");
	HashTable tbl;
	int input = -1;
	string strin = "";
	while (true) {
		print("======Меню=====");
		print("1 - добавить элемент\n2 - удалить элемент\n3 - вывести хэш-таблицу\n4 - очистить хэш-таблицу\n5 - выход");
		cin >> input;
		switch (input) {
			case 1:
				print("Введите ключ:");
				cin >> strin;
				tbl.Add(strin);
				break;
			case 2:
				print("Введите ключ:");
				cin >> strin;
				tbl.Remove(strin);
				break;
			case 3:
				print(tbl.getInfo());
				break;
			case 4:
				tbl.ClearHashTable();
				break;
		}
	}
}



