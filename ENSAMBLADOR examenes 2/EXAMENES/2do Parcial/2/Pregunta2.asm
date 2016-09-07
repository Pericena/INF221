.MODEL small
.STACK 100h

.DATA
inv1    DB  'Ingresa un texto (entre 40 y 80 char)',10,13,'$'
inv2    DB  'Ingresa un numero (entre 10 y 40)',10,13,'$'
sal1    DB  10,13,' # de letras','$'
sal2    DB  10,13,'El caracter es: ','$'
sal3    DB  10,13,'La palabra es: ','$'
texto   DB  81,?,81 DUP(?)
N       DB ?	
.CODE
        	MOV AX,@DATA  ;DEFECTO
	        MOV DS,AX     ;DEFECTO
         	MOV AH,9h
          	LEA DX,inv1
                INT 21h ; MUESTRA inv1 EN PANTALLA	
                MOV AH,10h
                LEA DX,texto
                INT 21h ; CAPTURA texto 
                MOV AH,9h
                LEA DX,inv2
                INT 21h ; EMITE inv2        
                MOV AH,1h
                INT 21h       	
                SUB AL,30h
                MOV BH,AL
                INT 21h ; CAPTURA UNIDAD DE N
                SUB AL,30h
                MOV AH,BH
                AAD ; AL = N (DIM)
                MOV N,AL
                MOV CL,0 ;CONTADOR
                LEA BX,texto
                MOV CH,[BX+1] ; texto +1 , # DE CHAR
                MOV AL,[BX+2] ; LEE UN CHAR
                CMP AL,'A'
                JC  otro  ; CHAR NO ES LETRA 
                CMP AL,'Z'
                JNC otro ; NO ES LETRA
es_letra:       INC CL
otro:           INC BX
                DEC CH
                JNZ leer_char     ; LEER CHAR
                MOV AL,CL
                XOR AH,AH
                AAM ; AH = DECENA  AL = UNIDAD
                ADD AX,3030h ;AX = # DE LETRAS (ASCII)
                MOV BX,AX
                MOV AH,2h
                MOV DL,BH
                INT 21h ; EMITE DECENA
                MOV DL,BL 
                INT 21h ;EMITE UNIDAD
                LEA BX,texto
                MOV AL,N ; AX = N
                XOR AH,AH
                ADD BX,AX
leer_char:      MOV AL,[BX+2] ; AL = EL CHAR N
                MOV DL,AL
                MOV AH,2h
                INT 21h
Palabra:        MOV AL,[BX+2]
                CMP AL,' '
                JE  exit
                DEC BX
                JNP Palabra
exit:           MOV AH,2h
                MOV DL,[BX+3]
                INT 21h
                INC BX
                MOV DL,[BX+3]
                CMP DL,'$'
                JNE exit                                 
                MOV AH,4ch ;DEFECTO
                INT 21h    ;DEFECTO
                
END
