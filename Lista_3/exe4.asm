.data
	array: .word 0x10010020
	
.text

	la	$s0, array
	
	move 	$t0 $zero
	move	$t1 $zero
	


loop:
	beq	$t0 6 exit
	addi	$t0 $t0 1
	lw	$t4 ($s0)
	addi	$t1 $t4 4
	sw	$t1 ($s0)
	j 	loop
	
exit: