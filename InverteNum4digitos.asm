#inverte um numero de 4 digitos
.text
main:
	li $t0, 5678		# numero
	li $t1, 1000
	li $t2, 4			# i --
	la $t7, 0($sp)
	
	while_um:
		beq $t2, $zero, continua
		sub $t2, $t2, 1		# i --
		div $t3, $t0, $t1
		
		sw $t3, ($t7)
		sub $t7, $t7, 4
		
		mul $t3, $t3, $t1
		sub $t0, $t0, $t3
		div $t1, $t1, 10
		j while_um
		
	continua:
		li $t1, 1000
		li $t0, 0
		
		while_dois:
			beq $t7, $sp, exit
			add $t7, $t7, 4
			
			lw $t6, ($t7)
			mul $t3, $t6, $t1
			add $t0, $t0, $t3
			div $t1, $t1, 10
			
			j while_dois
	
exit:
	
