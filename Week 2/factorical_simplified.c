// Simple factorial calculator  - without error checking

#include <stdio.h>

int main (void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);

    int fac = 1;
    int i = 1;

    loop_condition:
        if (i > n) goto loop_end;
    loop_body:
        fac = fac * i;
        i = i + 1;
        goto loop_condition;

    loop_end:
        printf("n! = ");
        printf("%d", fac);
        printf("%c", '\n');
        return 0;
}