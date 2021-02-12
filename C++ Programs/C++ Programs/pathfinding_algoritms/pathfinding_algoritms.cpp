#include <vector>
#include <iostream>
#include <utility>
#include <string>

using namespace std;

struct way {
    int from = -1;
    int to = -1;
    int len = -1;
};

void PrintTable(vector<vector<int>> a) {
    for (int i = 0; i < a.size(); i++) {
        for (int j = 0; j < a[i].size(); j++) {
            if (a[i][j] != INT_MAX) {
                cout << a[i][j] << " ";
            }
            else {
                cout << "оо ";
            }
        }
        cout << endl;
    }
    cout << endl;
}

void DijkstraAlghoritm(int from, int to, vector<way> ways, const int nodesAmount) {
    vector<vector<int>> dkArr;
    dkArr.resize(nodesAmount);
    for (int i = 0; i < nodesAmount; i++) {
        dkArr[i].resize(nodesAmount);
        for (int j = 0; j < nodesAmount; j++) {
            dkArr[i][j] = INT_MAX; //  INT MAX - аналог бесконечного пути
        }
    } // Подготовка двумерного массива
    vector<int> fixedNodes; fixedNodes.resize(nodesAmount); // - какой узел закреплен, стадия закрепления - индекс массива
    for (int i = 0; i < fixedNodes.size(); i++) fixedNodes[i] = -1; // Обнуляем наличие закрепленных узлов
    fixedNodes[0] = from; // Первая постоянная метка - начало
    dkArr[0][from] = 0;
   /* PrintTable(dkArr);*/
    vector<int> ArrivedFrom; ArrivedFrom.resize(nodesAmount); // Информация о том, из какого узла пришли в данный узел
    for (int i = 0; i < ArrivedFrom.size(); i++) ArrivedFrom[i] = -1; // Обнуляем наличие пройденных узлов

    int PrevFixedNode = from;
    for (int i = 1; i < nodesAmount; i++) {
        for (int j = 0; j < nodesAmount; j++) {
            bool fixed = false; // Закреплен ли узел
            for (int node = 0; node < fixedNodes.size(); node++) {
                if (fixedNodes[node] == j) {
                    fixed = true;
                }
            }
            if (fixed) continue;

            bool changed = false;
            for (int way = 0; way < ways.size(); way++) {
                if (ways[way].from == PrevFixedNode && ways[way].to == j) { // Если есть путь из пр. фикс. узла в рассматриваемый узел
                    // Если значение пр. фикс. узла. + длина нового пути меньше, чем
                    // значение у этого узла в таблице сверху, то ...
                    if (
                    dkArr[i - 1][PrevFixedNode] + ways[way].len < dkArr[i - 1][j] && // Если меньше пред.знач.
                    dkArr[i - 1][PrevFixedNode] + ways[way].len < dkArr[i][j] ) // Если меньше текущ. знач.(может быть изменен на пред. итерациях если из A в Б есть больше 1 пути)
                    {
                        dkArr[i][j] = dkArr[i - 1][PrevFixedNode] + ways[way].len; // Присваиваем новое значение
                        ArrivedFrom[j] = PrevFixedNode;
                        changed = true;
                    }
                }
            }
            if (!changed) {
                dkArr[i][j] = dkArr[i - 1][j];
            }
        }
        /*PrintTable(dkArr);*/
        int NewFixedNode = 0;
        for (int j = 1; j < nodesAmount; j++) { // Ищем min знач. в строке
            if (dkArr[i][j] < dkArr[i][NewFixedNode]) {
                NewFixedNode = j;
            }
        }
        /*cout << "\nNewFixedNode = " << NewFixedNode << endl;*/
        PrevFixedNode = NewFixedNode;
        fixedNodes[i] = NewFixedNode;
        if (NewFixedNode == to) {
            if (dkArr[i][NewFixedNode] == INT_MAX) {
                cout << "Пути от " + to_string(from + 1) + " до " + to_string(to + 1) + " нет!";
            }
            else {
                cout << "Минимальный путь от " + to_string(from + 1) + " до " + to_string(to + 1) + " равен " + to_string(dkArr[i][NewFixedNode]) << endl;
                string sWay = to_string(to + 1);
                int mover = to;
                while (ArrivedFrom[mover] != -1) {
                    sWay = (to_string(ArrivedFrom[mover] + 1) + "-->") + sWay;
                    mover = ArrivedFrom[mover];
                }
                cout << sWay << endl;
            }
        }
    }
}

int main()
{
    setlocale(LC_ALL, "Russian");

    int nodesAmount = 0;

    vector<way> ways; 
    int end = false;
    int input = 0;
    int wantnewgraph = true;
    while (!end) {
        if (wantnewgraph) {
            ways.clear();
            wantnewgraph = false;
            cout << "Введите количество узлов графа: ";
            cin >> nodesAmount; cout << endl;


            for (int fNode = 0; fNode < nodesAmount; fNode++) {
                for (int sNode = 0; sNode < nodesAmount; sNode++) {
                    if (fNode == sNode) continue;
                    //if (sNode < fNode) continue; // Опционально. Если хотите чтобы путь был только в 1 сторону - вперед.
                    cout << "Есть ли путь от " + to_string(fNode + 1) + " до " + to_string(sNode + 1) + "?\n1 - да\n2 - нет\n";
                    cin >> input;
                    if (input == 1) {
                        cout << "\nКакая длина пути? ";
                        cin >> input;
                        way way;
                        way.from = fNode;
                        way.to = sNode;
                        way.len = input;
                        ways.push_back(way);
                    }
                }
            }
        }

        int from, to;
        cout << "От какого узла мы пойдем: ";
        cin >> from;
        cout << "До какого узла мы пойдем: ";
        cin >> to;
        DijkstraAlghoritm(from - 1, to - 1, ways, nodesAmount);

        cout << "Хотите продолжить?\n1 - взять этот же граф\n2 - указать новый граф\n3 - закончить программу\n";
        cin >> input;
        switch (input) {
        case 2:
            wantnewgraph = true;
            break;
        case 3:
            end = true;
            break;
        }
    }
}

