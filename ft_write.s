section .text

global ft_write
extern __errno_location

ft_write:
    mov rax, 1      ;inicializa rax con num de syscall de write
    syscall         ;ejecuta write(fd=rdi, buf=rsi, count=rdx)
    cmp rax, 0
    js .neg
    ret

.neg:
    neg rax
    mov rdx, rax            ;copiar rax en otro registro (rdx)
    call __errno_location   ;rax contiene puntero al error obtenido de __errno_location
    mov [rax], rdx          ;escribir el numero de error en el puntero al error
    mov rax, -1
    ret                     ;devuelve -1 = error
