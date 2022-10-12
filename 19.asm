.data
	name: 	.space 20
	str1:  	.asciiz "Enter name= "
    	str2:  	.asciiz "variableName(name)= true"
    	str3:	.asciiz "variableName(name)= false"

.text

main:
    	la 	$a0, str1	 
    	li 	$v0, 4
    	syscall
    	li 	$v0, 8       
    	la 	$a0, name	#luu string vao $a0
    	li 	$a1, 20      	
   	move 	$t0, $a0  	#$t0 = $a0
   	syscall
    	addi 	$s0,$0,-1	#$s0 = -1
	addi	$s3,$s3,10    	#$s3 luu gia tri ascii cua ki tu cuoi cung cua string
Loop1:
	addi	$s0,$s0,1	#step = step + 1
	add 	$t1,$s0,$a0	#$t1 luu dia chi name[step]
	lb	$t2,0($t1)	#$t2 luu gia tri $t1 = name[step]
	beq	$t2,$s3,Name	#so sanh ki tu trong string voi ki tu cuoi
	beq	$s0,$0, checkFirst	#neu chua den cuoi thi kiem tra hop le
	j 	check
	
	
checkFirst:
	jal	isDigits
	bnez	$t0,notName	#kiem tra ki tu dau, neu co thi notName
	
check:	
	jal	isDigits
	bnez	$t0,Loop1
	jal 	isLetters
	bnez	$t0,Loop1
	jal 	isUnderscores
	bnez	$t0,Loop1
	j 	notName		#neu tat ca dk ko t/m -> notName
	
isDigits:
	li  	$s7,'0'
	sle   	$t0,$s7,$t2	#so sanh ki tu hien tai voi 0
	bnez	$t0,skip1
	jr	$ra
skip1:
	li 	$s7,'9'
	sle  	$t0,$t2,$s7 
	jr 	$ra
	
isLetters:
lowercase:
	li  	$s7,'a'
	sle  	$t0,$s7,$t2
	bnez	$t0,skip2
	j	uppercase
skip2:
	li 	$s7,'z'
	sle  	$t0,$t2,$s7 
	beqz	$t0, uppercase
	jr 	$ra
	
uppercase:
	li  	$s7,'A'
	sle  	$t0,$s7,$t2
	bnez	$t0,skip3
	jr	$ra
skip3:
	li 	$s7,'Z'
	sle   	$t0,$t2,$s7 
	jr 	$ra
		
isUnderscores:
	li  	$s7,'_'
	seq   	$t0,$s7,$t2
	jr	$ra

notName:
    	li $v0, 4
	la $a0, str3
	syscall

    	li 	$v0, 10     
    	syscall
Name:
    	li 	$v0, 4  
    	la 	$a0, str2     
    	syscall

    	li 	$v0, 10   
    	syscall  
    	
