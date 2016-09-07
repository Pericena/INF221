.MODEL small
.STACK 100h

.DATA
		inv1   DB      10,13,'Ingrese su fecha de nacimiento en formato dd/mm/aaaa',10,13,'$'
		fecha  DB      11,?,11 DUP(?)
        Mes    DB      ?
        Meses  DB      'Enero Febrero Mazo Abril Mayo Junio Julio Agosto Septiempbre Octubre Noviembre Diciembre',10,13,'$'
        AA     DB      0
        añoAct DW      2009   
		añoNac DB      ?
		sal1   DB      10,13,'Usted Nacio en ','$';Mes
        sal2   DB      ' y tiene ','$' ;AA
        sal3   DB      ' anos',10,13,'$' 
        diez   DB      10
.CODE
Inicio:
	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	;;;;;;;;;;;
        MOV AH, 09h  ;INVITA A QUE 
        LEA DX, inv1 ;  INGRESE SU  
        INT 21h      ;  FECHA DE NACIMIENTO
	;;;;;;;;;;;
	MOV AH, 0Ah  ;CAPTURA 
	LEA DX, fecha  ;  LA
	INT 21h      ;  FECHA
	;;;;;;;;;;;
    LEA BX, fecha
    MOV AH, [BX+5]
    MOV AL, [BX+6]
    SUB AX, 3030h
    MOV CX, AX
	;;;;;;;;;;;
	LEA SI, Meses
    LODSW  
	;;;;;;;;;;;
	;;;;;;;;;;;                         
    MOV AH, 09h
    LEA DX, sal1
    INT 21h   
        ;;;;;;;;;;;
        ;MOSTRAR MES
        ;MOV AL, CH
        ;AAM
        ;ADD AL, 30h
        ;MOV AH, 02h
        ;MOV DL, AL
        ;INT 21h   
        ;MOV AL, CL
        ;AAM
        ;ADD AL, 30h
        ;MOV AH, 02h
        ;MOV DL, AL
        ;INT 21h    
        ;;;;;;;;;;;
    MOV AH, 09h          
    LEA DX, sal2
    INT 21h
        ;;;;;;;;;;;;
        ;MOSTRAR EDAD
        ;MOV AH, 02h
        ;MOV DL, 
        ;INT 21h
        ;;;;;;;;;;;;        
    MOV AH, 09h
    LEA DX, sal3
    INT 21h                     	
	;;;;;;;;;;;	
	MOV AH, 01h
	INT 21h
	;;;;;;;;;;;
	MOV AH,4ch
	INT 21h
END Inicio
