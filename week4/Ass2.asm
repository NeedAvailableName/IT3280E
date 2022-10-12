#Laboratory 4, Assignment 2
.text
	#li	$s0, 0x0563	#load test for these function
	#andi	$t0, $s0, 0xff	#Extract the LSB of $s0
	#andi 	$t1, $s0, 0x0400	#Extract bit 10 of $s0
	#part a)
	#li	$s0, 0x12345678
	#addi	$t0, $s0, 0xff000000
	#part b)
	#li    	$s0,0x12345678   	
	#andi   	$t0, $s0, 0xff  	
	#sub   	$s0, $s0, $t0
	#part c)
	#li    	$s0, 0x12345678   	
	#andi  	$t0, $s0, 0xff  	
	#sub  	$s0, $s0, $t0	
	#addi  	$s0, $s0, 0x11
	#part d)
	#li 	$s0, 0x12345678 
	#sll 	$s0, $s0, 31
 
	
 
