.data
	name: 	.space 20
	str1:  	.asciiz "Enter name = "
    	str2:  	.asciiz "variableName(name) = true"
    	str3:	.asciiz "variableName(name) = false"

.text

main:
	li 	$v0, 54
    	la 	$a0, str1
	la	$a1, name
	li 	$a2, 50
	syscall
	la	$a0, name 	
   	move 	$t0, $a0  
    	addi 	$s0,$0,-1	#$s0 = i = -1 
	addi	$s3,$s3,10    	#danh dau sang dong moi
Loop1:
	addi	$s0,$s0,1	#$s0 = 0
	add 	$t1,$s0,$a0	#$t1 = dia chi string
	lb	$t2,0($t1)	#$t2 = string[i]
	beq	$t2,$s3,Name	#neu gap dong moi thi Name
	beqz 	$s0, checkFirst	
	j 	check
	

checkFirst:
	jal	isDigits
	bnez	$t0,notName
	
check:	#dung cac ham isDigit, isLetter, isUnderscore de check
	jal	isDigits
	bnez	$t0,Loop1
	jal 	isLetters
	bnez	$t0,Loop1
	jal 	isUnderscores
	bnez	$t0,Loop1
	j 	notName
	
isDigits:	#so sanh voi 0
	li  	$s7,'0'
	sle   	$t0,$s7,$t2
	bnez	$t0,skip1
	jr	$ra
skip1:		#so sanh voi 9
	li 	$s7,'9'
	sle  	$t0,$t2,$s7 
	jr 	$ra
	
isLetters:
lowercase:	#so sanh voi a va z
	li  	$s7,'a'
	sle  	$t0,$s7,$t2
	bnez	$t0,skip2
	j	uppercase
skip2:
	li 	$s7,'z'
	sle	$t0,$t2,$s7 
	beqz	$t0, uppercase
	jr 	$ra
	
uppercase:	#so sanh voi A va Z
	li  	$s7,'A'
	sle  	$t0,$s7,$t2
	bnez	$t0,skip3
	jr	$ra
skip3:
	li 	$s7,'Z'
	sle   	$t0,$t2,$s7 
	jr 	$ra
		
isUnderscores:	#check underscore
	li  	$s7,'_'
	seq   	$t0,$s7,$t2
	jr	$ra

notName:
	li 	$v0, 55
    	la 	$a0, str3
	syscall

    	li 	$v0, 10     
    	syscall
Name:
    	li 	$v0, 55
    	la 	$a0, str2     
    	syscall

    	li 	$v0, 10   
    	syscall  
    	
