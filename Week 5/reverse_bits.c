#include <stdio.h>
#include <assert.h>

typedef unsigned int Word;

/*

e.g. 1010 --> reverseBits() --> 0101

input = 1010
output (initially) = 0000

1. Extract each bit
2. Check if result is 0 or 1
3. If result is not 0, set it in the return value

1010
0001 &
------
0000 == 0 --> rightmost bit is a 0 (we don't need to do anything)

// Extracting
1010
0010 &
------
0010 != 0 --> second rightmost bit is a 1

// Setting
0000
0100 |
--------
0100 (new output)

1010
0100 & 
-------
0000 == 0 --> third rightmost bit is a 0 (we don't need to do anything)

// Extracting
1010
1000 &
--------
1000 != 0 --> fourth rightmost bit (leftmost bit) is a 1

// Setting
0100
0001 |
--------
0101 --> Final Answer
*/

// Note:
// If you want to check/extract something, use the bitwise AND operator, &
// If you want to set/update something, use the bitwise OR operator, |

Word reverseBits(Word w) {
    
    // Output is set to 0 initially (we can update it along the way)
    Word output = 0;
    
    for (int i = 0; i < 32; i++) {
        // Extract the bit
        
        // Extracting mask:
            // First iteration --> 0000 ... 0001
            // Second iteration --> 0000 ... 0010
            // Third iteration --> 0000 ... 0100
        
        // Note that we want use '1u' (positive signed value) to prevent it
        // overflowing the maximum capacity of a 32 bit integer
        Word extractingMask = 1u << i;
        Word result = w & extractingMask;
        
        // Check if the result is a 1 or a 0
        
        // If the result is not a 0, then 
        // we need to update the output
        
        if (result != 0) {
            // Setting mask:            
                // First iteration --> 1000 ... 0000   (1 << 31)
                // Second iteration --> 0100 ... 0000  (1 << 30)
                // Third iteration --> 0010 ... 0000   (1 << 29)
                // Last iteration --> 0000 ... 0001    (1 << 0)
            
            Word settingMask = 1u << (31 - i);
            output = output | settingMask;
        }
        
    }

    return output;
}



// Testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}
