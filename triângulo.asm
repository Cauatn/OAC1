# imprime um triângulo de n tamanho
main:
	
	addi $t0, $t0, 0			# i = 0
	
	li $v0, 5
	syscall				# Lê um numero inteiro (tamanho)
	
	add $t1, $v0, 0			# guarda o valor da chamada de syscall

	addi $t1, $t1, 1
	
	j for_um
	
	for_um:
		addi $t0, $t0, 1		# i ++
		
		li $a0, 10			# codigo ASCII do caractere "\n"
		li $v0, 11
		syscall			# Escreve "\n"
		
		slt $a1, $t0, $t1		# i <= tamanho ? 1 : 0
		
		addi $t2, $zero, -1 	# j = 0
		
		beq $a1, $zero, exit
		
		j for_dois
		
		for_dois:
			addi $t2, $t2, 1		# j ++
			
			slt $a1, $t2, $t0		# j < i ? 1 : 0
			beq $a1, $zero, for_um
			
			j do
			
			do:
				li $a0, 42		# codigo ASCII do caractere "*"
				li $v0, 11		# coloca no registrador o valor de syscall para print de caractere
				syscall		# Escreve o caractere "*"
				
				j for_dois

exit:
