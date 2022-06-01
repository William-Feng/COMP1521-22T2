#include <stdio.h>

void print_array(int nums[], int len, int counter) {
    // Base case (this is where we exit the recursion)
    if (counter == len) {
        return;
    }

    // Recursive case (we want to print out one element at a time)
    printf("%d\n", nums[counter]);
    print_array(nums, len, counter + 1);
}

int main(void)
{
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    print_array(nums, 10, 0);

    return 0;
}

/*
print_array(nums, 10, 0);
printf("%d\n", nums[0]);     3
print_array(nums, 10, 1);
printf("%d\n", nums[1]);     1
print_array(nums, 10, 2);
printf("%d\n", nums[2]);     4
...
...
printf("%d\n", nums[9]);     3 (last digit in array)
print_array(nums, 10, 10)    return (exit the recursive function)
*/