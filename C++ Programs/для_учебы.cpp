#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <Windows.h>

using namespace std;

int IsWordOccursInString(string str, string Filter) {
    int Begin = str.find(Filter);
    if (Begin != -1) {
        if (Begin-1 == -1 || str[Begin-1] == ' ') {
            if (Begin + Filter.length() == str.length() || str[Begin + Filter.length()] == ' ') {
                return Begin;
            }
        }
    }

    return -1;
}

void ReplaceWordInString(string &str, string word, string replace) {
    while ( IsWordOccursInString(str, word) != -1 ) {
        int Begin = IsWordOccursInString(str, word);
        if (Begin - 1 == -1 || str[Begin - 1] == ' ') {
            if (Begin + word.length() == str.length() || str[Begin + word.length()] == ' ') {
                str.replace(Begin, word.length(), replace);
            }
        }
    }
}

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

    
    struct WUsab {
        string text = "";
        int value = 1;
    };

    vector<WUsab> MostUsableWords;
    string word = "";
    for (size_t i = 0; i < Text.length(); i++) {
        if ( ( (int)Text[i] < 65 || ((int)Text[i] > 90 && (int)Text[i] < 97) || (int)Text[i] > 122 ) || Text.length()-1 == i ) {
            if (word != "") {
                bool exist = false;
                for (int i = 0; i < MostUsableWords.size(); i++) {
                    if (MostUsableWords[i].text == word) {
                        MostUsableWords[i].value++;
                        exist = true;
                        word = "";
                        break;
                    } 
                }
                if (!exist) {
                    WUsab NewWord;
                    NewWord.text = word;
                    MostUsableWords.push_back(NewWord);
                    word = "";
                }
                
            }
        }
        else {
            word += Text[i];
        }
    }

    
    /*
    for (size_t element = 0; element < MostUsableWords.size(); element++) {
        cout << MostUsableWords[element].text << " " << MostUsableWords[element].value << "\n";
    }
    cout << "\n";*/

    
    // Сначала находим максимальное значение среди всех, затем находим 10 самых частых.
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


    int chvar = 1;
    cout << "What do you want to do with text? \n1 = delete this word in the text\n2 = replace with another word\n3 = I want to choose in each sentence.\n";
    cin >> chvar;
    cout << endl;

    if (chvar == 1) {
        ReplaceWordInString(Text, WordToFind, "");
    }
    else if (chvar == 2) {
        string NewWord;
        cout << "What word should we insert instead of old word? ";
        cin >> NewWord;
        ReplaceWordInString(Text, WordToFind, NewWord);
    } 
    else if (chvar == 3) {
        string Sentence = "";
        int mover = 0;
        int BeginOfSentence = 0;
        while (mover < Text.length()) {
            if (Text[mover] == '.') {
                Sentence = "";
                for (int i = BeginOfSentence; i <= mover; i++) {
                    Sentence += Text[i];
                }
                int OldSentenceLength = Sentence.length(); // Пригодится в конце для замены старого предложения на новое.
                bool needtochoose = IsWordOccursInString(Sentence, WordToFind) != -1;
                if (needtochoose) {
                    cout << "Delete(1) or Insert(2) another word? \n";
                    cout << Sentence;
                    cin >> chvar;

                    if (chvar == 1) {
                        ReplaceWordInString(Sentence, WordToFind, "");
                    }
                    else if (chvar == 2) {
                        string NewWord;
                        cout << "What word should we insert instead of old word? ";
                        cin >> NewWord;
                        ReplaceWordInString(Sentence, WordToFind, NewWord);
                    }
                    Text.replace(BeginOfSentence, OldSentenceLength, Sentence);
                }
                BeginOfSentence = BeginOfSentence + Sentence.length();
                mover = BeginOfSentence;
            }
            mover++;
        }

    }
    
    cout << endl << endl << Text;
}
