# t1, string normal
# t2, \\     invertida
# t3, char de t1
# t4, char de t2

	.data
string_1:	.byte	'e','R','a','W','D','R','a','h', '\n', '0'
ended:		.asciiz "\nJustice Rains From Above!!!\n"

	.text
main:
	la	$t4, string_1
	li	$t2, 0
	li	$t3, 1
	jal	get_size
	
	
get_size:
	beq	$t3, 0, end_program
	beq	$t3, 30, end_program
	add	$t5, $t4, $t2

	
	# test print char
	
	lb	$a0, 0($t5)
	li	$v0, 11
	syscall
	
	addiu	$t2, $t2, 1
	addiu	$v1, $v1, 1
	bgt	$t2, 128, end_program
	
	j	get_size

end_loop:
	jr	$ra

end_program:
	# li	$v0, 4
	# la	$a0, ended
	# syscall
	
	li	$v0, 10
	syscall

to_upper:
	addiu	$t1, $t1,	32
to_lower:
	subiu	$t1, $t1,	32
