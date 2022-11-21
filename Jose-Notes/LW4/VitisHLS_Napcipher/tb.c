#include "substitute.h"
#include <stdio.h>


int main()
{
	char in[] = "aaaaaaaaa\naaaaaaaa\raaa";
	char out;
	printf("\nOutput: ");
	for(int i = 0; i < sizeof(in); i++)
	{
		substitute(in[i], &out);
		printf("%c", (char)out);
	}
	printf("\n");
}
