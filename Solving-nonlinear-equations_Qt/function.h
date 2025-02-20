#ifndef FUNCTION_H
#define FUNCTION_H

#include <math.h>

class Function {
public:
    double getFirstCanonForm(const double input) const {
        return acos(pow(input, 2) + 3 * input - 14);
    }

    double getSecondCanonForm(const double input) const {
        return sqrt(sin(input) - 3 * input + 14);
    }

    double getThirdCanonForm(const double input) const {
        return (sin(input) / 3 - pow(input, 2) / 3 + 14/3);
    }

    double operator() (const double input) const {
        return (sin(input) - pow(input, 2) - 3 * input + 14);
    }
};

#endif // FUNCTION_H
