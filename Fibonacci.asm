#A série de Fibonacci é definida assim: os dois primeiros termos têm o valor 1 e cada termo seguinte é igual à soma
#dos dois anteriores.
									#1 1 2 3 5 8 13 21 ...
#Escreva um programa em linguagem de montagem, que calcule o valor do Kº termo.
.data
	pergunta: .asciiz "Digite o numero da serie de Fibonacci que deseja descobrir: "
	resposta: .asciiz "O numero da serie de Fibonacci eh: "
.text
main:
	li $t0,	1		# n = 1
	li $t1,	1		# proximo = 1	
	li $t2, 0		# int resutado = 0
	
	li $v0, 4
	la $a0, pergunta
	syscall
	
	li $v0, 5
	syscall
	
	add $t3, $zero, $v0		# cont = K
	
	while:
		sub $t3, $t3, 1		# cont --
		beq $t3, $zero, continua
		add $t2, $t0, $t1		# resultado = n + proximo
		
		add $t0, $zero, $t1	# n = proximo
		add $t1, $zero, $t2	# proximo = resultado
	
		j while
		
	continua:
		li $v0, 4
		la $a0, resposta
		syscall
		
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		
		j exit
exit:
	
