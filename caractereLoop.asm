#Crie um programa que leia uma letra em minúscula, e retornará a mesma letra, só que
#maiúscula. O mesmo deverá estar em um Loop infinito. a saída do loop se deve ao digitar a
#letra 'z'.
main:
	
	loop:
		li $v0, 12
		syscall
		
		add $t0, $zero,$v0
		sub $a0, $t0, 32
		
		beq $t0, 122, exit
		
		li $v0, 11
		syscall
		
		li $a0, 10 
		li $v0, 11
		syscall
		
		j loop		
		
exit:

