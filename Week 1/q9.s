# int main(void) {
#     int x, y;
#     printf("We have two variables\n");

#     return 0;
# }

    .text
main:
    # Registers
    # $t0 = x
    # $t1 = y

    li    $t0,   0      # $t0 = 0 (int x = 0)
    li    $t1,   0      # $t1 = 0 (int y = 0)

    # Print out the message
    la    $a0, message  # $a0 = message = "We have two variables\n"
    li    $v0,   4      # $v0 = 4 (load in the special values to print)
    syscall

    li    $v0, 0        # return 0
    jr    $ra

    .data
message:
    .asciiz "We have two variables\n"