.eqv 	HEADING 0xffff8010
.eqv	MOVING 0xffff8050 
.eqv 	LEAVETRACK 0xffff8020 
.eqv 	WHEREX 0xffff8030 
.eqv 	WHEREY 0xffff8040
.text
main: 	

goDown: jal 	TRACK 
	nop
	addi 	$a0, $zero, 90
	jal 	ROTATE
	nop
	jal 	GO
	nop
sleep1: addi 	$v0,$zero,32 
	li	$a0,1000
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK
	nop
	
goUp: addi 	$a0, $zero, 135
	jal 	ROTATE
	nop
sleep2: addi 	$v0,$zero,32
	li 	$a0,500
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK
	nop

goASKEW:
	addi 	$a0, $zero, 180
	jal ROTATE
	nop
sleep4: addi 	$v0,$zero,32
	li 	$a0,800
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK
	nop
	
goASKEW2: addi 	$a0, $zero, -135
	jal 	ROTATE
	nop
sleep3: addi 	$v0,$zero,32 
	li 	$a0,500
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK 
	nop
	
goDOWN2: addi 	$a0, $zero, -90
	jal 	ROTATE
	nop
sleep5: addi 	$v0,$zero,32
	li 	$a0,1000
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK
	nop

	
	addi 	$a0, $zero, 0
	jal 	ROTATE
	nop
 addi 	$v0,$zero,32
	li 	$a0,2300
	syscall
	jal 	UNTRACK 
	nop
	jal 	TRACK
	nop
end_main:
	j 	STOP
GO: 	li 	$at, MOVING 
	addi 	$k0, $zero,1
	sb 	$k0, 0($at) 
	nop
	jr 	$ra
	nop

TRACK: 	li 	$at, LEAVETRACK
	addi 	$k0, $zero,1
	sb 	$k0, 0($at) 
	nop
	jr 	$ra
	nop

UNTRACK:
	li 	$at, LEAVETRACK 
	sb 	$zero, 0($at) 
	nop
	jr 	$ra
	nop

ROTATE: li 	$at, HEADING
	sw 	$a0, 0($at) 
	nop
	jr 	$ra
	nop

STOP: 	li 	$at, MOVING 
	sb 	$zero, 0($at) 
	nop
	jr 	$ra
	nop
