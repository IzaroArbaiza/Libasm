#include <stdio.h>
#include <string.h>

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dst, const char *src);
int ft_strcmp(const char *s1, const char *s2);

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

	

	return (0);
}