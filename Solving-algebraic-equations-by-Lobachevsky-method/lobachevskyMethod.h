#ifndef LOBACHEVSKYMETHOD_H
#define LOBACHEVSKYMETHOD_H

#include <iostream>

#include "equation.h"

class LobachevskyMethod {
public:
    explicit LobachevskyMethod(Equation equation, int degree)
        : m_equation(equation)
    {
        auto newSize = m_equation.getCoefs().size();

        m_quadrizationMatrix.resize(newSize);
        for(int i = 0; i < newSize; ++i) {
            m_quadrizationMatrix[i].resize(newSize);
        }


    }

    void calculateQuadrizationMatrix() {
        for(int i = 0; i < m_equation.getCoefs().size(); ++i) {
            m_quadrizationMatrix[0][i] = m_equation.getCoefs()[i];
        }
    }

    double operator() () {

    }

    void printQuadrizationMatrix() const {
        for(int i = 0; i < m_quadrizationMatrix.size(); ++i) {
            for(int j = 0; j < m_quadrizationMatrix[i].size(); ++j) {
                std::cout << m_quadrizationMatrix[i][j] << ' ';
            }
            std::cout << std::endl;
        }

        std::cout << std::endl;
    }

private:
    int m_degree = 0;
    Equation m_equation;

    std::vector<std::vector<double>> m_quadrizationMatrix;
};

#endif // LOBACHEVSKYMETHOD_H
