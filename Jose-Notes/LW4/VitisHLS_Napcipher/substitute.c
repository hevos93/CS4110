#include "substitute.h"

void substitute( const char input, char* output ) {

#pragma HLS INTERFACE mode=s_axilite port=substitute
#pragma HLS INTERFACE mode=s_axilite port=input
#pragma HLS INTERFACE mode=s_axilite port=output

	// We need a separate counter for key index to not "spend" a key character
	// when skipping over non-lowercase ASCII characters.
	static unsigned int key_i = 0;

	char key[] = "jeanjacquesrousse";

	if ('A' <= input && input <= 'z') {
		// Get shortest distance between key and character. NB! Must be signed
		signed char diff = key[key_i] - input;

		// If negative distance, start from last (wrapped) character,
		// else start from front.
		*output = diff <= 0 ? 'z' + diff : 'a' + diff - 1;

		key_i++;
		if(key[key_i] == '\0')
		{
			key_i = 0;
		}
	} else {
		// Simply copy non-valid characters.
		*output = input;
	}
	if(input == '\r' || input == '\n')
	{
		key_i = 0;
	}
}
