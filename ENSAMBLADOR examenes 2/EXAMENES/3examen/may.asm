extern _printf,_scanf
segment .data
arreglo dd  -3505,822,31,5440,-803,-27,-11,09,23,-143,22,-1223,7127,-49,128,-55,-206,9983,10,-57,35,99,-100,99267,5313,967,-49
msj db "ingrese n: ",0,10
formato db "%d",0,10
msj2 db "el numero mayor del arreglo es: %d"
segment .bss
n resb 1
may resd 1
segment .text
global _main
_main:

push msj
call _printf
add esp,4

push n
push formato
call _scanf
add esp,8

xor eax,eax
mov eax,[n]
push eax
push arreglo
call mayor
mov [may],eax
add esp,8

push dword[may]
push msj2
call _printf
add esp,8
ret

mayor:
	push ebp
	mov ebp,esp
	mov ecx,[ebp+12]
	mov ebx,[ebp+8]
	mov eax,0
ciclo: cmp [ebx],eax
		jng  sigue
		mov eax,[ebx]
sigue:add ebx,4
dec ecx
jnz ciclo
pop ebp
ret 