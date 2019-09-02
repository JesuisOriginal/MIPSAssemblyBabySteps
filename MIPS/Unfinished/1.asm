# program to check if the string is a palndrome
# t1 is the String
# t2 is the inverted string
# t3 char de t0
# t4 char de t1
# v0 valor do retorno
# a0 syscall
# test
	.text
main:
	la	$t1, my_string
	la	$t2, my_string
	
	jal	strin_len
	
	jal	check_string
	
	bnez	$v0, is_not
	b	is_pal

check_string:
	li	$v0, 1
	bge	$t1, $t2, to_main

	
	lb	$t3, ($t1)
	lb	$t4, ($t2)
		
	seq    	$t5, $t3, $t4
	bne	$t3, $t4, to_main
	bnez	$t5, is_pal
	
	addu	$t3, $t3, 1
	subu	$t4, $t4, 1
	
	j	check_string
	

strin_len:	# poe t3 como ultimo char de t2
	lb	$t3, ($t2)
	beqz	$t3, end_l
	addu	$t2, $t2, 1
	b	strin_len
	
end_l:
	subu	$t2, $t2, 2
	jr	$ra
	
to_main:
	jr 	$ra
	
is_pal:
	la	$a0, palin
	li	$v0, 4
	syscall
	
	li	$v0, 10
	syscall

is_not:
	la	$a0, not_palin
	li	$v0,	4
	syscall
	
	li	$v0, 10
	syscall



	.data
my_string:	.asciiz "subinoonibus\n"
my_string2:	.asciiz "not a palindrome\n"
palin:		.asciiz "Is palindrome\n"
not_palin:	.asciiz "Is not a palindrome\n"
