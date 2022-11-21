#include "platform.h"
#include "xil_printf.h"

#include <stdio.h>
#include <stdbool.h>

#define MAX_CIPHER_LENGTH 64

bool read_string(char *buf, unsigned int len);
void substitute(char *dest, const char *src, const char *key, unsigned int key_len);

int main(void)
{
	init_platform();

	for (;;) {

		char input[MAX_CIPHER_LENGTH], output[MAX_CIPHER_LENGTH];

		if (!read_string(input, MAX_CIPHER_LENGTH)) return 1;

		// Could be specified from stdin at startup
		char key[] = "jeanjacquesrousse";

		// The money function performing the substitution (encoding/decoding)
		substitute(output, input, key, sizeof(key) - 1);

		printf("%s\n", output);
	}

	cleanup_platform();
	return 0;
}

// Napoleon substitution (cipher) from `src` to `dest` using `key`
/**
 * `src` MUST be NULL terminated and `dest` MUST be as long or longer than
 * `src`. The function ONLY substitutes lower case ASCII characters, all other
 * characters are simply copied to `dest` as is.
 */
void substitute(char *dest, const char *src, const char *key, unsigned int key_len) {

	// We need a separate counter for key index to not "spend" a key character
	// when skipping over non-lowercase ASCII characters.
	unsigned int i = 0, key_i = 0;

	while (src[i] != '\0') {

		if ('a' <= src[i] && src[i] <= 'z') {
			// Get shortest distance between key and character. NB! Must be signed
			signed char diff = key[key_i % key_len] - src[i];

			// If negative distance, start from last (wrapped) character,
			// else start from front.
			dest[i] = diff <= 0 ? 'z' + diff : 'a' + diff - 1;

			key_i++;
		} else {
			// Simply copy non-valid characters.
			dest[i] = src[i];
		}
		i++;
	}

	dest[i] = '\0';
}

// Read a string into `buf` from stdin
/**
 * Returns true on success and false on error.
 */
bool read_string(char *buf, unsigned int len) {

	// We need i outside of the loop to set terminating nullbyte.
	unsigned int i = 0;

	for (;;) {

		buf[i] = getchar();
		if (ferror(stdin)) {
			perror("Error when reading string from stdin");
			return false;
		}

		// If EOF on first call to getchar, exit already cause already empty string.
		if (feof(stdin) && i == 0) return false;

		// If backspace, ignore the previous character (if not first character)
		if (buf[i] == 0x7f) {
			if (i > 0) i--;
			continue;
		}

		// If EOF or newline we are done fetching input (simplifies piping).
		if (feof(stdin) || buf[i] == '\n' || buf[i] == '\r') break;

		// Use a separate if statement here, instead of as a loop condition, to
		// print a meaningful error message and flush stdin.
		if (i >= len - 1) {
			printf("Max input size reached (%d), ignoring rest of line..\n", MAX_CIPHER_LENGTH - 1);
			while (getchar() != '\n' && !feof(stdin) && !ferror(stdin)) {}
			break;
		}

		i++;
	}

	// Ensure string is terminated with nullbyte.
	//
	// i is either:
	//   1. len - 1
	//   2. where EOF happened
	//   3. where newline happened
	buf[i] = '\0';

	return true;
}
