#include <stdio.h>

int main(void) {
    int i;
    int numbers[10] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};

    i = 0;
    while (i < 10) {
        printf("%d\n", numbers[i]);
        i++;
    }
    
    return 0;
}