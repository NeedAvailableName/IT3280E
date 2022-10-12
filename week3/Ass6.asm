#Laboratory 3, Assigment 6
.data
	N: .word 5		#Assign n = 5
	A: .word 0,1,2,3,4
.text
	la	$t2, N
	la	$s2, A
	lw	$s3, 0($t2)
	addi	$s1, $zero, -1
	addi	$s4, $zero, 1
	addi	$s6, $s6, 0		#s6 store largest absolute value of A
	addi	$s7, $s7, 0		#s7 store value of largest
	addi	$t4, $t4, 0		#t4 store absolute value of A[i]
loop:	add	$s1, $s1, $s4		#i=i+step
	add	$t1, $s1, $s1		#t1=2*s1
	add	$t1, $t1, $t1		#t1=4*s1
	add	$t1, $t1, $s2		#t1 store the address of A[i]
	lw	$t0, 0($t1)		#load value of A[i] in $t0
	start:
		abs	$t4, $t0
		slt	$t5, $s6, $t4		# s6 < abs(A[i])	
		beq	$t5, $zero, endif	# branch to endif s6 >= abs(A[i])
		add	$s6, $zero, $t4		# then part: s6 = abs(a[i])
		add	$s7, $zero, $t0		# then part: s7 = a[i]
		j	endif			# skip “else” part
	endif:
	blt	$s1, $s3, loop		#if i < n, go to loop
	
