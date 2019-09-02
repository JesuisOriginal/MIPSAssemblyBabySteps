# regsiters
#	$t0, hold the first num
#	$t1 holds the sec num
#	$t2 holds the sum of t0 and t1
#	$v0 syscall param and return
#	$a0 syscall param
main:
	# read the first num
	li	$v0, 5		# loads the read_int into $v0
	syscall  		# syscall the $v0
	move	$t0, $v0	# move the num into t0
	
	# get the second num
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	add	$t2, $t1, $t0
	
	# printing
	move	$a0, $t2	# move the num to print into a0
	li	$v0, 1		# load the syscall print_int into v0
	syscall			# make the syscall
	
	li	$v0, 10 	# exit
	syscall
	
	