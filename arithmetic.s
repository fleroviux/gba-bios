swi_DivArm:
    @ parameters r0 and r1 swapped for div (r3 is output anyway)
    mov r3, r1
    mov r1, r0
    mov r0, r3

swi_Div:
    @ idea: basic division strategy: keep subtracting 2 ** n * Denom (r1) from Number (r0) until we can't anymore
    @		add these values up in r3 to find the div, add r0 will result in the mod
    @	    store power of 2 in r2
    @		store signs in r4 (double negative is positive: eor)

    stmfd sp!, { r2, r4 }

    @ make operands positive
    movs r4, r1
    rsbmis r1, r1, #0		@ r1 was negative
	beq .div_done			@ prevent freezes on division by 0
    eors r4, r0		        @ r0 was negative
    rsbmi r0, r0, #0		@ bit 31 of r4 not contains sign(r1) ^ sign(r0)

	@ find maximum power of 2 (in r2) such that (r1 * r2) < r0
    mov r2, #1
    .div_max_pow_of_2_loop:
        cmp r1, r0, lsl #1
        lslle r2, #1
		lslle r1, #1
		ble .div_max_pow_of_2_loop
		
	mov r3, #0
	
	.div_loop:
		cmp r1, r0
		suble r0, r1
		addle r3, r2
		lsr r1, #1
		lsrs r2, #1
		
		@ keep going until r2 was 1
		bne .div_loop
		
	@ at this point, r0 contains Number % Denom (unsigned)
	@			     r3 contains Number / Denom (unsigned)
	
	eor r1, r0, r4, asr #32		@ Number % Denom (signed)
	eor r0, r3, r4, asr #32		@ Number / Denom (signed)

	.div_done:
		ldmfd sp!, { r2, r4 } 
		bx lr


swi_Sqrt:
	@ idea: binary search with a power of 2 as initial guess
	
	stmfd sp!, { r1, r2, r3 }
	
	@ find power of 2 as initial guess
	mov r1, #1
	mov r2, r0					@ copy r0 because we need it later
	.sqrt_initial_guess_loop:
		cmp r2, r1, lsl #2
		lslge r1, #1
		lsrge r2, #1
		bge .sqrt_initial_guess_loop
	@ at this point: r1 ** 2 <= r0	
	
	mov r2, r1, lsr #1
	
	.sqrt_binary_search_loop:
		add r3, r1, r2
		mul r3, r3, r3
		cmp r3, r0
		addle r1, r2
		
		@ break off early if we have already found the square (eq)
		lsrnes r2, #1
		bne .sqrt_binary_search_loop
		
	mov r0, r1
	
	ldmfd sp!, { r1, r2, r3 }
	bx lr
