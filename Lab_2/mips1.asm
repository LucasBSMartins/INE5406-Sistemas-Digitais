.data
	A:  .word 1, 2, 3
     	    .word 0, 1, 4
            .word 0, 0, 1
	
	B:  .word 1, -2, 5
	    .word 0, 1, -4
 	    .word 0, 0, 1
 	    
 	BT: .word 0, 0, 0
            .word 0, 0, 0
            .word 0, 0, 0

.text
	la $s0, A
	la $s1, B
	la $s2, BT	