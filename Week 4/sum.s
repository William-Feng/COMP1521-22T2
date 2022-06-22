        .text
main:

main__prologue:
        addi    $sp, $sp, -8    # Move the stack pointer down
        sw      $s0, 4($sp)     # Store $s0 at a 4 byte offset
        sw      $ra, 0($sp)     # Store $ra at the location of the $sp

main__body:
        # Registers:
        # $s0 = x
        # $t1 = y
        # $t2 = sum
        
        li      $s0, 10         # int x = 10
        li      $t1, 5          # int y = 5
        
        # 1. Load the arguments into the $a registers
        # 2. Call 'jal' to execute the function
        # 3. Take the return value from $v0 (if required)
        
        move    $a0, $s0        # $a0 = $s0 = x
        move    $a1, $t1        # $a1 = $t1 = y
        jal     add_nums        # call the add_nums() function
        
        move    $t2, $v0        # $t2 = sum (return value)

        li      $v0, 1          # printf("%d", sum);
        move    $a0, $t2
        syscall
        
        li      $v0, 11         # print("%c", '\n')
        li      $a0, '\n'
        syscall
        
        li      $v0, 1          # printf("%d", sum);
        move    $a0, $s0
        syscall
        
        li      $v0, 11         # print("%c", '\n')
        li      $a0, '\n'
        syscall

main__epilogue:
        lw      $ra, 0($sp)     # Do the prologue operations in reverse
        lw      $s0, 4($sp)
        addi    $sp, $sp, 8     # Restore the stack pointer
        
        li      $v0, 0          # return 0
        jr      $ra
        
add_nums:
        # x is in $a0 & y is in $a1
        add     $t0, $a0, $a1   # $t0 = $a0 + $a1 = x + y
        move    $v0, $t0        # $v0 = $t0 = sum
        jr      $ra             # return $v0 = sum
        