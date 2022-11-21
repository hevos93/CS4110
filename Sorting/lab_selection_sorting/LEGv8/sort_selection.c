// Selection sort

#include <stdio.h>
#include <stdlib.h>

extern  void S_SEL(long int* V1, long int cc);

int main(void) {
	long int V1[] = {7, 3, 5, 6, 1, 3, 2, 9, 6, 2, 5, 7, 1};
	long int a = 13;

	S_SEL(V1,a);

	for (int i = 0; i < 13; i++)
		printf("%d, ", V1[i]);

	return EXIT_SUCCESS;
}
