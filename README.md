# Libasm

## 🧩 Overview

The **libasm** project is part of the 42 curriculum and aims to introduce students to **Assembly language programming** by rewriting standard C functions.

This project focuses on understanding how **low-level code** interacts with the system, registers, memory, and the kernel through **syscalls**.


## 🧱 Project Goals

- Learn the basics of **x86-64 Assembly** syntax and conventions.  
- Understand the different **memory sections** (`.text`, `.data`, `.bss`).  
- Manipulate **registers** and **function arguments** at a low level.  
- Use **syscalls** for I/O operations and program termination.  
- Recreate simple **libc** functions in pure Assembly.


## ⚙️ Implemented Functions

The project typically requires implementing the following functions in Assembly:

| Function | Description |
|-----------|-------------|
| `ft_strlen` | Returns the length of a string |
| `ft_strcpy` | Copies a string from source to destination |
| `ft_strcmp` | Compares two strings |
| `ft_write`  | Performs the `write` syscall |
| `ft_read`   | Performs the `read` syscall |
| `ft_strdup` | Allocates and duplicates a string |


## 🧩 Assembly Basics Learned

Through this project, I’m learning how to:
- Work with **registers** (`rax`, `rdi`, `rsi`, `rdx`, etc.) and understand their purpose (return values, arguments, etc.).
- Use **comparison** (`cmp`) and **conditional jumps** (`je`, `jne`, `jl`, `jg`, etc.).
- Manage **signs**, **carry**, and **overflow flags** for branching logic.
- Use **syscalls** (`write`, `read`, `exit`) directly to communicate with the kernel.
- Understand how **data is represented** at different sizes (byte, word, dword, qword).


## 🧠 Example Concept

A minimal Assembly example to print “Hello, world!”:

```asm
section .data
    msg db "Hello, world!", 0

section .text
    global _start

_start:
    mov rax, 1          ;syscall: write
    mov rdi, 1          ;fd: stdout
    mov rsi, msg        ;buffer to write
    mov rdx, 13         ;length of string
    syscall

    mov rax, 60         ;syscall: exit
    xor rdi, rdi        ;exit code 0
    syscall
