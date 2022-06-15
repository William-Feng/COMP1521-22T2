        .text
main:
        # Registers:
        # $t0 = i
        # $t1 = &numbers
        # $t2 = array offset
        # $t3 = &numbers[i]
        # $t4 = numbers[i]
        
        li      $t0, 0                  # i = 0

loop_condition:
        bge     $t0, 10, loop_end       # if (i >= 10) goto loop_end;
        
loop_body:
        la      $t1, numbers            # address of 'numbers'
        mul     $t2, $t0, 4             # $t2 = $t0 * 4 = i * 4 - array offset
        add     $t3, $t1, $t2           # $t3 = $t1 + $t2
        
        lw      $t4, ($t3)              # $t4 = numbers[i]
        
        li      $v0, 1                  # printf("%d", numbers[i]);
        move    $a0, $t4
        syscall
        
        li      $v0, 11                 # printf("%c", \n);
        li      $a0, '\n'
        syscall
        
        addi    $t0, $t0, 1             # i = i + 1
        j       loop_condition
        
loop_end:
        li      $v0, 0                  # return 0;
        jr      $ra
    
        .data
numbers:
        .word   3, 1, 4, 1, 5, 9, 2, 6, 5, 3
        
        # 3 = *(&numbers + 0) = numbers[0]
        # 1 = *(&numbers + 4) = numbers[1]
        # 4 = *(&numbers + 8) = numbers[2]