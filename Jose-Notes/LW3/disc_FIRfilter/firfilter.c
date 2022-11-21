#include <stdio.h>
#include <stdlib.h>

extern  long int FIR(long int* v1, long int* v2, long int V3);

int main(void) {
   long int a = 10;
   long int InpArray[] = {13, 7, 20, 31, 199, 67, 55, 11, 5, 41};
   long int OutArray[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

	FIR(InpArray,OutArray,a);
	for (int i = 0; i < 10; i++)
		printf("%d, ", OutArray[i]);

	return EXIT_SUCCESS;
}
