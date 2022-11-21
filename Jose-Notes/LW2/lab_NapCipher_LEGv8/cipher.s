.text
.global cipher
.type cipher, "function"

// X0: pointer to input string
// X1: pointer to output string
// X2: size of input string
// X3: pointer to key string
// X4: size of key string
// X5: offset to read each key cahr

cipher:
		cbz		x2,exit		// go back if input string is empty
		sub		sp,sp,#16	// get space in stack
		stur	x3,[sp,#0]	// save address to first element of key
loop:
		ldurb	w6,[x0,#0]	// read char to encrypt/decrypt
		subs	wzr,w6,#32	// check for space char
		bne		xcrypt		// (en/de)crypt if different
		sturb	w6,[x1,#0]	// keep space as is in output string
		b		ahead
xcrypt:
		ldurb	w7,[x3,#0]	// read char from key
		subs 	w8,w7,w6	// KEY-ASCII
		bhi		higher
		add		w8,w8,#122	// "Z"+KEY-ASCII
		sturb	w8,[x1,#0] 	// store encrypted/decrypted char
		b		ahead
higher:
		add		w8,w8,#96	// 0x60+KEY-ASCII
		sturb	w8,[x1,#0] 	// store encrypted/decrypted char
ahead:
		add		x5,x5,#1	// increment offset to key
		cmp		x4,x5		// used all the key elements?
		bne		continue
		ldurb	w3,[sp,#0]	// if yes, restart address to key
		b		ahead1
continue:
		add		x3,x3,#1	// update address to key
ahead1:
		add		x0,x0,#1	// point to next input char position
		add		x1,x1,#1	// point to next output char position
		sub		x2,x2,#1	// decrement number of input chars to process
		cbnz	x2,loop		// processed all input chars?
exit:
		add		sp,sp,#16	// if yes, revert SP to its initial value
		ret					// return when all input chars were processed

