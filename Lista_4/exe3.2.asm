.data
	base: .word 0
	power: .word 0
	result: .word 0
	prompt_base: .asciiz "Digite o valor da base: "
	prompt_power: .asciiz "Digite o valor do expoente: "
.text
j main
pow:
	move 	$t0 $a0		#base
	move	$t1 $a1 	#power
	li	$t2 0 		# i = 0
	li	$t3 1 		# result = 1

	loop:
		beq	$t2 $t1 exitloop
		mul	$t3 $t3 $t0
		addi	$t2 $t2 1
		j 	loop
	exitloop:
	
	move	$v0 $t3
	
	jr	$ra
	

main:
	li 	$v0 4
    	la 	$a0 prompt_base
   	syscall
   	li 	$v0 5
    	syscall
    	sw 	$v0 base

    	li 	$v0 4
    	la 	$a0 prompt_power
    	syscall
    	li 	$v0 5
    	syscall
    	sw 	$v0 power
    	
    	lw 	$s0 base
	lw 	$s1 power
	
	lw	$a0 base
	lw	$a1 power
	
	jal	pow
	
	sw	$v0 result
	
	li 	$v0 1
    	lw	$a0 result
    	syscall
