.data
	matriz: .word 0:256

.text
	
	# Load adress da matriz e inicia 
	# os contadores necessarios
	la 	$s0 matriz
	li 	$t0 0
	loop:
		beq 	$t0 256 exit	# Salta para o final quando acaba de atribuir todos os valores
		sw 	$t0 0($s0)	
		addi 	$s0 $s0 4	# Passa para o próximo elemento na matriz
		addi 	$t0 $t0 1	
		j 	loop
exit:
