#include <stdio.h>
#include <stdint.h>

uint32_t six_middle_bits(uint32_t u) {
    ____ ____ ____ _XXX XXX_ ____ ____ ____
    
    // Mask = 11 1111 = 0x3F
    // 0000 0000 0000 0111 1110 0000 0000 0000
    uint32_t mask = 0x3F << 13;
    // Bitwise AND to check if there are bits there
    // Shift to the right to force it at the end
    return (u & mask) >> 13;
    
    // Method 2
    
    // uint32_t mask = 0x3F
    // 0000 0000 0000 0000 0000 0000 0011 1111
    // return (u >> 13) & mask;
    
    // Method 3
    
    // Ignore everything to the left of the middle 6 bits
    // Shift everything to the right to force it at the end
    // return (u << 13) >> 26;
    
}