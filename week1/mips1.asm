.data		#Vung du lieu, chua cac khai bao bien
x:	.word 0x0102304 	#bien x, khoi tao cac gia tri
message: .acsiiz "Bo mon Ky thuat may tinh"
.text 		#Vung lenh, chua cac lenh hop ngu
	la $a0, message		#dua dia chi bien mesage vao thanh ghi a0
	li $v0, 4		#Gan thanh ghi $v0 = 4
	syscall			#Goi ham so v0, ham so 4, la ham print
	addi $t1, $zero, 2	#Thanh ghi $t1 = 2
	addi $t2, $zero, 3	#Thanh ghi $t2 = 3
	add $t0, $t1, $t2 	#Thanh ghi t- = $t1 + $t2