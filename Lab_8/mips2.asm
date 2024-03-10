.data	
	prompt:     .asciiz "Digite o número de medida da matriz: "
	prompt1:    .asciiz "Digite o tamanho do bloco: "
	N:	    .word 0
	block_size: .word 0
.text
j main

criar_matriz:
	li 	$t0 0
	loop_criar_matriz:
		beq 	$t0 $a1 exit_criar_matriz	# Salta para o final quando acaba de atribuir todos os valores
		sw 	$t0 0($a0)	
		addi 	$a0 $a0 4			# Passa para o próximo elemento na matriz
		addi 	$t0 $t0 1	
		j 	loop_criar_matriz
	exit_criar_matriz:
		jr 	$ra

main:	
		
	li $v0 4       		# syscall para imprimir string
        la $a0 prompt  		# carregar o endereço da string
        syscall
	
	li $v0 5       		# syscall para ler inteiro
        syscall
        move	$s3 $v0
        sw	$s3 N
        mul  	$s3 $s3 $s3 
        mul	$s2 $s3 4
        
        li $v0 4       		# syscall para imprimir string
        la $a0 prompt1 		# carregar o endereço da string
        syscall
	
	li $v0 5       		# syscall para ler inteiro
        syscall
        move	$s5 $v0
        sw	$s5 block_size
	
	
	li 	$v0 9      	# syscall para alocar memoria
        move 	$a0 $s2
        syscall
     	move 	$s0 $v0 	# armazenar o endereço da matriz A em $s0
     	
     	move	$a0 $s0		# armazenar o endereço da matriz A em $a0
     	move 	$a1 $s3		# armazenar o valor em $a1
     	
     	jal     criar_matriz

     	li	$v0 9      	# syscall para alocar memoria
        move 	$a0 $s2
        syscall
     	move 	$s1 $v0		# armazenar o endereço da matriz B em $s1
     	
     	move	$a0 $s1		# armazenar o endereço da matriz B em $a0
     	move 	$a1 $s3		# armazenar o valor em $a1
     	
     	jal     criar_matriz

     	# Ambas as matrizes tem valores de 0 a N*N valor
     	# Matriz A esta em $s0
     	# Matriz B esta em $s1
     	
     	lw 	$t2 N
     	mul 	$s6 $t2 4
     	lw	$t3 block_size
     	li	$t4 0          			# I = 0
     	
	i_loop:
   		bge 	$t4 $t2 exit  	# If i >= N, sai do programa
   		li 	$t5 0  			# J = 0
   		
   		j_loop:
   			bge 	$t5 $t2 exit_j 	# If J >= N, proximo loop i
   			move 	$t6 $t4         # ii = I
   			
   			ii_loop:
   				add	$t0 $t4 $t3
   				bge 	$t6 $t0 exit_ii # If ii >= i + block_size, proximo loop j
   				move	$t7 $t5 	# jj = J
   				
   				jj_loop:
   					add	$t1 $t5 $t3
   					bge 	$t7 $t1 jj_exit	
   					
   					move 	$s4 $s0	# A
   					move	$s5 $s1	# B
   					
   					# Endereco de A
   					mul	$t0 $s6 $t6  	# i_1 = ii * (N * 4)
   					mul	$t1 $t7 4	# j_1 = jj * 4			
   					add	$t0 $t0 $t1	# $t0 = i_1 + j_1
   					add	$s4 $s4 $t0	
   					
   					# Endereco de B
   					mul	$t0 $s6 $t7  	# j_1 = jj * (N * 4)
   					mul	$t1 $t6 4	# i_1 = ii * 4			
   					add	$t0 $t0 $t1	# $t0 = j_1 + i_1
   					add	$s5 $s5 $t0	
   					
   					lw	$t0 0($s4)
   					lw 	$t1 0($s5)
   					
   					add	$t0 $t0 $t1
   					sw	$t0 ($s4)
   					
   					addi 	$t7 $t7 1
    					j 	jj_loop
   				jj_exit:
   					addi 	$t6 $t6 1
					j 	ii_loop
   			exit_ii:
   				add 	$t5 $t5 $t3
    				j 	j_loop
   		exit_j:
   			add 	$t4 $t4 $t3
   			j 	i_loop
   	exit:
   		
   		li $v0 10
   		syscall