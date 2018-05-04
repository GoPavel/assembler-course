#include <stdio.h>

typedef unsigned int uint;

float __attribute__((__cdecl__))  arctan(float x, uint k);

int main() {
    float arg = 1;
    uint k = 200;
    printf("%f\n", arctan(arg, k));
}
