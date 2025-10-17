section .text

global ft_strcpy

ft_strcpy:
	mov rax, 0					;rax = 0

.loop:							;do 
	mov bl, [rsi + rax]			;bl = src[i]	=>	dest[i] = src[i]
	mov [rdi + rax], bl			;dest[i] = bl	=>	dest[i] = src[i] && dest[i] == '\0' (finally)
	cmp bl, 0					;while (src[i] != '\0');
	je .end
	inc rax						;i++
	jmp .loop

.end:
	mov rax, rdi				;rax = dest
	ret							;return rax



;char *ft_strcpy(char *dest, const char *src) {
;    int i = 0;
;    while (src[i] != '\0') {
;        dest[i] = src[i];
;        i++;
;    }
;    dest[i] = '\0';
;    return dest;
;}
