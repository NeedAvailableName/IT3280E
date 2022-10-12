.data
Message1: 	.asciiz "Nhap ten: ”
Message2: 	.asciiz "\nTen:"
string1: 	.space 50
string2:	.space 50
stringre:	.space 50
stringre2:	.space 50

.text
main:
getString: 
	addi	$s4,$s4,10	#$s4 danh dau sang dong moi
	li 	$v0, 54
    	la 	$a0, Message1
	la	$a1, string1
	li 	$a2, 50
	syscall
	
	li 	$v0, 54
    	la 	$a0, Message1
	la	$a1, string2
	li 	$a2, 50
	syscall
	
   	la 	$a0, string1
	la	$a1, stringre
	j 	getLength


second:   	
	addi	$v1,$v1,1
   	la 	$a0, string2
	la	$a1, stringre2
   	
   	
getLength: 	


	xor 	$t0, $zero, $zero
	
checkChar: 	
	add 	$t1, $a0, $t0		#$t1 luu tung phan tu cua string $a0
	lb 	$t2, 0($t1)		#luu gia tri $t1 vao $t2
	beq 	$t2,$s4,endOfstr 	#kiem tra dong moi, neu dung thi end string
	jal	checkSpace		#goi ham checkspace
	addi 	$t0, $t0, 1 		#i = i + 1
	j 	checkChar

checkSpace:
	li  	$s7,' '		#gan $s7 = space
	beq   	$s7,$t2,mark	#so sanh ki tu hien tai trong string voi space, neu bang thi mark 
	jr	$ra		#tra lai checkchar
	
mark:
	move 	$s6,$t0		#$s6 = $t0 = i (vi tri dau cach cuoi cung)
	jr	$ra		#tra lai checkspace

endOfstr:
strcpy:
	add 	$s0,$zero,$s6	#$s0 = $s6 = i (vi tri dau cach cuoi cung)
	add	$s1,$0,$0	#$s1 = 0
	
L1:	#copy cac phan tu sau dau cach cuoi cung vao dau string 1
	add 	$t1,$s0,$a0	#$t1 = dia chi string[i] (dau cach cuoi cung)

	lb  	$t2,0($t1) 	#$t2 = string[i]
	add 	$t3,$s1,$a1	#$t3 = dia chi string reverse
	 
	beq 	$t2,$s4,endOfstrcpy1	#neu gap dong moi -> endOfstrcpy
	sb 	$t2,0($t3)	#luu $t2 vao $t3
	nop
	addi 	$s0,$s0,1 	#i = i + 1 (string)
	addi 	$s1,$s1,1	#i = i + 1 (string reverse)
	j 	L1 
	nop	
	
endOfstrcpy1:
	sb	$s7,0($t3)	#luu gia tri $t3 vao $s7
	add 	$s0,$0,$0	#$s0 = 0
	addi 	$s1,$s1,1	#i = i + 1
	
L2:	#copy cac phan tu sau dau cach cuoi cung vao dau string 2 va in ra
	add 	$t1,$s0,$a0	

	lb  	$t2,0($t1) 
	add 	$t3,$s1,$a1

	beq 	$s0,$s6,print	
	    	
	sb 	$t2,0($t3) 
	nop
	addi 	$s0,$s0,1 
	addi 	$s1,$s1,1
	j 	L2
	nop	
	
print:
	
	beq	$v1,$0,second	#nhay sang string thu hai
	
	li 	$v0, 59
    	la 	$a0, Message2
    	la 	$a1, stringre
	syscall
	
	li 	$v0, 59
    	la 	$a0, Message2
    	la 	$a1, stringre2
	syscall
	
    	li 	$v0, 10   
    	syscall  
	
	
	
    	
