#fatorial recursivo
.data
	mensagem: .asciiz "\n Digite o valor à ser calculado: "
	fatorial: .asciiz "\n O fatorial dele é: "
.text
main:
	
	li $v0, 4
	la $a0, mensagem
	syscall				# Escreve a mensagem
	
	li $v0, 5
	syscall
	
	move $a0, $v0		# Guardo o valor de N
	jal CalculaFatorial
	move $t7, $v0
	
	li $v0, 4
	la $a0, fatorial
	syscall
	
	move $a0, $t7
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

CalculaFatorial:
	sub $sp, $sp, 8			# Reservo espaço na Pilha para dois numeros
	sw $ra, 4($sp)			# Guardo o valor do contexto atual
	sw $a0, 0($sp)			# Guardo o valor N na pilha
	
	slti $t0,$a0, 1			# n < 1 ? 1 : 0
	beq $t0, $zero, do_um
	
	li $v0, 1
	add $sp, $sp, 8
	jr $ra
	
do_um:
	sub $a0, $a0, 1
	jal CalculaFatorial
	
	lw $a0, 0($sp)		
	lw $ra, 4($sp)
	add $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra
