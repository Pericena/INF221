
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf, _gets, _strlen

segment .data
mensaje db "ingrese cadena: ",0

segment .bss
mensaje1 resb 100
mensaje2 resb 100
segment .text 

global _main 					
_main:
;---------------------------------------	
push mensaje
call _printf
add esp,4
push mensaje1
call _gets
add esp,4
push mensaje1
call _strlen
add esp,4
mov ecx,eax
mov esi, mensaje1
mov edi,mensaje2
cld
lodsb
add al,1
ret
;---------------------------------------
;..........subrutina....................	




