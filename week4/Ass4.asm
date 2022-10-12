.text
	li	$s1, 4000000000
	li 	$s2, 4000000000
start:
	li 	$t0, 0 	
	addu 	$s3, $s1, $s2 	 
	xor 	$t1, $s1, $s2 	
	bltz 	$t1, EXIT 	
	xor 	$t2, $s3, $s1
	bgtz 	$s1, EXIT 	
Overflow:
	li 	$t0, 1 		
EXIT:
