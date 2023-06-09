#converte caractere de minusculo para maiusculo
main:
	li $v0, 12
	syscall		#Lê o caractere
  		
  	add $a0, $zero, $v0	# guardo no registrador
  	addi $t1, $zero, 32
  	
	sub $a0, $v0, $t1		# Subtraio 32 de acordo com a tabela ASCII  
	
	
	li $v0, 11    
  	syscall            # Escrevo o caractere
  	
  	j exit
  	
 exit:
 
