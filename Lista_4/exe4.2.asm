.data
	n1: .word 0
	n2: .word 0
	prompt_n1: .asciiz "Digite o valor do n1: "
	prompt_n2: .asciiz "Digite o valor do n2: "

.text
j main

leitura:
	li 	$v0 4
    	la 	$a0 prompt_n1
   	syscall
   	li 	$v0 5
    	syscall
    	move 	$t0 $v0
    	
    	li 	$v0 4
    	la 	$a0 prompt_n2
   	syscall
   	li 	$v0 5
    	syscall
    	move 	$t1 $v0
    	
    	move	$v0 $t0
    	move	$v1 $t1
    	
    	jr 	$ra
    
 soma: 	
  	sw	$ra 0($sp)
    	jal	leitura
	
	sw	$v0 n1
	sw	$v1 n2
	
	lw	$t0 n1
	lw	$t1 n2
	
	add	$v0 $t0 $t1
	
	lw	$ra 0($sp)
	jr	$ra
main:
	jal 	soma
	
	move	$s0 $v0
	
	li 	$v0 1
    	move	$a0 $s0
    	syscall

