#include <iostream>

using namespace std;

int main()
{
    char line[14] = "aauf brratka";


    
    unsigned int charpos = 0; // Позиция проверяемой буквы, которая повторяется

    __asm
    {
    BEGIN:
        mov esi, charpos; // Позиция проверяемой буквы + основной счетчик
        lea ecx, line; // указатель на строку
        mov al, [ecx][esi]; // Символ, который мы будем проверять
        mov ah, 0; // символ окончания строки
        cmp al, ah; // Если мы дошли до конца строки
        je ENDSTRING; // Заканчиваем ассемблерную вставку
        cmp al, ' '; // Если мы дошли до пробела
        je END; // переходим к следующей букве
        jmp CYCLE; // иначе главный цикл
    CYCLE:
        inc esi; // увеличили счетчик
        mov ah, [ecx][esi]; // Помещаем в ah символ который esi по счету в строке
        cmp ah, 0; // проверка на конец строки
        je END; // если конец то выход
        cmp ah, al; // сравниваем с искомым символом
        je DEL; // совпадение - переход к удалению
        cmp ah, ' '; // Сравниваем с пробелом
        je END; // Заканчиваем ассемблерную вставку, если дошли до пробела
        jmp CYCLE; // иначе далее по циклу

    DEL:
        mov edi, esi; // запоминаем текущий номер
        jmp CYCLE_2;
    CYCLE_2:
        lea ebx, [ecx][edi]; //ebx содержит указатель на текущий символ
        mov ah, [ecx][edi]; // ah содержит текущий символ
        cmp ah, 0; // если конец строки сдвиг закончен
        je PER;
        inc edi; // увеличили счетчик
        mov ah, [ecx][edi]; // edx содержит следующий символ, на него нам нужно заменить текущий
        mov [ebx], ah; // новое значение лежащее по адресу ebx (текущий := следующий)
        jmp CYCLE_2; // далее по циклу
    PER:
        dec esi;
        jmp CYCLE;
    END:
        mov eax, charpos // Увеличиваю charpos на единицу
        inc eax
        mov charpos, eax
        jmp BEGIN; // Начинаю проверять следующую букву
    ENDSTRING:
    }
    cout << line << endl;
}
