
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o ejemplo.o ejemplo.asm
;gcc -o ejemplo.exe ejemplo.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file: hola.asm

extern _printf, _scanf		

segment .data
msj1 db 10,"El valor de a es:%d",0,10
msj2 db 10,"El valor de b es:%d",0,10
msj3 db 10,"El valor de c es:%d",0,10
msj4 db 10,"El valor de d es:%d",0,10
msj5 db 10,"El valor de la expresion a - 3b + 25(c-d)es: %d",0,10
	a db 7
	b db 9
	c db 13
	d db 5
segment .bss
	x resd 1
segment .text 
global _main 					
_main:
;---------------------------------------	
;-----------llenando la pila
	xor eax,eax
	;----1 dato
	mov al,[a]
	push eax
	push msj1
	call _printf
	add esp , 8
	;----2 dato
	mov al,[b]
	push eax
	push msj2
	call _printf
	;
	mov al,[c]
	push eax
	push msj3
	call _printf
	;
	mov al,[d]
	push eax
	push msj4
	call _printf
;--------------- programa ------------------------
	xor eax,eax
	xor ecx,ecx
	mov al,[c]
	sub al,[d]
	mov bl,25
	mul bl
	xor ecx,ecx	
	xor ebx,ebx	
	mov cx,ax 	;25(c-d)
	mov al,[b]
	mov bl,3
	mul bl		;3b
	xor edx,edx	
	sub al,[a]
	sub cx,ax 
	
	mov x,[ecx]
	push ecx 
	push msj5
	call _printf
	add esp , 8
ret
;..........subrutina....................	




