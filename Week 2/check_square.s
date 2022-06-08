        .text
main:
        # Registers:
        # x = $t0
        # y = $t1

        la         $a0, prompt             # printf("Enter a number: ");
        li        $v0, 4
        syscall                                

        li        $v0, 5                   # scanf("%d", &x);
        syscall                                
        move        $t0, $v0                

check_number:
        ble        $t0, 46340, square      # if (x <= 46340) goto square;
        
        la         $a0, too_big            # printf("square too big for 32 bits\n");
        li        $v0, 4
        syscall                                

        b         finished                 # goto finished;

square:
        mul        $t1, $t0, $t0           # y = $t1 = x * x;

        move        $a0, $t1               # printf("%d", y);
        li        $v0, 1
        syscall

        li        $a0, '\n'                # printf("%c", '\n');
        li        $v0, 11
        syscall

finished:
        li        $v0, 0                   # return 0;
        jr        $ra

        .data
prompt:
        .asciiz "Enter a number: "
too_big:
        .asciiz "square too big for 32 bits\n"