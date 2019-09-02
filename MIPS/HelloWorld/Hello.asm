# Registers used:
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter-- the string to print.
	.text
main:
	la	$a0, hello_msg  #carrega o endereço de hello em a0
	li	$v0, 4		# 4 is the print_string call
	syscall
	
	li	$v0, 10
	syscall
	
	.data
hello_msg: .asciiz "Hello World\n"