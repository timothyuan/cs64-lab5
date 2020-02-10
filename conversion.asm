# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
	li $t0, 0
	li $t1, 0
	li $t2, 5
	li $t3, 2

loop:
	mult $a0, $t3
	mflo $t4
	add $t0, $t0, $t4
	sub $t0, $t0, $a1
	blt $t3, $a0, func
	addi $a0, $a0, 1
	addi $t1, $t1, 1
	beq $t1, $t2, return
	j loop

func:
	addi $a1, $a1, -1
	addi $a0, $a0, 1
	addi $t1, $t1, 1
	beq $t1, $t2, return
	j loop


return:
	move $v0, $t0
	jr $ra	
	
main:
	li $a0, 5
	li $a1, 7
	jal conv
	move $a0, $v0
	li $v0, 1
	syscall

exit:
	li $v0, 10
	syscall
