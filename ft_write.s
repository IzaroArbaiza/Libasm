section .text

global ft_write
extern __errno_location

ft_write:
    mov rax, 1      ;inicialize rax with syscall num of write(1)
    syscall         ;run write(fd=rdi, buf=rsi, count=rdx)
    cmp rax, 0
    js .neg
    ret

.neg:
    neg rax
    mov rdx, rax            ;copy rax in another register(rdx)
    call __errno_location   ;rax contains pointer to the error obtained from __errno_location
    mov [rax], rdx          ;write the num of error in the pointer to error
    mov rax, -1
    ret                     ;returns -1 = error
