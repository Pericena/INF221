.MODEL small
.STACK 100h

.DATA
uno     DB  10,13
dos     DB  12 DUP(20)
.CODE
inicio:	MOV AX,@DATA
	MOV DS,AX
        LEA BX,dos 
        MOV DX,BX
        MOV SI,400h
        MOV CX,0303h
tres:   MOV AL,[BX]
        SHL AL,1h
        ADD AL,CH
        MOV [SI],AL
        MOV[BX],AL
        INC BX
        INC SI
        INC CH
        DEC CL
        JNZ tres
        MOV AL,'$'
        MOV[BX+2],AL
        MOV AH,9h
        INT 21h
        MOV AH,4Ch
        INT 21h
END     inicio 
