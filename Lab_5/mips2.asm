.data
	matriz: .word 0:256

.text
	
	# Load adress da matriz e inicia 
	# os contadores necessarios
	la 	$s0 matriz
	li 	$t0 0
	li 	$t2 -4
	fim_coluna:
		addi 	$t2 $t2 4		# Como começa em -4 posso realizar o loop facilmente
		li 	$t1 0			# sem necessidade de utilizar saltos
		la 	$s0 matriz		# Reinicia o valor do endereço da matriz
		add 	$s0 $s0 $t2		# Soma o numero da coluna ao endereço original da matriz

	loop:
		beq 	$t0 256 exit		# Salta para o final quando acaba de atribuir todos os valores
		beq 	$t1 16 fim_coluna	# Quando atinge o numero maximo de linhas por coluna e passa pra proxima
		sw 	$t0 0($s0)	
		addi 	$s0 $s0 64		# Pula para a próxima linha
		addi 	$t1 $t1 1		
		addi 	$t0 $t0 1
		j 	loop

exit: