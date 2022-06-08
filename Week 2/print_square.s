        .text
main:
        # Registers:
        # x = $t0
        # y = $t1

        la         $a0, prompt
        li        $v0, 4
        syscall                            # printf("Enter a number: ");

        li        $v0, 5                   # scanf("%d", &x);
        syscall                            # The value scanned in is in $v0
        move        $t0, $v0               # x = $t0 = scanned value (don't forget to do this)

        mul        $t1, $t0, $t0           # y = $t1 = x * x;

        move        $a0, $t1               # printf("%d", y);
        li        $v0, 1
        syscall

        li        $a0, '\n'                # printf("%c", '\n');
        li        $v0, 11
        syscall

        li        $v0, 0                   # return 0;
        jr        $ra

        .data
prompt:
        .asciiz "Enter a number: "
        