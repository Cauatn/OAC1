#programa em assembly que o usuario digite a quantidade de elementos do vetor que ele quer inserir, leia os elementos e escreva na tela
main:
	li $v0, 5
	syscall
	
	add $t0, $v0, $zero		# tamanho do vetor
	
	li $t1, 0				# inicializa o contador
	
	la $t7, 0($sp)
	
	loop:
	
		beq $t1, $t0, loop2
		
		li $v0, 5
		syscall
		
		add $t2, $zero, $v0		# guardo o valor digitado
		
		sw $t2, 0($t7)
		
		sub $t7, $t7, 4
		
		addi $t1, $t1, 1			# contador ++
		j loop
		
		loop2:
			li $t1, 0			# contador = 0
			la $t7, 0($sp)
			
			do:
				beq $t1, $t0, exit
			
				lw $t6, 0($t7)
				addi $a0, $t6, 0
			
				li $v0, 1
				syscall
				
				sub $t7, $t7, 4
				addi $t1, $t1, 1
				j do

exit:

