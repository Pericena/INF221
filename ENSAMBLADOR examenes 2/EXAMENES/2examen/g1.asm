
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf		

segment .data
msj db "introducir cadena con caracteres:",0	
msj2 db"el umero total de vocales a y u es:%d",0
formato db "%s"
d dd 100	
segment .bss
c resd 25
segment .text 

global _main 					
_main:
;---------------------------------------	
push msj
call _printf
add esp,4

push c
push formato
call _scanf
add esp,8

push c
call cant
add esp,4
push esi
push msj2
call _printf
add esp,8

ret
;---------------------------------------
;..........subrutina....................	
cant:
xor eax,eax
xor ecx,ecx
xor edx,edx
xor esi,esi
push ebp
mov ebp,esp
mov ebx,[ebp+8]
ciclo:
mov al,[ebx]
cmp al,0x61
jz cont
cmp al,0x75
jz cont
back:
inc ebx
dec dword[d]
jnz ciclo 
jmp fin
cont:
inc esi
jmp back
fin:
mov esp,ebp
pop ebp
ret



