.data 
 	A: .word 10
 	B: .word 15
 	C: .word 20
 	D: .word 25 
 	E: .word 30
 	F: .word 35
 	G: .word 0,0,0,0
 	H: .word 0,0,0,0
 	
 .text
  	lw $s0 A
 	lw $s1 B
 	lw $s2 C
 	lw $s3 D
 	lw $s4 E
 	lw $s5 F
 	la $s6 G
 	la $s7 H
 	
 	# G[0] = (A – (B + C) + F)
 	add $t0 $s1 $s2 
 	sub $t0 $s0 $t0 
 	add $t0 $t0 $s5
 	
 	sw $t0 0($s6)
 	
 	# G[1] = E – (A – B) * (B – C)
 	
 	sub $t0 $s1 $s2
 	sub $t1 $s0 $s1
 	mul $t0 $t0 $t1
 	sub $t0 $s4 $t0
 	
 	sw $t0 4($s6)
	
	# G[2] = G[1] – C
	
	lw $t0 4($s6)
	sub $t0 $t0 $s2
	
	sw $t0 8($s6)
	
	# G[3] = G[2] + G[0]
	
	lw $t0 8($s6)
	lw $t1 0($s6)
	
	add $t0 $t0 $t1
	
	sw $t0 12($s6)
 	
 	# H[0] = B – C
 	
 	sub $t0 $s1 $s2
 	
 	sw $t0 0($s7) 
  
	# H[1] = A + C
	
	add $t0 $s0 $s2 
	
	sw $t0 4($s7) 
	
	# H[2] = B – C + G[3]
	
	lw $t1 12($s6)
	
	sub $t0 $s1 $s2
	add $t0 $t0 $t1
	
	sw $t0 8($s7)
	
	# H[3] = B – G[0] + D
	
	lw $t0 0($s7)
	
	sub $t0 $s1 $t0
	add $t0 $t0 $s3
	
	sw $t0 12($s7)
	