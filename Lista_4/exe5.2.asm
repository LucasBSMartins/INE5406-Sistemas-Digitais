.data 
	n: .word 0
	resultado: .word 0
	prompt_n: .asciiz "Digite o valor: "
.text
j	main

fatorial:
	move	$t0 $a0
	li	$t1 1
	loop:
		beq	$t0 0 exitfatorial
		mul	$t1 $t1 $t0
		subi	$t0 $t0 1
		j 	loop
	
	exitfatorial:
		move	$v0 $t1
		jr	$ra	



main:
	li 	$v0 4
   	la 	$a0 prompt_n
  	syscall
  	li 	$v0 5
   	syscall
   	sw 	$v0 n
   	
   	lw	$a0 n
  	jal	fatorial
  	
  	move	$s0 $v0
  	
  	li 	$v0 1
    	move	$a0 $s0
    	syscall
   	
   