
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf		

segment .data
	vector dw 1,2,3,5,7,11,12,55,33,44
	dim db 10
segment .bss
	medio resb	1
segment .text 

global _main 					
_main:
;---------------------------------------	
	xor ecx,ecx
	xor edx,edx		;contar el vector
	for:  cmp dl,[dim]
		  jae exit
			mov ecx,1
			mov bl,2
			;divide el numero entrante y lo pasa a dx
			mov ax,[vector + edx*2]
			div bl
			mov [medio],al
			xor eax,eax
			;
			mov ah,1
			ciclo:  cmp bl,[medio]
					ja salir
					mov ax,[vector + edx *2]
					div bl
					cmp ah,0
					jz salir
					inc ecx
					inc bx
			jmp ciclo
			salir: cmp byte[vector + edx*2],3
					jbe primo	
					cmp ecx,1
					jz incr
			primo: 	mov byte[vector + edx*2],0xff			
			incr: inc edx
	jmp for
	exit:	ret
;---------------------------------------
;..........subrutina....................	