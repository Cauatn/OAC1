#fatorial de um número n
main:
	li $v0, 5
	syscall
	
	add $t0, $zero, $v0		# total
	
	add $t1, $zero, $t0		# aux = total
	
	enquanto:
		sub $t1, $t1, 1		# aux = aux - 1
		beq $t1, 1, print
		
		mul $t0, $t0, $t1		# total = total * aux
		j enquanto
		
	print:
		li $v0, 1
		add $a0, $t0, $zero
		syscall
		j exit
		
exit:
