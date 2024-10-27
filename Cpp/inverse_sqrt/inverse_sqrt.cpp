#include <cstdint>
#include <iostream>
#include <stdint.h>

class InverseSqrt {
    public:
        float Q_rsqrt(float number) {
            long i;
            float x2, y;
            const float threehalfs = 1.5F;
            
            x2 = number * 0.5F;
            y = number;
            i = * ( long * ) &y;                        // evil floating point bit level hacking
            i = 0x5f3759df - ( i >> 1 );                // what the fuck?
            y = * ( float * ) &i;
            y = y * ( threehalfs - ( x2 * y * y ) );    // first iteration
            y = y * ( threehalfs - ( x2 * y * y ) );    // 2nd iteration, this can be removed
            
            return y;
        }
        float Q_rsqrt_union(float number) {
            union {
                float       f;
                uint32_t    i;
            } conv = { .f = number };
            conv.i = 0x5f3759df - (conv.i >> 1);
            conv.f *= 1.5F - (number * 0.5F * conv.f * conv.f);
            return conv.f;
        }
};

int main() {
    InverseSqrt quake;
    std::cout << quake.Q_rsqrt(1.5F) << std::endl;

    std::cout << quake.Q_rsqrt_union(2.0F) << std::endl;
}
