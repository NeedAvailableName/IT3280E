.data  
first: .space 100
second: .space 100

.text
.globl main 
main: 

li       $v0, 8 
la       $a0, first
la   $a1, 20 
syscall

move     $s1, $a0

la       $a0, second
la   $a1, 20 
syscall

li   $v0, 4
la       $a0, second
syscall
     
move     $a0, $s1

la       $a0, 0($s1)
syscall
li $v0, 10
syscall