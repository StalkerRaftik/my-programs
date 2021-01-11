#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

// 
int main()
{   
    setlocale(LC_ALL, "rus");

    string Text;
    ifstream input("input.txt");
        if (input.is_open())
        {
            getline(input, Text);
            cout << Text << endl;
        }
    input.close();

    string Filter;
    getline(cin, Filter);

    string word;

    vector<string> Output;

    for (size_t i = 0; i < Text.length(); i++) {
        if (Text[i] == ' ') {
            Output.push_back(word);
            word = "";
        }
        else if (Text[i] != ' ') {
            word += Text[i];
        }
        if (Text.length()-1 == i) {
            Output.push_back(word);
            word = "";
        }
    }
    /* Для дебага. Принтит все элементы
    for (size_t element = 0; element < Output.size(); element++) {
        cout << Output[element] << " ";
    }
    cout << "\n";
    */


    int counter;
    for (size_t element = 0; element < Output.size(); element++) {
        counter = 0;
        for (int i = 0; i < Output[element].length(); i++) {
            if ( counter != Filter.length() && Output[element][i] != Filter[counter] ) {
                counter = 0;
            }
            else if ( counter != Filter.length() && Output[element][i] == Filter[counter] ) {
                counter++;
            }
        }
        if (counter != Filter.length()) {
            Output[element] = "";
        }
    }

    for (size_t element = 0; element < Output.size(); element++) {
        if (Output[element] != "") {
            cout << Output[element] << " ";
        }
    }
}
