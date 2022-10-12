#Laboratory Excercise 3, Assignment 4
li $s1, 3
li $s2, 5
li $t1, 7
li $t2, 9
li $t3, 11
start:
	slt $t0, $s2, $s1	#j<i, return 1 if $s2 < $s1, 0 if $s2 >= $s1
	bne $t0, $zero, else	#branch to else if j<i
	addi $t1, $t1, 1	#then part: x=x+1
	addi $t3, $zero, 1	#z=1
	j endif			#skip "else" part
else:	addi $t2, $t2, -1	#begin else part: y=y-1
	add $t3, $t3, $t3	#z=2*z
endif:

#Answer for 4a: Change slt $t0, $s2, $s1 to slt $t0,$s1,$s2
#Answer for 4b:	Add addi $s1,$s1,1 before the slt command
#Answer for 4c: Add addi $t4, $s1,$s2 before slt command and change slt command to slt $t0, $t4, $zero
#Answer for 4d: Declare 2 more variable m and n in text segment, assign them a value, take their 	
#	addition and store into a register $t4, then store the addition of x and y to register
#		$t5, and finally $st5, $t4	
