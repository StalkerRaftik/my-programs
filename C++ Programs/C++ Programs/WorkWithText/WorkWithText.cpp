#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <Windows.h>

using namespace std;

int main()
{

    string Text;
    string line;
    ifstream input("input.txt");
    if (input.is_open())
    {
        while (getline(input, line)) {
            Text += line;
            Text += "\n";
        }

        cout << Text << "\n\n\n";
    }
    input.close();



    vector<string> Output;
    string word;
    for (size_t i = 0; i < Text.length(); i++) {
        if ((int)Text[i] < 65 || ((int)Text[i] > 90 && (int)Text[i] < 97) || (int)Text[i] > 122) {
            Output.push_back(word);
            word = "";
        }
        else {
            word += Text[i];
        }
        if (Text.length() - 1 == i) {
            Output.push_back(word);
            word = "";
        }
    }
    /*
    for (size_t element = 0; element < Output.size(); element++) {
        cout << Output[element] << " ";
    }
    cout << "\n";
    */

    // Собираем массив всех слов с кол-м использований(слова уникальные)
    struct WUsab {
        string text = "";
        int value = 0;
    };

    vector<WUsab> MostUsableWords;
    for (size_t word = 0; word < Output.size(); word++) {
        bool exist = false;
        int index;
        for (size_t i = 0; i < MostUsableWords.size(); i++) {
            if (Output[word] == MostUsableWords[i].text) {
                exist = true;
                index = i;
            }
        }
        if (exist) {
            MostUsableWords[index].value++;
        }
        else if (!exist)
        {
            WUsab newWord;
            newWord.text = Output[word];
            newWord.value = 1;

            // Убираем NUL-ы.
            if ((int)(newWord.text[0]) != 0) {
                MostUsableWords.push_back(newWord);
            }
        }
    }
    // Сначала находим максимальное значение среди всех, затем находим 10 самых часто употребляемых слов в тексте.
    int MaxValue = 0;
    for (size_t i = 0; i < MostUsableWords.size(); i++) {
        if (MostUsableWords[i].value > MaxValue) {
            MaxValue = MostUsableWords[i].value;
        }
    }

    int WordsLeft = 10;
    while (MaxValue > 0 && WordsLeft > 0) {
        for (size_t i = 0; i < MostUsableWords.size(); i++) {
            if (MaxValue == MostUsableWords[i].value) {
                cout << (MostUsableWords[i].text) << "(" << MaxValue << ")" << " ";
                WordsLeft--;
                if (WordsLeft <= 0) {
                    break;
                }
            }
        }
        MaxValue--;
    }
    cout << endl;

    // Находим сколько раз определенное слово/словосочетание встречается в тексте
    string WordToFind;
    cout << "What word do you want to find?" << endl;
    getline(cin, WordToFind);

    bool checker = false;
    for (size_t i = 0; i < MostUsableWords.size(); i++) {
        if (MostUsableWords[i].text == WordToFind) {
            cout << "Word " << WordToFind << " occurs " << MostUsableWords[i].value << " times in the text" << endl;
            checker = true;
        }
    }
    if (checker == false) {
        cout << "This word does not appear in the text" << endl;
    }

    // Замена/удаление любого слова из текста.
    int chvar = 1;
    cout << "What do you want to do with text? \n1 = delete this word in the text\n2 = replace with another word\n";
    cin >> chvar;
    cout << endl;

    if (chvar == 1) {
        while (Text.find(WordToFind) != -1) {
            Text.replace(Text.find(WordToFind), WordToFind.size() + 1, "");
        }
    }
    else {
        string NewWord;
        cout << "What word should we insert instead of old word? ";
        cin >> NewWord;

        while (Text.find(WordToFind) != -1) {
            Text.replace(Text.find(WordToFind), WordToFind.size(), NewWord);
        }
    }


    cout << Text;
}
