
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o ejemplo.o ejemplo.asm
;gcc -o ejemplo.exe ejemplo.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file: hola.asm

extern _printf, _scanf		

segment .data
		V dw 16,8,15,1,6,9
		k db 2
segment .bss

segment .text 

global _main 					
_main:
;---------------------------------------	
		xor ecx,ecx
		xor eax,eax
		mov ecx,1
for:	cmp cl,6
		jae fin			;si cl es >=a 6
		mov ax,[V + ecx * 2]
		cbw
		div byte[k]
		mov[V + ecx*2],al
		add ecx,2
jmp for
fin: ret
;---------------------------------------
;..........subrutina....................	




