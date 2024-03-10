.data
	textfatorial: .asciiz "Insira um fatorial: "
	numero: .word 0

.text
	li $v0 4
	la $a0 textfatorial
	syscall

	li $v0 5
	syscall
	sw $v0 numero


	li $s0 1
	lw $t0 numero

# Loop para calcular o fatorial
loop:
	beqz $t0 exit     # Se $t0 for zero, sair do loop
	mul $s0 $t0 $s0   # Multiplica $s0 pelo valor atual de $t0
	subi $t0 $t0 1    # Subtrai 1 de $t0 para calcular o próximo fatorial
	j loop            # Volta ao início do loop

exit:

	li $v0 1
	move $a0 $s0
	syscall
