section .text

;I want to export the function so C could call it. If not, it won't find it in main.c
global ft_strlen

;From here the function starts, declaring the name of the function first
ft_strlen:
	mov rax, 0					;Initialize variable rax a 0 | mov	<register>, <value>			En C => i = 0

.loop:
	cmp byte [rdi + rax], 0		;compare the first character(byte) of rdi with rax
	je .end						;stop loop if it finished
	inc rax						;increment rax =>	rax++	|	add rax, 1	sum +1 to rax	=>	rax += 1
    jmp .loop					;repeat .loop

.end:
	ret							;return


;size_t	strlen(char *s) {
;	int i = 0;
;	while(s) {
;		i++
;	}
;	return (i);
;}