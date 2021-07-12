
.686 

.model flat, C 

option casemap: none 

 

include C:\masm32\include\windows.inc 

include C:\masm32\include\kernel32.inc 

 

includelib kernel32.lib 

 

.Data 

handleFile DWORD ? 

bytesWrit DWORD ? 

 

.Code 

my_Wr proc C fileName: DWORD, fileText: DWORD, len: DWORD 

push ebp 

push esp 

push eax 

 

mov eax, fileName 

invoke CreateFile, eax, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0 

mov handleFile, eax 

mov ebx, fileText 

invoke WriteFile, handleFile, ebx, len, addr bytesWrit, 0 

invoke CloseHandle, handleFile 

 

 

pop eax 

pop esp 

pop ebp 

ret 

my_Wr EndP 

End 