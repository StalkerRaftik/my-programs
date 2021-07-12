// ASSEMBLER LAB8.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//


#include <iostream> 

using namespace std;

extern "C" {   void my_Wr(char* x, char* y, int l); }
extern "C" {   char* my_R(char* x, int l);  }


int main() {

    char fileName[14] = "fileW.txt";

    char fileText[7] = "OUTPUT";

    my_Wr(fileName, fileText, strlen(fileText));
    cout << my_R(fileName, strlen(fileText));


    return 0;

}