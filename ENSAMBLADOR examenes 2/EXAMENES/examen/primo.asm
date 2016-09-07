
;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o ejemplo.o ejemplo.asm
;gcc -o ejemplo.exe ejemplo.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file: hola.asm

extern _printf, _scanf		

segment .data
		n dw 6
segment .bss
		esprimo resb 1
		medio resw	1
		noprimo resb 1
segment .text 
global _main 					
_main:
xor ecx,ecx
xor edx,edx
mov ecx,1
mov bx,2
;divide el numero entrante y lo pasa a dx
;---------------------------------------	
         	mov ax,[n]
            div bx
            cbw 
         	mov [medio],ax
			xor eax,eax
	;
			mov ah,1                   	
        	ciclo:  cmp bx,[medio]
                    ja salir
          			mov ax,[n]
                    div bl
                  	cmp ah,0
                    jz salir
                    inc ecx
                    inc bx
            jmp ciclo
            salir:  cmp ecx,1
                   	jnz primo
          		    mov [noprimo],ah
                   	jmp exit
          	primo: mov[esprimo],ah
			exit:	ret		


;---------------------------------------
;..........subrutina....................	




