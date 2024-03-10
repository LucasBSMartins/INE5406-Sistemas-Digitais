.data 
	contador: .word 0
.text
	
	la $s0 contador
	lw $t0, 0($s0)
	
loop:
	bgt 	$t2 5 exit
	add     $t0 $t0 $t2 # Contador
	addi	$t2 $t2 1
	j 	loop

exit:
	sw $t0 0($s0)