#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h> 

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dst, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

int main(void)
{
	const char *test_strlen[] = {
		"",
		"Hello world!",
		"1234567890",
		"This is a very long test string to see if the function works correctly",
		NULL
	};
	for (int i = 0; test_strlen[i] != NULL; i++)
	{
		printf("Test strlen %d:\n", i + 1);
		printf("String: \"%s\"\n", test_strlen[i]);
		printf("Resultado strlen: %zu\n", strlen(test_strlen[i]));
		printf("Resultado ft_strlen: %zu\n\n", ft_strlen(test_strlen[i]));
	}

	printf("========================================\n\n");

	char buffer[100];
	for (int i = 0; test_strlen[i] != NULL; i++) {
		printf("Test strcpy %d:\n", i + 1);
		printf("Source: \"%s\"\n", test_strlen[i]);
		strcpy(buffer, test_strlen[i]);
		printf("strcpy:    \"%s\"\n", buffer);
		ft_strcpy(buffer, test_strlen[i]);
		printf("ft_strcpy: \"%s\"\n\n", buffer);
	}

	printf("========================================\n\n");

	const char *test_strcmp[][2] = {
		{"", ""},
		{"Hello", "Hello"},
		{"Hello", "World"},
		{"equal", "equal"},
		{"different", "Different"},
		{NULL, NULL}
	};
	for (int i = 0; test_strcmp[i][0] != NULL; i++) {
		printf("Test strcmp %d:\n", i + 1);
		printf("String 1: \"%s\"\n", test_strcmp[i][0]);
		printf("String 2: \"%s\"\n", test_strcmp[i][1]);
		printf("strcmp:    %d\n", strcmp(test_strcmp[i][0], test_strcmp[i][1]));
		printf("ft_strcmp: %d\n\n", ft_strcmp(test_strcmp[i][0], test_strcmp[i][1]));
	}

	printf("========================================\n\n");

    const char *msg = "Hola desde ft_write!\n";
    ssize_t ret = ft_write(1, msg, ft_strlen(msg));
    printf("ft_write returned: %zd\n\n", ret);
	const char *invalid_msg = "Esto fallará\n";
	ssize_t err = ft_write(-1, invalid_msg, ft_strlen(invalid_msg));
	printf("ft_write invalid returned: %zd, errno: %d\n\n", err, errno);

	printf("========================================\n\n");

	char buf[50];
	int fd = open("test_file.txt", O_RDONLY);
	if (fd >= 0) {
		ssize_t n = ft_read(fd, buf, 20);
		buf[n] = '\0';
		printf("ft_read read %zd bytes: \"%s\"\n", n, buf);
		close(fd);
	}
	ssize_t err_read = ft_read(-1, buf, 20);
	printf("\nft_read invalid returned: %zd, errno: %d\n\n", err_read, errno);

	printf("========================================\n\n");

	return (0);
}