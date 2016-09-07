

segment .data
  v dw 16,8,5,1,6,9
  longitud db 6 
  k db 2
  segment .text 
  global _main 
  
  _main:
   mov  ecx,1
   mov bl,[k]
   
   ciclo: cmp  cl,[longitud]
          jae salir 
		  mov ax,[v + ecx*2];tipo word 2
		  div  bl 
		  cbw ;extendido a word 
		  mov [v + ecx*2],ax		  
	       add ecx ,2
		   jmp ciclo
		   
		  salir:   
ret 