.text
.global FIR
.type FIR, "function"

// X0 = input array address (first element)
// x1 = output array address (first element)
// x2 = array size (number of elements)

FIR:	sub	  sp,sp,#16
		stur  lr,[sp,#0]	// save LR to be used later with ret
		mov   x8,#0			// initialize index to InpArray
		mov   x4,#0			// Initialize the two stages...
		mov   x5,#0			// ...in the filter structure
LOOP:	stur  x0,[sp,#8]	// save address to InpArray element
		stur  x8,[sp,#16]	// save index to Inp and Out arrays
		ldur  x0,[x0,#0]	// get element of InpArray
		bl    FIRSUB		// process it in FIR filter
		stur  x0,[x1,#0]	// save FIR filter output in OutArray
		ldur  x0,[sp,#8]	// recover address to InpArray element
		ldur  x8,[sp,#16]	// recover index to Inp and Out arrays
		add   x0,x0,#8		// update pointer to InpArray
		add   x1,x1,#8		// update pointer to OutArray
		add   x8,x8,#1		// increment index to Inp and Out arrays
		cmp   x8,x2			// all elements processed?
		bne	  LOOP			// continue otherwise
		ldur  lr,[sp,#0]	// recover LR value
		add   sp,sp,#16		// recover original value of SP
		ret

FIRSUB:
		mov	  x3,#3			// divisor to be used in each filter tap
		udiv  x6,x0,x3		// ..
		udiv  x7,x4,x3		// tap outputs
		udiv  x8,x5,x3		// ..
		add   x9,x7,x8		// first adder generates intermediate value
		add   x9,x6,x9		// second adder generates output value
		mov   x5,x4			// move value stored in 1st stage to 2nd stage
		mov   x4,x0			// move value at input to 1st stage
		mov   x0,x9			// load output value into X0
		br	  lr			// return filter output for OutArray
