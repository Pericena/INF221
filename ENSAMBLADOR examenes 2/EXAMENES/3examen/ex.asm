
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf		

segment .data
		formato db "%s",0
		msg1 db "INTRODUZCA SU CADENA: ",0,10
		msg2 db "LA CADENA CONVERTIDA ES: %s",0,10
segment .bss
		cad resb 100
		cadr resb 100
segment .text 

global _main 					
_main:
;---------------------------------------	
	push msg1
	call _printf
	add esp,4
	
	push cad 
	push formato
	call _scanf
	add esp,8
	   cld	
	push cad
	push cadr
	mov ecx,100
	xor eax,eax
	
	call convertir
	add esp,8
	
	push cadr
	push msg2
	call _printf
	add esp,8

ret
;---------------------------------------
;..........subrutina....................	
		convertir: 
				push ebp
				mov ebp,esp
				mov esi,[ebp+12]
				mov edi,[ebp+8] 
		ciclo:		
				lodsb
				xor al,0x20
				stosb
		loop ciclo		
		mov esp,ebp
		pop ebp
	ret



