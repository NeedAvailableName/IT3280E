#11
.data
Message1: .asciiz "Nhap ho va ten:"
Message2: .asciiz "Ho va ten sau khi doi:"
string: .space 100
str_vr: .space 100
.text
main:
get_string: 
	li 	$v0, 54
    	la 	$a0, Message1
	la	$a1, string #store the input name
	li 	$a2, 50
	syscall
get_length: 	
	la 	$a0, string
	xor 	$v0, $zero, $zero 
	xor 	$t0, $zero, $zero
check_char: 	
	add 	$t1, $a0, $t0 
	lb 	$t2, 0($t1)
	beq 	$t2,$zero,end_of_str 
	addi 	$v0, $v0, 1 
	addi 	$t0, $t0, 1 
	j 	check_char
end_of_str:
end_of_get_length:
print_length:
	sub	$v0,$v0,1
	move	$s2,$v0
	li 	$v0, 56
    	la 	$a0, Message2
    	add 	$a1,$s2,$0 #store length in $a1
	syscall
split_string:
strrv:
	add 	$s0,$zero,$0
L1:
	add 	$t1,$0,$a1
	add	$t1,$t1,$s2
	lb  	$t2,0($t1) 
	add 	$t3,$s0,$a0 
	sb 	$t2,0($t3) 
	beq 	$s2,$zero,end_of_strrv
	nop
	addi 	$s0,$s0,1 
	subi	$s2,$s2,1
	j 	L1 	
end_of_strrv:
	li 	$v0, 59 
        la 	$a0, Message2
        syscall 
	li 	$v0, 59
    	la 	$a0, str_rv
    	syscall                
    
	
	

