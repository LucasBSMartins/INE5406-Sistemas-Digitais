.data
	array: .word 0x10010020

.text
	
	lw  $s0 array
	
	# v=[1,3,2,1,4,5]
	
	li $t0 1
	sw $t0 0($s0)
	
	li $t0 3
	sw $t0 4($s0)
	
	li $t0 2
	sw $t0 8($s0)
	
	li $t0 1
	sw $t0 12($s0)
	
	li $t0 4
	sw $t0 16($s0)
	
	li $t0 5
	sw $t0 20($s0)