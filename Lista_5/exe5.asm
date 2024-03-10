.data
	string: 	.space 8
	count_a: 	.word 0
	newline:     	.asciiz "\n"
.text
main:
	li 	$v0 8
    	la 	$a0 string
    	li 	$a1, 8          # Ler até 8 caracteres
    	syscall
    	
    	la 	$t0 string
    	li 	$t1 0
    	li 	$t4 0
    	li 	$t3 97
    	
    	loop:
    		beq	$t4 8 endloop
    		lb	$t2 0($t0)
    		beq	$t2 $t3 is_a
    		j	continue
    		
    	
    	is_a:
    		addi 	$t1 $t1 1
    		j	continue
    	
    	continue:
    		addi    $t4 $t4 1
    		addi	$t0 $t0 1
    		j 	loop
    	
    	endloop:
    		 # Armazenar o resultado na memória de dados
       		la 	$s0, count_a          # Carregar o endereço de count_a
        	sw 	$t1, 0($s0)           # Armazenar o valor de $t0 em count_a
		
		li $v0, 4
   		la $a0, newline
    		syscall
		
		li 	$v0 1
    		lw 	$a0 0($s0)
    		syscall
