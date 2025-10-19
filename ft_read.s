section .text

global ft_read
extern __errno_location

ft_read:
    mov rax, 0      ;inicialize rax with syscall num of read(0)
    syscall
    cmp rax, 0
    js .error
    ret

.error:
    neg rax
    mov rdx, rax
    call __errno_location
    mov [rax], rdx
    mov rax, -1
    ret
