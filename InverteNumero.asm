#Pograma que inverte um vetor de inteiros em assembly
.data 
	pergunta: .asciiz "Digite um numero:  "
	numero_inverso: .asciiz "O numero invertido é: "
.text
main:

	li $v0, 4
	la $a0, pergunta
	syscall			# Faz a pergunta
	
	li $v0, 5
	syscall			# Lê o numero
	
	add $t0, $zero, $v0		# salva o numero em $t0
	
	li $t7, 1				# i = 1
	li $t1, 1				# multiplicador = 1
	li $t2, 0				# cont
		
	# indentifica a  quantidade de algarismos do numero
	while_um:
		div $t3, $t0, $t1		# aux = numero / multiplicador
		slt $s0, $t3, $t7		# div < 1 ? 1 : 0
		bne $s0, $zero, continua
		
		mul $t1, $t1, 10		# multiplicador = multiplicador * 10
		addi $t2, $t2, 1		# cont ++
		j while_um
		
		continua:
			la $t7, 0($sp)		# carrego o endereço da pilha (PilhaEnd)
		
			while_dois:
				beq $t2, $zero, continua_dois	# if (cont == 0) break
 				div $t1, $t1, 10			# multiplicador = multiplicador / 10
				div $t4, $t0, $t1			# algarismo = numero / multiplicador 
				
				mul $t6, $t1, $t4			# aux2 = multiplicador * algarismo	
				sub $t0, $t0, $t6			# numero = numero - aux2
			
				sw $t4, ($t7)			# Escrevo na pilha esse algarismo
				
				sub $t7, $t7, 4			# pilha = pilha + 4 (Empilho)
				sub $t2, $t2, 1			# cont --
				j while_dois
				
		continua_dois:
			li $v0, 4
			la $a0, numero_inverso
			syscall				# Escreve string "numero_inverso"
			
			while_tres:
				beq $t7, $sp, exit	# if(PilhaEnd == Pilha) break
				add $t7, $t7, 4		# PilhaEnd ++
				lw $t5, ($t7)		
				add $a0, $zero, $t5
			
				li $v0, 1
				syscall			# Escreve o numero atual da pilha
				
				j while_tres
				
exit:
