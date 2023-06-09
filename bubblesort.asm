#bubblesort em assembly
.data
	vetor: 59, 46, 32, 81, 46, 55, 87, 43, 70, 80
.text
bubbleSort:

	la $t7, vetor	
	addi $t0, $zero, 10	# j = tamanho
	
	j for_um
	
	for_um:
		sub $t0, $t0, 1	# j --
	
		addi $t1, $zero, -1	# i = -1
		bne $t0, $zero, for_dois	# j >= 1 // j != 0 faça
		j exit
		
		for_dois:
			addi $t1, $t1, 1
			
			slt $a0, $t1, $t0 			# i < j ? 1 : 0
			beq $a0, $zero, for_um
			
			j verifica
			
			j for_um
		
verifica:
	mul $t4, $t1, 4				# indice da posicao no vetor na memoria
	add $t6, $t7, $t4				#adiciono em $t6 o enfereço desse valor do vetor
	lw $t3, 0($t6)				# $t3 = vetor[i]
	lw $t4, 4($t6)				# $t4 = vettor[i + 1]
	
	slt $a1, $t4, $t3				# vetor[i] > vetor[i +1] ? 1: 0			
	bne $a1, $zero, do_um

	j for_dois
	
do_um:
	addi $t2, $t3, 0			# aux = vetor[i]
	addi $t3, $t4, 0			# vetor[i] = vetor[i + 1]
	addi $t4, $t2, 0			# vetor[i + 1] = aux
	
	sw $t3, 0($t6)
	sw $t4, 4($t6)
	
	j for_dois
	
exit:
