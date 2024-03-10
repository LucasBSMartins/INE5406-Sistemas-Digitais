.data
	A: .word 4
	B: .word 10
	val: .word 0
.text
	j 	main

CalculaAreaQuadrado:
	move	$t0 $a0
	move	$t1 $a1
	
	mul	$t0 $t0 $t1
	
	move	$v0 $t0
	jr	$ra

main:
	lw	$a0 A
	lw	$a1 B
	
	jal	CalculaAreaQuadrado
	
	sw	$v0 val

	li 	$v0 1
	lw	$a0 val
	syscall