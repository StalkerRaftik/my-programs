#include <iostream>



int main()
{
    int y, a;
    
    __asm {
        mov eax, 5
        mov ebx, 3
        mul ebx
        mov ebx, eax
        mov eax, 13
        mov ecx, 4
        sub edx, edx
        div ecx
        add eax, ebx
        mov a, eax // Числитель
        mov eax, 12
        mov ecx, 5
        sub edx, edx
        div ecx
        add eax, 1 // Знаменатель
        mov ecx, eax
        mov eax, a
        sub edx, edx
        div ecx
        mov a, eax // первая дробь готова


        mov eax, 13
        mov ecx, 3
        sub edx, edx
        div ecx // Третья дробь готова

        mov ebx, a
        sub ebx, 28
        add ebx, eax

        mov y, ebx
        
    }

    std::cout << y;
}