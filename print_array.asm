# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	string: .asciiz "The contents of the array are:\n"
	newline: .asciiz "\n"
	arr: .word 1 2 3 4 5 6 7 8 9 10

.text
printA:
	li $t0, 0
	move $t1, $a0
	move $t2, $a1	
	li $t5, 4	

loop:
	beq $t0, $t2, return
	mult $t0, $t5
	mflo $t3
	add $t3, $t3, $t1
	lw $t4, 0($t3)

	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall

	addi $t0, $t0, 1
	j loop

return:
	jr $ra

main:
	li $v0, 4
	la $a0, string
	syscall
	la $a0, arr
	li $a1, 10
	jal printA

exit:
	li $v0, 10
	syscall
