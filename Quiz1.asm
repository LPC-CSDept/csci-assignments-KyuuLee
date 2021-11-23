			.text
			.globl main

main:

			lui   $t0, 0xffff 
rd_wait:  	lw    $t1,  0($t0)      # load from the input control register 
			andi  $t1, $t1, 0x0001  # reset (clear) all bits except LSB 
			beq   $t1, $zero,  rd_wait # if not yet ready, then loop back 
			lw    $v0,  4( $t0)     # input device is ready, so read 

			lui    $t0, 0xffff 
wr_wait:  	lw     $t1,  8($t0)     # load the output control register 
			andi   $t1, $t1, 0x0001 # reset all bits except LSB 
			beq    $t1, $zero, wr_wait # if not ready, then loop back 
			sw     $v0,  12( $t0 )  # output device is ready, so write
