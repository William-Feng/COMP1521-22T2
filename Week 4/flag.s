        .text
main:
        # Registers
        # $t0 = row
        # $t1 = col
        # $t2 = &flag
        # $t4 = flag[row][col]
        
        li      $t0, 0                  # int row = 0;

row_loop_condition:
        bge     $t0, 6, row_loop_end    # if (row >= 6) goto row_loop_end;
        
row_loop_body:
        li      $t1, 0
        
col_loop_condition:
        bge     $t1, 12, col_loop_end   # if (col >= 12) goto col_loop_end;
        
col_loop_body:
        la      $t2, flag
                                
        mul     $t3, $t0, 12            # $t3 = row * 12
        add     $t3, $t3, $t1           # $t3 = $t3 + col
        # mul     $t3, $t3, 1           # $t3 = (row * row_size + col) * element_size
        add     $t3, $t2, $t3           # $t3 = &flag[row][col]
        
        lb      $t4, ($t3)              # $t4 = flag[row][col]
        
        li      $v0, 11
        move    $a0, $t4
        syscall
        
        addi    $t1, $t1, 1             # col = col + 1
        j       col_loop_condition

col_loop_end:
        li      $v0, 11
        li      $a0, '\n'
        syscall
        
        addi    $t0, $t0, 1             # row = row + 1
        j       row_loop_condition

row_loop_end:   
end:    
        li      $v0, 0                  # return 0;
        jr      $ra
        
        .data
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
