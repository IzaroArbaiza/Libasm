section .text

global ft_strcmp

ft_strcmp:
	mov rax, 0

.loop:
	mov bl, [rdi + rax]		;bl = s1[i]
	mov bh, [rsi + rax]		;bh = s2[i]
	cmp bl, 0				;s1[i] != '\0'	||	s1[i] == '\0' => sale del bucle
	je .return
	cmp bh, 0				;s2[i] != '\0'	||	s2[i] == '\0'
	je .return
	cmp bl, bh				;s1[i] != s2[i]
	jne .return
	inc rax					;i++
	jmp .loop

.return
	movzx eax, bl			;int eax = bl
	movzx ebx, bh
	sub eax, ebx			;eax -= ebx
	ret						;return eax



;int ft_strcmp(const char *s1, const char *s2) {
;    int i = 0;
;    while (s1[i] != '\0' && s2[i] != '\0') {
;        if (s1[i] != s2[i]) {
;            return s1[i] - s2[i];
;        }
;        i++;
;    }
;    return s1[i] - s2[i];
;}

