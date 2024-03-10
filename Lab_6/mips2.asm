.data
	textfatorial: .asciiz "Insira um fatorial: "
	numero: .word 0

.text
	j main
	fat:
		addi $sp $sp -8

		sw $ra 0($sp)
		sw $a0 4($sp)

		move $t0 $a0

		beq $t0 1 returnlast

		subi $t1 $t0 1
		move $a0 $t1
		jal fat

	lw $t0 4($sp)
	mul $v0 $v0 $t0

	lw $ra 0($sp)
	addi $sp $sp 8

	jr $ra

returnlast:

	lw $ra 0($sp)
	li $v0 1
	addi $sp $sp 8

	jr $ra

main:
	li $v0 4
	la $a0 textfatorial
	syscall

	li $v0 5
	syscall
	sw $v0 numero
	lw $a0 numero

	jal fat

	sw $v0 numero

	li $v0 1
	lw $a0 numero
	syscall
