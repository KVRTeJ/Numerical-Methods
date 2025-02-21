#ifndef EQUATION_H
#define EQUATION_H

#include <math.h>
#include <vector>

class Equation {
public:
    Equation(std::vector<double> coefs = {2.5, 0.3, -2, 1})
        : m_coefs(coefs)
    {}

    std::vector<double> getCoefs() const {return m_coefs;}

    double operator() (const double x) {
        return (2.5 * pow(x, 3) + 0.3 * pow(x, 2) - 2 * x + 1);
    }

private:
    std::vector<double> m_coefs;
};

#endif // EQUATION_H
