# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
	addi $a0, $a0, -5
	li $t4, 4
	mult $a0, $t4
	mflo $v0
	jr $ra

routineA:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	move $t0, $a0
	li $t2, 2
	mult $t0, $t2
	mflo $s1

	li $t3, 3
	mult $a1, $t3
	mflo $a0
	jal routineB

	add $s1, $s1, $v0
	move $a0, $s1
	addi $a0, -1
	jal routineB

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	

main:
	li $a0, 5
	li $a1, 7
	jal routineA
	move $s0, $v0
	li $v0, 1
	move $a0, $s0
	syscall

exit:
	li $v0, 10
	syscall

	
