.data
	A: .word 0
	B: .word 0
	C: .word 0
	
.text
	li	$v0 5
	syscall
	sw	$v0 A
	
	li	$v0 5
	syscall
	sw	$v0 B
	
	li	$v0 5
	syscall
	sw	$v0 C
	
	lw 	$s0 A
	lw 	$s1 B
	lw 	$s2 C
	
#	bgt	$s0 $s1 somaa
	
#	bge	$s0 $s1 somab
	
#	ble	$s0 $s1 somaa

#	beq	$s0 $s1 exit	

#	blt	$s0 $s1 somaa
#	j	somab

#loop:
#	bge	$s0 $s2 exit
#	addi	$s0 $s0 1
#	addi	$s1 $s1 2
#	j	loop
	
#	li 	$t0 0
#loopfor:
#	bge	$t0 5 exit
#	addi	$s0 $s1 1
#	addi	$s1 $s1 3
#	addi 	$t0 $t0 1
#	j	loopfor


#	beq	$s0 1 case1
#	beq	$s0 2 case2
#	j	default
	
#case1:
#	addi	$s1 $s2 1 
#	j	exit
#case2:
#	addi	$s1 $s2 2 
#	j	exit
#default:
#	add	$s1 $zero $s2
#	j 	exit	



	j	exit
somaa:
	addi 	$s0 $s0 1
	j 	exit
somab:
	addi	$s1 $s1 1
	j	exit


exit:
	sw 	$s0 A
	sw	$s1 B
	sw	$s2 C

	