#include <iostream>

using namespace std;

int main()
{
    
    int a, x, y1, y2, y;
    cin >> a >> x;
    
    __asm 
    {
        mov eax, a
        mov ebx, x

        cmp ebx, eax
        jnle xbiggera
        jmp else1

    xbiggera:
        cmp ebx, 0
        jnl negend
        
        neg ebx
        negend:

        add eax, ebx
        mov y1, eax // y1 готов
        jmp ifend1
    else1:
        sub eax, 7
        mov y1, eax
    ifend1:
        mov eax, a
        mov ebx, x

        cmp a, 3
        jnle abiggerthree
        jmp else2
    abiggerthree:
        mov ebx, 3
        mul ebx
        mov y2, eax
        jmp ifend2
    else2:
        mov y2, 11
    ifend2:
        mov eax, y1
        mov ebx, y2
        sub eax, ebx
        mov y, eax
    }
    cout << a << x << " " << y1 << " " << y2 << " " << y;
}