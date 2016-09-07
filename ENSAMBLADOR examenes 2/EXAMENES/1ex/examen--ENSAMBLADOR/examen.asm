
;%%%%%%%%%%%%%%%%%%%%%%%
;NOMBRE : HERNAN LUIS PEÑAFIEL VELASQUEZ
;REGISTRO: 200438859
;
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file:  P1.asm

extern _printf, _scanf		

segment .data
		vec dw -128,-55,-206,83,10,-57,35,99,-100,267,313,967
		tam db  12
segment .bss

		promedio resw 1

segment .text 

global _main 					
_main:
;---------------------------------------	
		xor eax,eax
		xor ebx,ebx
		xor ecx,ecx
		xor edx,edx
		
incre:cmp cl,[tam]
		jz prom
		mov bx,[vec+ecx*2]
		add ax,bx
		add cl,1
		jmp incre

	prom:idiv cx
		 mov [promedio],al
fin: ret
;---------------------------------------
;..........subrutina....................	




