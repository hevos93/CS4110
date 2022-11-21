// Selection sort

.text
.global S_SEL
.type S_SEL, "function"

// x0: address of first element in the input array
// x1: size of V1 (number of elements)
// X2: address for scanning all "right elements" (address B)
// X3: current minimum (smallest element found while scanning)
// X4: address for scanning all "left elements" (address A)
// X5: index to address in X0 (X0 = address A to the "left elements")
// X6: offset to address in X2 (X2 = address B to the "right elements")
// X7: index used to hold the position of a new minimum found when scanning
// X8: temporary (free usage)
// X9: temporary (free usage)

S_SEL:
		mov   x5,#0			// (eor x5,x5,x5) initialize index to A ("left elements")
		mov   x2,x0			// (add x2,x0,#0) address B initially equal to address A
LABEL1:
		add   x4,x0,x5		// update address to "left elements"
		ldur  x3,[x4,#0]	// take the "left element" as the initial minimum
		mov   x7,x5			// position of the new minimum = position of "left element"
		mov   x6,#8			// initialize offset to B ("right elements")
LABEL2:
		add   x2,x4,x6		// update address to "right element"
		ldur  x8,[x2,#0]	// get right element to...
		cmp   x8,x3			// (subs xzr,x8,x3) ...compare with the current left element
		b.ge  LABEL3		// branch if there is no need to update index of new minimum
		add	  x7,x5,x6		// save the index of the new minimum in X7
		mov   x3,x8			// update value of current minimum
LABEL3:
		add	  x6,x6,#8		// update offset to address B ("right elements")
		add   x9,x5,x6		// add index to "left element" to offset to "right element"
		lsl	  x8,x1,#3		// 8 x size of V1 (to check for the address of last element)
		cmp   x9,x8			// did we reach the last "right element"?
		b.ne  LABEL2		// continue to next "right element" otherwise
		cmp	  x7,x5			// check if no new minimum was found (X7 still equal to X5)
		b.eq  LABEL4		// skip swapping if no minimum was found
SWAP:
		ldur  x8,[x4,#0]	// get current "left element"
		sub   x7,x7,x5		// get offset to new minimum
		add   x4,x4,x7		// point to position of new minimum
		ldur  x9,[x4,#0]	// get new minimum
		stur  x8,[x4,#0]	// store "left element" where the new minimum was found
		sub   x4,x4,x7		// point to position of "left element" that was considered
		stur  x9,[x4,#0]	// swapping of "left element" and new minimum concluded
LABEL4:
		add   x5,x5,#8		// increment index to address A ("left elements")
		lsl	  x8,x1,#3		// 8 x size of V1 (to check for the address of last element)
		sub   x8,x8,#8		// skip the last element since it has no "right elements"
		cmp   x5,x8			// did we reach the end?
		b.ne  LABEL1		// continue if not
		ret					// (br x30) job done
