## Daniel J. Ellard -- 02/21/94
## palindrome.asm -- reads a line of text and tests if it is a palindrome.
## Register usage:
## $t1 - A.
## $t2 - B.
## $t3  the character at address A.
## $t4 - the character at address B.
## v0 - syscall parameter / return values.
## a0 - syscall param
## a1 - syscall param

	.text
main:
	la	$a0, string_space
	li	$a1, 1024
	li	$v0, 8
	syscall
	
	la	$t1, string_space
	la 	$t2, string_space
	
length_loop:
	lb 	$t3, ($t2)
	beqz	$t3, end_length_loop
	addu	$t2, $t2, 1
	b	length_loop
	
end_length_loop:
	subu	$t2, $t2, 2
	
test_loop:
	bge	$t1, $t2, is_palin
	
	lb	$t3, ($t1)
	lb	$t4, ($t2)
	bne	$t3, $t4, not_palin
	
	addu	$t1, $t2, 1
	subu	$t2, $t2, 1
	b	test_loop
is_palin:
	la	$a0, is
	li	$v0, 4
	syscall
	
	li	$v0, 10
	syscall	
not_palin:
	la	$a0, not_is
	li	$v0, 4
	syscall
	
	li	$v0, 10
	syscall
	.data
string_space:	.space 1024
is:	.asciiz "Is palindrome"
not_is:	.asciiz "Aint a palindrome"
