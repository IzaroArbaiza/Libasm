section .text

global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
	push rdi			;save original rdi in stack
	call ft_strlen		;rax = ft_strlen(rdi)
	inc rax				;rax +1 for the '\0'
	mov rdi, rax
	call malloc			;malloc(rdi)
	cmp rax, 0			;|| test rax, rax
	je .end
	mov rdi, rax
	pop rsi				;take original rdi from stack
	call ft_strcpy		;ft_strcpy(rdi, rsi)
	ret

.end:
	pop rsi
	mov rax, 0
	ret



;char *ft_strdup(const char *s)
;{
;	size_t len = ft_strlen(s) + 1; // with '\0'
;	char *copy = malloc(len);
;	if (!copy)
;		return (NULL);
;	ft_strcpy(copy, s);
;	return (copy);
;}
