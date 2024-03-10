.data	
	prompt:     .asciiz "Digite o número de medida da matriz: "
	N:	    .word 0
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

     	
     	lw	$t3 N
     	mul 	$t4 $t3 4	# N*4
     	li	$t1 0		# int I = 0
     	loop:
     		beq 	$t1 $t3 exit			# If I == N break
     		li 	$t2 0				# int J = 0
     		loop2:
     			beq 	$t2 $t3 exit_loop2	# If J == N break
			
			move	$t6 $s1			# Endereco inicial de B
			mul	$s3 $t2 $t4		# J_1 = J * (N*4)
			mul	$t7 $t1 4		# I_1 = I * 4
			add	$t0 $s3 $t7		# J_1 + I_1 
			add 	$t6 $t6 $t0 		
			
     			lw	$t5 0($s0)		# Valor de A[i][j]
			lw	$t0 0($t6)		# Valor de B[j][i]
     			
     			add	$t0 $t5 $t0		# $t0 = A[i][j] + B[j][i]
     			sw	$t0 0($s0)		# Salva o valor em A[i][j]

     			addi	$s0 $s0 4		# Proximo endereco de A
     			addi	$t2 $t2 1		# J += 1
     			j	loop2
     		exit_loop2:
     			addi  	$t1 $t1 1		# I += 1
     			j 	loop 	
     	exit:	
     		li	$v0 10
     		syscall
     			
     	
     	
     	
     		
     	
     	
     			
