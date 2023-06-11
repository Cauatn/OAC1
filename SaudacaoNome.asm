#vetor string em assembly
.data 
	pergunta: .asciiz "Qual é o seu nome ? "
	saudacao: .asciiz "Olá, "
	nome: .space 25
.text
main:

	#Faz a pergunta
	li $v0, 4
	la $a0, pergunta
	syscall
	
	#Lê o nome do usuario
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	#Escreve a saudacao
	li $v0, 4
	la $a0, saudacao
	syscall
	
	#escreve o nome
	li $v0, 4
	la $a0, nome
	syscall
	
exit:
