#include <stdio.h>

typedef unsigned int uint;

// float __attribute__((__cdecl__))  arctan(float x, uint k);

float __attribute__((__cdecl__)) arctan_scalar(float x, uint k);

float __attribute__((__cdecl__)) arctan_vector(float x, uint k);

int main() {
    float arg = 0.5;
    uint k = 4;
    // printf("%f\n", arctan(arg, k));
    printf("scalar: %f\n", arctan_scalar(arg, k));
    printf("vector: %f\n", arctan_vector(arg, k));

}
