#ifndef LOBACHEVSKYMETHOD_H
#define LOBACHEVSKYMETHOD_H

#include <iostream>
#include <set>
#include <complex>

#include "equation.h"

class LobachevskyMethod {
public:
    explicit LobachevskyMethod(Equation equation, int degree)
        : m_equation(equation)
        , m_degree(degree)

    {
        auto newSize = m_equation.getCoefs().size();

        m_quadrizationMatrix.resize(degree);
        for(int i = 0; i < degree; ++i) {
            m_quadrizationMatrix[i].resize(newSize);
        }


    }

    void calculateQuadrizationMatrix() {
        std::cout << "Степень процессса квадратирования: " << m_degree << std::endl;
        std::cout << "Таблица коэффициентов: " << std::endl;
        for(int i = 0; i < m_equation.getCoefs().size(); ++i) {
            m_quadrizationMatrix[0][i] = m_equation.getCoefs()[i];
        }

        for(int i = 1; i < m_degree; ++i) {
            m_quadrizationMatrix[i][0] = pow(m_quadrizationMatrix[i - 1][0], 2);
            m_quadrizationMatrix[i][3] = pow(m_quadrizationMatrix[i - 1][3], 2);
            for(int j = 1; j < 3; ++j) {
                m_quadrizationMatrix[i][j] = pow(m_quadrizationMatrix[i - 1][j], 2) -
                                             2 * m_quadrizationMatrix[i - 1][j - 1] * m_quadrizationMatrix[i - 1][j + 1];
                if(m_quadrizationMatrix[i][j] < 0 && m_comlexRootsIndexes.find(j) == m_comlexRootsIndexes.end()) {
                    m_comlexRootsIndexes.insert(j);
                    std::cout << "Коэффициент " << j <<
                        " меняет знак в процессе квадрирования => корни " << j <<
                        " и " << j + 1 << " - пара комплекстно сопряженных корней " << std::endl;
                }
            }
        }
    }

    std::vector<long double> operator() () {
        std::vector<long double> result(m_quadrizationMatrix[0].size() - 1);

        int resSize = result.size();
        long double rootDegree = pow(2, m_degree - 1);
        int startComplex = -1;
        for(int i = 1; i < resSize + 1; ++i) {
            result[i - 1] = fabs(m_quadrizationMatrix[m_degree - 1][i] / m_quadrizationMatrix[m_degree - 1][i - 1]);
            result[i - 1] = pow(result[i - 1], 1/rootDegree);

            if(fabs(m_equation(result[i - 1])) > fabs(m_equation(-result[i - 1]))) {
                result[i - 1] = -result[i - 1];
            }

            if(!m_comlexRootsIndexes.empty()) {
                startComplex = i + 1;
                break;
            }
        }

        if(startComplex != -1) {
            // x2 = r(cos(p) + isin(p))
            // x3 = r(cos(p) - isin(p))
            long double r = fabs(m_quadrizationMatrix[m_degree - 1][startComplex + 1] /
                                 m_quadrizationMatrix[m_degree - 1][startComplex - 1]);
            r = pow(r, 1/(2 * rootDegree));

            long double cosP = (-(m_equation.getCoefs()[1] / m_equation.getCoefs()[0]) + fabs(*result.begin())) / (2 * r);
            long double sinP = sqrt(1 - pow(cosP, 2));

            std::cout << "Корни полинома: ";
            std::cout << *result.begin() << ", ";
            long double real = r * cosP;
            long double imag = r * sinP;
            std::cout << real << " + " << imag << "*i" << ", ";
            std::cout << real << " - " << imag << "*i" << '\n';

            std::cout << std::endl;
        }

        return result;
    }

    void printQuadrizationMatrix() const {
        for(int i = 0; i < m_quadrizationMatrix.size(); ++i) {
            std::cout << '|';
            for(int j = 0; j < m_quadrizationMatrix[i].size(); ++j) {
                std::cout << m_quadrizationMatrix[i][j] << ' ';
            }
            std::cout << '|' << std::endl;
        }

        std::cout << std::endl;
    }

private:
    int m_degree = 0;
    Equation m_equation;
    std::set<int> m_comlexRootsIndexes;

    std::vector<std::vector<long double>> m_quadrizationMatrix;
};

#endif // LOBACHEVSKYMETHOD_H
