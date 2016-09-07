
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf		

segment .data
		ms1 db "Introducir el numero:",0,10
		formato db "%d",0,10
		ms2 db "El caudrado es : %d",0,10
segment .bss
num resd 1

segment .text 

global _main 					
_main:
;---------------------------------------	
				push ms1
				call _printf
				add esp,4
				
				push num
				push formato
				call _scanf
				add esp,8
				
				;mov ecx,2
				xor eax,eax
				xor ebx,ebx
				push dword [num]
				
				call cuadrado
	;..........subrutina....................
				add esp,4
				mov [num],eax
				
				push dword [num]
				push ms2
				call _printf
				add esp,8
				ret 
				
	cuadrado:	push ebp
				mov ebp,esp
				
				mov eax,[ebp+8]
				mov ebx,[ebp+8]
				mul ebx
				
				
				mov esp,ebp
				pop ebp
				ret
;---------------------------------------
	




