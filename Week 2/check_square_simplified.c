#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    check_number:
        if (x <= 46340) goto square;
        
        printf("square too big for 32 bits\n");
        goto finished;

    square:
        y = x * x;
        printf("%d\n", y);

    finished:

    return 0;
}