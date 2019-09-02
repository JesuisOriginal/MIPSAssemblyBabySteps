# multiples.asm-- takes two numbers A and B, and prints out
# all the multiples of A from A to A * B.
# If B <= 0, then no multiples are printed.
# Registers used:
# $t0 - used to hold A.
# $t1 - used to hold B.
# $t2 - used to store S, the sentinel value A * B.
# $t3 - used to store m, the current multiple of A.

	.text
main:
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	li	$v0, 5
	syscall
	move	$t1, $v0

	blez	$t1, terminate
	
	mul	$t2, $t0, $t1
	move	$t3, $t0

loop:
	li	$v0, 1
	move	$a0, $t3
	syscall
	
	beq	$t2, $t3, terminate
	add	$t3, $t3, $t0
	
	la	$a0, space
	li	$v0, 4
	syscall
	
	b loop
	
terminate:
	li	$v0, 10
	syscall
	
	.data
space:	.asciiz "\n"