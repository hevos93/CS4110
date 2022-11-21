
// cipher subroutine

#include <stdio.h>
#include <stdlib.h>

extern  void cipher(char* v1, char* v2, long int sir, char* v3, long int skr);

int main(void) {
   long int a = 19;			// size of input string
   char is[] = "beautiful kongsberg";	// input string
   char os[] = "xxxxxxx";	// output string
   long int b = 19;			// size of key string
   char ks[] = "jeanjacquesrousseau";	// key string

   cipher(is,os,a,ks,b);
   for (int i = 0; i < a; i++)
		printf("%c", os[i]);

	return EXIT_SUCCESS;
}
