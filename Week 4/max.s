        .text
max:
        # Registers:
        # $a0 = a[]
        # $a1 = length
        # $s0 = first_element
        # $t0 = max_so_far

        addi    $sp, $sp, -8
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        
        lw      $s0, ($a0)
        
        bne     $a1, 1, max_case
        move    $v0, $s0
        j       end
        
max_case:
        addi    $a0, $a0, 4
        addi    $a1, $a1, -1
        jal     max
        move    $t0, $v0
        
        ble     $s0, $t0, end
        move    $t0, $s0
        
end:
        lw      $ra, 0($sp)
        lw      $s0, 4($sp)
        addi    $sp, $sp, 8
        jr      $ra
        