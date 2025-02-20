#ifndef FUNCTION_H
#define FUNCTION_H

#include <math.h>


class Function {
public:
    double operator() (const double input) {
        return (sin(input) - pow(input, 2) - 3 * input + 14);
    }
};

#endif // FUNCTION_H
