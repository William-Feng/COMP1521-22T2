        .text
main:
        # Registers:
        # n = $t0
        # fac = $t1
        # i = $t2

        la        $a0, print_n              # printf("n  = ");
        li        $v0, 4
        syscall

        li        $v0, 5                    # scanf("%d", &n);
        syscall
        move         $t0, $v0               # $t0 = $v0

        li        $t1, 1                    # fac = 1;
        li        $t2, 1                    # i = 1;

loop_condition:
        bgt        $t2, $t0, loop_end       # if (i > n) goto loop_end;

loop_body:
        mul        $t1, $t1, $t2            # fac = fac * i;
        addi         $t2, $t2, 1            # i = i + 1;
        b        loop_condition             # goto loop_condition;

loop_end:
        la        $a0, print_n_factorial    # printf("n!  = ");
        li        $v0, 4
        syscall

        move        $a0, $t1                # printf("%d", fac);
        li        $v0, 1
        syscall

        li        $a0, '\n'                 # printf("%c", '\n');
        li         $v0, 11
        syscall

        li        $v0, 0                    # return 0;
        jr        $ra

        .data
print_n:
        .asciiz "n  = "
print_n_factorial:
        .asciiz "n! = "
