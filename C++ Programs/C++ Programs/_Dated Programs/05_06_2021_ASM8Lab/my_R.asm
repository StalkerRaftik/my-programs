.686 

.model flat, C 

option casemap: none 

 

include C:\masm32\include\windows.inc 

include C:\masm32\include\kernel32.inc 

 

includelib kernel32.lib 

 

.Data 

handleFile DWORD ? 

bytesRead DWORD ? 

buff BYTE 500 DUP(?) 

 

.Code 

my_R proc C fileName: DWORD, len: DWORD 

push ebp 

push esp 

 

 

mov eax, fileName 

invoke CreateFile, eax, GENERIC_READ, NULL, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0 

mov handleFile, eax 

invoke ReadFile, handleFile, addr buff, len, addr bytesRead, 0 

invoke CloseHandle, handleFile 

mov eax, offset buff 

 

 

pop esp 

pop ebp 

ret 

my_R EndP 

End 