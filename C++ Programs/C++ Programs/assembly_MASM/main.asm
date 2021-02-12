.386 
.model flat, stdcall 
option casemap: none 

includelib kernel32.lib 

GetStdHandle PROTO :DWORD  

ReadConsoleA PROTO :DWORD, :PTR BYTE, :DWORD, 
                   :PTR DWORD, :DWORD

SetConsoleTextAttribute PROTO :DWORD, :DWORD 
                
WriteConsoleA PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD 

ExitProcess PROTO :DWORD 

.data 
    buffer BYTE 200 DUP (' ') 
    handleConsole DWORD ? 
    sizeReads DWORD ? 

.code 
    main Proc 
    
    mov ebx, 0 
    
    push -10
    call GetStdHandle 
    mov handleConsole, eax 

    push 0 
    push offset sizeReads 
    push 11d 
    push offset buffer 
    push handleConsole 
    call ReadConsoleA 

    push -11 
    call GetStdHandle 
    mov handleConsole, eax 
  Print: 
    mov edx, ebx 
    inc edx
  
    push edx 
    push handleConsole 
    call SetConsoleTextAttribute
 
    mov edx, offset buffer 
    add edx, ebx
   
    push 0 
    push offset sizeReads 
    push 1d
    push edx 
    push handleConsole 
    call WriteConsoleA 
   
    inc ebx
   
    cmp ebx, 11 
    jne Print 
      

    push 15 ;
    push handleConsole 
    call SetConsoleTextAttribute 

    call ExitProcess
    main EndP
end main 



