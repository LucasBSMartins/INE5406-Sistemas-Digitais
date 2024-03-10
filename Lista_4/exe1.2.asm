.data 
	F: .word 0
	G: .word 0
	H: .word 0
	I: .word 0 
	J: .word 0 
	prompt_g: .asciiz "Digite o valor de g: "
	prompt_h: .asciiz "Digite o valor de h: "
	prompt_i: .asciiz "Digite o valor de i: "
	prompt_j: .asciiz "Digite o valor de j: "

.text
.globl main
main:
	li 	$v0 4
    	la 	$a0 prompt_g
   	syscall
   	li 	$v0 5
    	syscall
    	sw 	$v0 G

    	li 	$v0 4
    	la 	$a0 prompt_h
    	syscall
    	li 	$v0 5
    	syscall
    	sw 	$v0 H

    	li 	$v0 4
    	la	$a0 prompt_i
    	syscall
    	li 	$v0 5
    	syscall
    	sw 	$v0 I

    	li 	$v0 4
    	la	$a0 prompt_j
    	syscall
    	li 	$v0 5
    	syscall
    	sw 	$v0 J
	
	lw 	$s0 G
	lw 	$s1 H
	lw 	$s2 I
	lw 	$s3 J
	
	lw 	$a0 G
	lw 	$a1 H
	lw 	$a2 I
	lw 	$a3 J
	
	jal 	calcula
	
	sw	$v0 F
	
	j	exit
	
calcula:

	move 	$t0 $a0
	move 	$t1 $a1
	move 	$t2 $a2
	move 	$t3 $a3
	
	add 	$t4 $t0 $t1
	add	$t5 $t2 $t3
	sub	$t4 $t4 $t5
	
	move	$v0 $t4
	
	jr	$ra

exit:
	li 	$v0 1
	lw	$a0 F
	syscall
	
	
