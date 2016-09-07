
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
	msj5 db 10,"El resultado de (a+(b-c))/(c*d) es: %d",0,10	
	a db 5
	b db 6
	c db 3
	d db 8	
segment .bss

segment .text 
global _main 					
_main:
;---------------------------------------	
;resultado en edx
	xor eax,eax
	mov al,[a]
	push eax
	push msj1
	call _printf
	add esp,8
	
	mov al,[b]
	push eax
	push msj2
	call _printf
	add esp,8
	
	xor eax,eax
	mov al,[c]
	push eax
	push msj3
	call _printf
	add esp,8
	
	mov al,[d]
	push eax
	push msj4
	call _printf
	add esp,8	
;------programa
		xor eax,eax
		xor ecx,ecx	
		xor ebx,ebx		
		xor edx,edx			
		mov bl,[c]
		mov al,[d]
		mul bl
		mov cx,ax	;cx =(c*d)
		mov dl,[b]
		sub dl,bl	;dl =(b-c)
		add dl,[a]	;dl =(dl+a)
		mov ax,dx
		div cl
		cbw
		
		push eax
		push msj5
		call _printf
		add esp,8
ret
;---------------------------------------
;..........subrutina....................	




