NAME = libasm.a

SRC = 	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJS = ${SRC:.s=.o}

NASM = nasm
NASMFLAGS = -f elf64
MAIN  = main.c

CC = gcc
CFLAGS = -Wall -Wextra -Werror 

all: ${NAME}

${NAME}: ${OBJS}
	ar rcs ${NAME} ${OBJS}

%.o: %.s
	${NASM} ${NASMFLAGS} $< -o $@

test: all
	$(CC) $(CFLAGS) $(MAIN) -o test -L. -lasm -no-pie

clean:
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}
	rm -f test

re: fclean all

.PHONY: all clean fclean re test 
