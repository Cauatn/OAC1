#Leia um numero n e escreva os primeiros n números tetraedricos
main:
	li $v0, 5
	syscall
	
	add $t0, $zero, $v0	# Guarda o valor de how_many
	
	li $t1, 1	# n = 1
	addi $t0, $t0, 1
	
	j while_um
	
	while_um:
		beq $t1, $t0, exit
		j do_um
		
		do_um:
			li $t2, 0			# total = 0
			li $t3, 1			# j = 1
			
			while_dois:
				slt $a0,$t3, $t1		# j < n ? 1 : 0
				bne $a0, $zero, do_dois
		
				beq $t3, $t1, do_dois		# j == n ? 1 :0 
				
				li $v0, 1
				add $a0, $t2, $zero
				syscall
				
				addi $t1, $t1, 1			# n = n + 1
				j while_um
				
				do_dois:
					li $t4, 1			# i = 1
					
					while_tres:
						slt $a0,$t4, $t3 		# i < j ? 1 : 0
						bne $a0, $zero, do_tres
						
						beq $t4, $t3, do_tres		# i == j ? 1 : 0
						
						addi $t3, $t3, 1		# j = j + 1
						j while_dois
						
						do_tres:
							add $t2, $t2, $t4		# total = total + 1
							addi $t4, $t4, 1		# i = i + 1
							j while_tres
exit:
