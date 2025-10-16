section .text

;esta función quiero exportarla para que C la pueda llamar. Si no, no lo encuentra en main.c
global ft_strlen

;A partir de aquí inicia la funcion, declarando el nombre de la funcion primero
ft_strlen:
	mov rax, 0		;Inicializar variable rax a 0 | mov	<registro>, <valor>			En C => i = 0

.loop:
	cmp byte [rdi + rax], 0		;compara el primer carácter(byte) de rdi con rax
	je .end						;finaliza el bucle si ha terminado
	inc rax						;incrementa rax =>	rax++	|	add rax, 1	suma +1 a rax	=>	rax += 1
    jmp .loop					;repite el bucle .loop

;Aquí finaliza la funcion devolviendo rax
.end:
	ret				;Esto es un return
