;nasm -f win32 -o exa.o exa.asm -l exa.lst
;gcc -o exa.exe exa.o
;%%%%%%%%%%%%%%%%%%%%%%%
;file: P2E1a.asm

extern _printf, _scanf		

segment .data
	v dw 46,50,85,852,785,451,365
	n db 7
	
segment .bss
	suma resw  1
segment .text 

global _main 					
_main:
;---------------------------------------	
		xor ecx,ecx
		
ciclo:	cmp cl,[n]
		jz salir
		mov ax,[v+ecx*2]
		cmp ax,49
		jns sumar
		jmp incre
sumar:	cmp ax,99
		jns incre
		add [suma],ax
		
incre:	add cl,1
		jmp ciclo
salir: 
ret
